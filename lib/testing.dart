import 'package:flutter/material.dart';

class TextFieldTesting extends StatelessWidget {
  const TextFieldTesting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("This is testing"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                onChanged: (text) {
                  print("this is onChange======> $text");
                },
              )
            ],
          ),
        ));
  }
}
