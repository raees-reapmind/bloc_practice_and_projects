import 'package:flutter/material.dart';

import 'bloc_projects/features/home/ui/home.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      home: Home(),
    );
  }
}