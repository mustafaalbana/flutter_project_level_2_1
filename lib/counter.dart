// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';


class Counter extends StatelessWidget {
  final int allTodos;
  final int allCompleted;

  const Counter({Key? key, required this.allCompleted, required this.allTodos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text("$allCompleted/$allTodos",
          style: TextStyle(
              fontSize: 44,
               color: allCompleted == allTodos ?   Color.fromARGB(255, 142, 253, 200)  :  Colors.white, 
               
               fontWeight: FontWeight.bold)),
    );
  }
}
