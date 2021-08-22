import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:movieapp/data/data_sources/movie_remote_datasource.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  Client apiClient = Client();
  MoveRemoteDataSource dataSource = MoveRemoteDataSourceImpl(apiClient);
  dataSource.getTrending();
  dataSource.getPopular();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(),
    );
  }
}
