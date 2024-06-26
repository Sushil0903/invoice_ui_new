import 'package:flutter/material.dart';
import 'List.dart';
import 'Home_page.dart';
import 'my_pdf.dart';

void main(){
  runApp(Myapp());
}


class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: "/",
      routes: {
        "/":(context) => homepage(),
        "my_pdf":(context) => Mypdf(),
      },
    );
  }
}


