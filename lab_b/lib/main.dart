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
  final TextEditingController _searchController = TextEditingController();
  String _query = '';
  int? _sortColumnIndex;
  bool _sortAscending = true;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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

  void _onSearchChanged(String value) {
    setState(() {
      _query = value.trim().toLowerCase();
    });
  }

  List<Car> get _visibleCars {
    if (_query.isEmpty) {
      return _cars;
    }
    return _cars
        .where((car) => car.carMake.toLowerCase().contains(_query))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final visibleCars = _visibleCars;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Price List'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 400,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      labelText: 'Search by Car Make',
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                      suffixIcon: _query.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              tooltip: 'Clear search',
                              onPressed: () {
                                _searchController.clear();
                                _onSearchChanged('');
                              },
                            ),
                    ),
                  ),
                ),
              ),
              DataTable(
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
                  for (final car in visibleCars)
                    DataRow(
                      cells: [
                        DataCell(Text(car.carMake)),
                        DataCell(Text(car.model)),
                        DataCell(Text(car.price.toStringAsFixed(1))),
                      ],
                    ),
                ],
              ),
              if (visibleCars.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('No cars match your search.'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
