import 'package:flutter/material.dart';
import 'package:task/Authantications.dart';
import 'package:task/Datafatchapi.dart';

class Loginpages extends StatefulWidget {
  const Loginpages({super.key});

  @override
  State<Loginpages> createState() => _LoginpagesState();
}

class _LoginpagesState extends State<Loginpages> {
  bool singup = true;
  final _fromkey = GlobalKey<FormState>();
  String name = "";
  String gender = "";
  String email = "";
  String city = "";
  String country = "";
  String phonenumber = "";
  String state = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _fromkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "Name"),
                key: const ValueKey("name"),
                validator: (value) {
                  if (value.toString().length < 2) {
                    return "Enter a true name";
                  } else {
                    return null;
                  }
                },
                onSaved: (Value) {
                  setState(
                    () {
                      name = Value.toString();
                    },
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "email"),
                key: const ValueKey("email"),
                validator: (value) {
                  if (!value.toString().contains("@")) {
                    return "Enter a Valid email";
                  } else {
                    return null;
                  }
                },
                onSaved: (Value) {
                  setState(
                    () {
                      email = Value.toString();
                    },
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "gender"),
                key: const ValueKey("gender"),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Enter a gender";
                  } else {
                    return null;
                  }
                },
                onSaved: (Value) {
                  setState(
                    () {
                      gender = Value.toString();
                    },
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "city"),
                key: const ValueKey("city"),
                validator: (value) {
                  if (value.toString().length < 1) {
                    return "Enter city name";
                  } else {
                    return null;
                  }
                },
                onSaved: (Value) {
                  setState(
                    () {
                      city = Value.toString();
                    },
                  );
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(border: OutlineInputBorder(), hintText: "country"),
                key: const ValueKey("country"),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "Enter a country name";
                  } else {
                    return null;
                  }
                },
                onSaved: (Value) {
                  setState(
                    () {
                      country = Value.toString();
                    },
                  );
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(border: OutlineInputBorder(), hintText: "phonenumber"),
                key: const ValueKey("phonenumber"),
                validator: (value) {
                  if (value.toString().length < 10) {
                    return "Enter phonenumber";
                  } else {
                    return null;
                  }
                },
                onSaved: (Value) {
                  setState(
                    () {
                      phonenumber = Value.toString();
                    },
                  );
                },
              ),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: "state"),
                key: const ValueKey("state"),
                validator: (value) {
                  if (value.toString().length < 2) {
                    return "Enter phonenumber";
                  } else {
                    return null;
                  }
                },
                onSaved: (Value) {
                  setState(
                    () {
                      state = Value.toString();
                    },
                  );
                },
              ),
              SizedBox(
                height: 30,
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    if (_fromkey.currentState!.validate()) {
                      _fromkey.currentState!.save();
                      singup
                          ? Authantications.singup(
                              context, name, gender, email, city, country, phonenumber, state)
                          :const Text("no any data");
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
              SizedBox(
                height: 30,
                width: 400,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>const Datafatchapi()));
                    },
                    child:const Text("Skip")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
