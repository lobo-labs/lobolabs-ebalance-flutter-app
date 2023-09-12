import 'package:flutter/material.dart';

class CustomerList extends StatelessWidget {

  var items = [1, 2, 3, 4, 5, 6];

  CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: const [
          SizedBox(height: 8),
          // SearchBar(),
          SizedBox(height: 8),
          // List.generate(items.length, (index) => {
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: const Text("teste")
          // })
        ],
      ),
    );
  }
}
