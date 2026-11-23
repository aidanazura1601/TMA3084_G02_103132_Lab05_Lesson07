import 'package:flutter/material.dart';

void main() {
  runApp(const LabBApp());
}

class LabBApp extends StatelessWidget {
  const LabBApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab B: DataTable',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const CarTablePage(),
    );
  }
}

class Car {
  const Car({required this.carMake, required this.model, required this.price});

  final String carMake;
  final String model;
  final double price;
}

const List<Car> initialCars = [
  Car(carMake: 'Honda', model: '2021', price: 35000.0),
  Car(carMake: 'Toyota', model: '2011', price: 6000.0),
  Car(carMake: 'BMW', model: '2010', price: 9000.0),
];

class CarTablePage extends StatefulWidget {
  const CarTablePage({super.key});

  @override
  State<CarTablePage> createState() => _CarTablePageState();
}

class _CarTablePageState extends State<CarTablePage> {
  final List<Car> _cars = List.of(initialCars);
  int? _sortColumnIndex;
  bool _sortAscending = true;

  void _sort(
    int columnIndex,
    bool ascending,
    int Function(Car a, Car b) compare,
  ) {
    setState(() {
      _cars.sort((a, b) => ascending ? compare(a, b) : compare(b, a));
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Price List'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(
                label: const Text('Car Make'),
                onSort: (index, ascending) => _sort(
                  index,
                  ascending,
                  (a, b) => a.carMake.compareTo(b.carMake),
                ),
              ),
              DataColumn(
                label: const Text('Model'),
                onSort: (index, ascending) => _sort(
                  index,
                  ascending,
                  (a, b) => a.model.compareTo(b.model),
                ),
              ),
              DataColumn(
                label: const Text('Price'),
                numeric: true,
                onSort: (index, ascending) => _sort(
                  index,
                  ascending,
                  (a, b) => a.price.compareTo(b.price),
                ),
              ),
            ],
            rows: [
              for (final car in _cars)
                DataRow(
                  cells: [
                    DataCell(Text(car.carMake)),
                    DataCell(Text(car.model)),
                    DataCell(Text(car.price.toStringAsFixed(1))),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
