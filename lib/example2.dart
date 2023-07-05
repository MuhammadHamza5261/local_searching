

import 'package:flutter/material.dart';



class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                title: Text('Flutter Apply Search on ListView')
            ),
            body: Center(
                child: ListSearch()
            )
        )
    );
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {

  TextEditingController _textController = TextEditingController();


  bool isVisible2 = true;

  static List<String> mainDataList = [
    "Apple",
    "Apricot",
    "Banana",
    "Blackberry",
    "Coconut",
    "Date",
    "Fig",
    "Gooseberry",
    "Grapes",
    "Lemon",
    "Litchi",
    "Mango",
    "Orange",
    "Papaya",
    "Peach",
    "Pineapple",
    "Pomegranate",
    "Starfruit"
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: (){
                setState(() {
                  if(isVisible2 == true){}
                });
              },
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(

                  hintText: 'Search Here...',
                ),
                onChanged: onItemChanged,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Visibility(
            visible: isVisible2,
            child: Expanded(
              child: ListView(
                padding: EdgeInsets.all(12.0),
                children: newDataList.map((data) {
                  return ListTile(
                    title: Text(data),
                    onTap: ()=> print(data),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}