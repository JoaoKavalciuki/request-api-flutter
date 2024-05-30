import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:request_api/OpenlibraryRequest.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController isbnTextEditingController = TextEditingController();
  String _imageURL = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: isbnTextEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Informe o ISBN do livro desejado"
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    var isbn = isbnTextEditingController.text;
                    _imageURL = "https://covers.openlibrary.org/b/isbn/$isbn-M.jpg";
                  });
                },
                child: Text("Enviar")
            ),
            _imageURL != "" ? Image.network(_imageURL) : Text("Informe um ISBN!")
          ],
        ),
      )
    );
  }
}
