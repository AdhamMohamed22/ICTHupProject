import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _CalculationState();
}

class _CalculationState extends State<ThirdScreen> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  int? result;
  var FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: FormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller1,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a number";
                } else if (int.parse(value) > 10) {
                  return "Please enter a  number less than 10";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black)),
                  label: const Text("Enter First Number",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green))),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller2,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter a number";
                } else if (int.parse(value) > 10) {
                  return "Please enter a number less than 10";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black)),
                  label: const Text("Enter Second Number",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.green))),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                onPressed: () {
                  if (FormKey.currentState!.validate()) {
                    int number1 = int.parse(controller1.text);
                    int number2 = int.parse(controller2.text);
                    result = number1 + number2;
                    setState(() {});
                  } else {
                    return;
                  }
                },
                child: const Text(
                  "Sum",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            Text("Result is = $result")
          ],
        ),
      ),
    )));
  }
}
