import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user_model.dart';
import 'constants.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: APIDemo());
  }
}

class APIDemo extends StatefulWidget {
  const APIDemo({super.key});

  @override
  State<APIDemo> createState() => _APIDemoState();
}

class _APIDemoState extends State<APIDemo> {
  List<UserModel>? _userModel = []; //might be null now '?'

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    //write a function to get the data
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService()
        .getUsers())!; //assert that this object is not null at that instance
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listing users from REST API')),
      body: _userModel == null || _userModel!.isEmpty ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].name),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].email),
                          Text(_userModel![index].website),
                          Text(_userModel![index].address.street),
                          Text(_userModel![index].company.name),
                        ],
                      ),
                    ],
                  ),
                );
              },
          ),
    );
  }
}
