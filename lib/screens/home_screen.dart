import 'package:flutter/material.dart';


void main(){
runApp(MaterialApp( 
  debugShowCheckedModeBanner: false,
  home: Scaffold( 
    appBar: AppBar( 
      title: const Text('DevProfileM3'),
    ),
    body: const Center(
      child: Text('Profile Card'),
    ),
    floatingActionButton: FloatingActionButton(onPressed:  
    (){
    },
    child: Icon(Icons.add),
    ),
  ),
),
);
}


