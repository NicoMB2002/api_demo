import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';
import 'constants.dart';
import 'api_service.dart';

void main() {
  runApp(const TodosApp());
}

class TodosApp extends StatefulWidget {
  const TodosApp({super.key});

  @override
  State<TodosApp> createState() => _TodosAppState();
}

class _TodosAppState extends State<TodosApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodosDemo(),
    );
  }
}

class TodosDemo extends StatefulWidget {
  const TodosDemo({super.key});

  @override
  State<TodosDemo> createState() => _TodosDemoState();
}

class _TodosDemoState extends State<TodosDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos Display'),
      ),
    );
  }
}
