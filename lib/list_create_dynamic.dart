import 'main.dart';
import 'package:flutter/material.dart';
class ListCreateSTL extends StatelessWidget {
  const ListCreateSTL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListCreateSTF(),
    );
  }
}
///stf
class ListCreateSTF extends StatefulWidget {
  const ListCreateSTF({Key? key}) : super(key: key);

  @override
  State<ListCreateSTF> createState() => _ListCreateSTFState();
}

class _ListCreateSTFState extends State<ListCreateSTF> {
  ///create a list dynamically
  List<String> dynamiclist = [
    "Flutter",
    "React Native",
    "Java",
    "Kotlin",
  ];

  late double height;
  late double width;


  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dynamiclist.length,
              itemBuilder: (BuildContext context, int i){
                return ListTile(
                  title: Text(dynamiclist[i]),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

