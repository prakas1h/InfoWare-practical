import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/Detailed.dart';

class Datafatchapi extends StatefulWidget {
  const Datafatchapi({super.key});

  @override
  State<Datafatchapi> createState() => _DatafatchapiState();
}

class _DatafatchapiState extends State<Datafatchapi> {
  @override
  void initState() {
    Fatchapi();
    super.initState();
  }

  List photos = [];
  // ignore: non_constant_identifier_names
  Future Fatchapi() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=20"), headers: {
      "Authorization": "563492ad6f91700001000001c6eb06582cad47b68d89c11fa54d3107"
    }).then((value) {
      Map data = jsonDecode(value.body);

      setState(() {
        photos = data["photos"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Imagesh"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: GridView.builder(
            itemCount: photos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detailed(
                          intids: photos[index]["photographer_id"],
                          ids: photos[index]["photographer_url"],
                          name: photos[index]["url"],
                          smallphotos: photos[index]["src"]["medium"]),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(
                            photos[index]["src"]["medium"],
                          ),
                          fit: BoxFit.cover),
                      boxShadow: [BoxShadow(offset: Offset(0.5, 0.5), blurRadius: 0.5)]),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
