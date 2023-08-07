import 'package:flutter/material.dart';

import 'models/item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginPage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var items = <Item>[];

  MyHomePage({super.key}) {
    items = [];
    items.add(Item(title: 'Dart', done: true));
    items.add(Item(title: 'Web Api Dotnet', done: false));
    items.add(Item(title: 'Angular', done: true));
    items.add(Item(title: 'React', done: false));
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var newTaskCtrl = TextEditingController();

  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(Item(title: newTaskCtrl.text, done: false));
      newTaskCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ignore: prefer_const_constructors
        title: TextFormField(
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          // ignore: prefer_const_constructors  
          decoration: InputDecoration(
              labelText: "Adicionar nova tarefa",
              // ignore: prefer_const_constructors
              labelStyle: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: add,
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (ctxt, index) {
          final item = widget.items[index];
          return Dismissible(
            // ignore: sort_child_properties_last
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value!;
                });
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.8),
            ),
          );
        },
      ),
    );
  }
}
