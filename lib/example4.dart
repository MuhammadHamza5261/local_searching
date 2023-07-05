import 'main.dart';
import 'package:flutter/material.dart';
///stl
class Example4 extends StatelessWidget {
  const Example4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExampleSTF(),
    );
  }
}
///stf
class ExampleSTF extends StatefulWidget {
  const ExampleSTF({Key? key}) : super(key: key);

  @override
  State<ExampleSTF> createState() => _ExampleSTFState();
}

class _ExampleSTFState extends State<ExampleSTF> {
  List<String> items = ['Apple', 'Banana', 'Orange', 'Pineapple', 'Mango'];
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
            ),
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
          ),
          Column(
            children: [
              Text('${items.where((item) => item.contains(searchText)).length} items found'),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.where((item) => item.contains(searchText)).length,
                itemBuilder: (BuildContext context, int index) {
                  final filteredItems = items.where((item) => item.contains(searchText)).toList();
                  return ListTile(
                    title: Text(filteredItems[index]),
                  );
                },
              ),
            ],
          ),


        ],
      ),
    );
  }
}

