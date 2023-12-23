
import 'package:calculator_app2/components/button_values.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.bottomRight,
                child: const Text(
                  '0',
                  style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          Wrap(
            children: Btn.buttonValues
                .map(
                  (value) => SizedBox(
                    width: value == Btn.n0
                        ? screenSize.width / 2
                        : (screenSize.width / 4),
                    height: screenSize.height / 7,
                    child: buildButton(value),
                  ),
                )
                .toList(),
          ),
        ],
      )),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [
                Btn.per,
                Btn.divide,
                Btn.multiply,
                Btn.calculate,
                Btn.add,
                Btn.subtract
              ].contains(value)
                ? Colors.orange
                : Colors.black87,
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
        ),
        child: InkWell(
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
