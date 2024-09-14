import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(color: Colors.black),
              child: const Image(
                image: AssetImage("assets/img/No Hay Ley.jpg"),
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
