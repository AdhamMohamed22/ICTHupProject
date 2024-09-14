import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey,
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          "assets/img/No Hay Ley.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text(
                        "NO Hay Ley",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        "Kali Uchis",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      trailing: const Icon(
                        Icons.play_circle,
                        size: 30,
                        color: Color.fromARGB(255, 53, 86, 54),
                      ),
                    );
                  },
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 5,
                    );
                  },
                ),
              ),
            )));
  }
}
