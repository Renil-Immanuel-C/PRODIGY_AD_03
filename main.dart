// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> todoList = [];
  String singlevalue = "";

  void addString(String content) {
    setState(() {
      singlevalue = content;
    });
  }

  void addList() {
    setState(() {
      todoList.add({"value": singlevalue});
      singlevalue = ""; // Clear the input field after adding
    });
  }

  void deleteItem(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Color.fromRGBO(250, 229, 211, 1.0),
        centerTitle: true,
        toolbarHeight: 75,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      backgroundColor: Color.fromRGBO(250, 229, 211, 1.0),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.black54,
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 80,
                              child: Text(
                                todoList[index]['value']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 20,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromRGBO(250, 229, 211, 0.2),
                                child: TextButton(
                                  onPressed: () {
                                    deleteItem(index);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Color.fromRGBO(255, 111, 111, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        onChanged: (content) {
                          addString(content);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fillColor: Colors.black54,
                          filled: true,
                          labelText: 'Create Task....',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 27,
                    child: ElevatedButton(
                      onPressed: singlevalue.isEmpty ? null : addList,
                      child: Container(
                        height: 15,
                        alignment: Alignment.center,
                        child: Text("Add"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
