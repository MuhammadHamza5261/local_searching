import 'main.dart';
import 'package:flutter/material.dart';

///stl
class FirstWebSTL extends StatelessWidget {
  const FirstWebSTL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FirstWebSTF(),
    );
  }
}

///stf
class FirstWebSTF extends StatefulWidget {
  const FirstWebSTF({Key? key}) : super(key: key);

  @override
  State<FirstWebSTF> createState() => _FirstWebSTFState();
}

class _FirstWebSTFState extends State<FirstWebSTF> {
  ///create a lists of items that will be show in listview

  List<String> suggestions = [
    "Nadolol 20 mg Oral Tablet",
    "Panadol 10 mg Oral Tablet",
    "Getz 50mg Oral Tablet",
    "Panadol 100mg red tablet",
    "Calpol Syrup 500ml",
    "Flajyl 500ml",
  ];


  List<String> filteredItems = [];


  final TextEditingController _controller = TextEditingController();
  bool _showCancelIcon = false;
  bool showList = false;
  bool _isvisible3 = false;
  String message = '';



   late double height;
   late double width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width *0.8,
              height: MediaQuery.of(context).size.height *0.08,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: _controller,
                      onChanged: (value) {
                        setState(() {
                          if(_isvisible3 = false){}
                          showList = value.isNotEmpty;
                          filteredItems = suggestions.where((item) => item.toLowerCase().contains(value.toLowerCase())).toList();
                          _showCancelIcon = value.isNotEmpty;
                          ///apply error msg when user enter wrong medicine name
                          if (value.isEmpty) {
                            showList = false;
                            message = '';
                          }
                          else {
                            showList = true;
                            filteredItems = suggestions.where((item) => item.toLowerCase().contains(value.toLowerCase())).toList();
                            if (filteredItems.isEmpty) {
                              message = 'No results found';
                            } else {
                              message = '';
                            }
                          }
                        });
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.medical_information,color: Colors.blue,size: 30.0,),
                        hintText: 'Search...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 30.0,top: 18.0,),
                      ),
                    ),

                  ),
                  if (_showCancelIcon)
                    IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          if(showList = false){}
                          if(_isvisible3=true){}
                          _controller.clear();
                          _showCancelIcon = false;
                        });
                      },
                    ),
                ],
              ),
              ///auto-complete
              //   child: Autocomplete(
              //
              //                 optionsBuilder: (TextEditingValue textEditingValue) {
              //
              //                   if (textEditingValue.text == '') {
              //                     return const Iterable<String>.empty();
              //                   }
              //
              //                   else{
              //                     List<String> matches = <String>[];
              //                     matches.addAll(suggestons);
              //
              //                     matches.retainWhere((s){
              //                       return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
              //                     });
              //                     return matches;
              //                   }
              //                 },
              //                 // onSelected: (String selection){
              //                 //   print('You just selected $selection');
              //                 // }
              //
              //
              //
              //
              //
              //               ),

            ),

          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(
                  margin: const EdgeInsets.only(left: 130.0,),
                  child: const  Text('What route?',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  margin: const  EdgeInsets.only(right: 130.0,),
                  child: const  Text('Add to List',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ///Lists
          SizedBox(
            height: 50.0,
          ),
         ///list view to get list
         //  Container(
         //    height: MediaQuery.of(context).size.height *0.5,
         //    child: ListView.builder(
         //      itemCount: suggestons.length,
         //      itemBuilder: (context,i){
         //        SizedBox(
         //          height: 20.0,
         //        );
         //        return  Container(
         //          height: MediaQuery.of(context).size.height *0.08,
         //          width: MediaQuery.of(context).size.width *0.8,
         //          decoration: BoxDecoration(
         //            color: Colors.grey
         //          ),
         //          child: Text(suggestons[i]),
         //        );
         //
         //      },
         //    ),
         //  ),

      //
      // Column(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(left: 25.0,top: 12.0),
      //       width: MediaQuery.of(context).size.width *0.8,
      //       height: MediaQuery.of(context).size.height *0.08,
      //       color: Colors.grey,
      //       child: const Text('Nadolol 20 mg Oral Tablet',
      //         style: TextStyle(
      //           fontSize: 21.0,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10.0,
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(left: 25.0,top: 12.0),
      //       width: MediaQuery.of(context).size.width *0.8,
      //       height: MediaQuery.of(context).size.height *0.08,
      //       color: Colors.grey,
      //       child: const Text('Panadol 10 mg Oral Tablet',
      //         style: TextStyle(
      //           fontSize: 21.0,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10.0,
      //     ),
      //     Container(
      //       padding: EdgeInsets.only(left: 25.0,top: 12.0),
      //       width: MediaQuery.of(context).size.width *0.8,
      //       height: MediaQuery.of(context).size.height *0.08,
      //       color: Colors.grey,
      //       child: const Text('Getz 50 mg Oral Tablet',
      //         style: TextStyle(
      //           fontSize: 21.0,
      //           fontWeight: FontWeight.w500,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10.0,
      //     ),
      //
      //   ],
      // );
          Visibility(
            visible: showList,
            child: Container(
              decoration: const BoxDecoration(
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(filteredItems[index]),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: _isvisible3,
            child: const Center(
              child: Text('Nothing to show list',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
