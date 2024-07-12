import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // good stating point for app with many screens, useful to add a title and a body content
      appBar: AppBar( // app bar is a header that is displayed at the top of the screen
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( // layout of the grid
          crossAxisCount: 2, // number of columns
          childAspectRatio: 3 / 2, // aspect ratio of each grid item
          crossAxisSpacing: 20, // space between columns
          mainAxisSpacing: 20, // space between rows
        ),
        children: const [
          Text('data 1', style: TextStyle(color: Colors.white),),
          Text('data 2', style: TextStyle(color: Colors.white),),
          Text('data 3', style: TextStyle(color: Colors.white),),
          Text('data 4', style: TextStyle(color: Colors.white),),
          Text('data 5', style: TextStyle(color: Colors.white),),
          Text('data 6', style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}