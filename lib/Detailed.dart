import 'package:flutter/material.dart';

class Detailed extends StatelessWidget {
  final String name, smallphotos, ids;
  final int intids;
  const Detailed({
    super.key,
    required this.name,
    required this.smallphotos,
    required this.ids,
    required this.intids,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: NetworkImage(smallphotos), fit: BoxFit.cover),
            ),
          ),
          Text("photos Uri:  $name", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Text("photographer Name:  $ids", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20,
          ),
          Text(
            "photographer Id:  $intids",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
