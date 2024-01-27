import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';

  void _buttonClick(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
      } else if (buttonText == '⌫') {
        _output = _output.substring(0, _output.length - 1);
        if (_output.isEmpty) {
          _output = '0';
        }
      } else if (buttonText == '=') {
        // Perform calculation
        // Example: _output = performCalculation();
      } else {
        if (_output == '0') {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  Widget _buildNumberButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () => _buttonClick(buttonText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            minimumSize: Size(150, 50), // กำหนดความกว้างขั้นต่ำของปุ่ม
            primary: Color.fromARGB(
                255, 145, 152, 159), // กำหนดสีพื้นหลังของปุ่มตัวเลข
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 24.0, color: Colors.white), // กำหนดสีของตัวอักษร
          ),
        ),
      ),
    );
  }

  Widget _buildOperatorButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () => _buttonClick(buttonText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            minimumSize: Size(200, 50), // กำหนดความกว้างขั้นต่ำของปุ่ม
            primary: buttonText == '+'
                ? Color.fromARGB(255, 131, 138, 239)
                : Color.fromARGB(
                    255, 131, 138, 239), // กำหนดสีพื้นหลังของปุ่มเครื่องหมาย
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 24.0, color: Colors.white), // กำหนดสีของตัวอักษร
          ),
        ),
      ),
    );
  }

  Widget _buildOperButton(String buttonText) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () => _buttonClick(buttonText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            minimumSize: Size(1600, 50), // กำหนดความกว้างขั้นต่ำของปุ่ม
            primary: Color.fromARGB(
                255, 0, 187, 255), // กำหนดสีพื้นหลังของปุ่มเครื่องหมาย
          ),
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 24.0, color: Colors.white), // กำหนดสีของตัวอักษร
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () => _buttonClick(buttonText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            minimumSize: Size(150, 50),
            primary: color ?? Color.fromARGB(255, 131, 138, 239),
          ),
          child: buttonText == '⌫' ? Icon(Icons.backspace) : Text(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildZero(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildCal1('C'),
                SizedBox(width: 5.0),
                buildCal2(Icons.backspace),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('7'),
                _buildNumberButton('8'),
                _buildNumberButton('9'),
                _buildOperatorButton('÷'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('4'),
                _buildNumberButton('5'),
                _buildNumberButton('6'),
                _buildOperatorButton('×'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNumberButton('1'),
                _buildNumberButton('2'),
                _buildNumberButton('3'),
                _buildOperatorButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 5.0),
                _buildNumberButton('0'),
                SizedBox(width: 5.0),
                _buildOperatorButton('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 5.0),
                _buildOperButton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildZero() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        children: [
          Text(
            _output,
            style: TextStyle(fontSize: 30.0, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildCal1(String butt) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () => _buttonClick(butt),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              minimumSize: Size(900, 50), // กำหนดความกว้างขั้นต่ำของปุ่ม
              primary: Color.fromARGB(
                  255, 131, 138, 239) // กำหนดสีพื้นหลังของปุ่มตัวเลข
              ),
          child: Text(
            butt,
            style: TextStyle(
                fontSize: 24.0, color: Colors.white), // กำหนดสีของตัวอักษร
          ),
        ),
      ),
    );
  }

  Widget buildCal2(IconData ic) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
            onPressed: () => _buttonClick('⌫'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              minimumSize: Size(500, 50), // กำหนดความกว้างขั้นต่ำของปุ่ม
              primary: Color.fromARGB(
                  255, 131, 138, 239), // กำหนดสีพื้นหลังของปุ่มตัวเลข
            ),
            child: Icon(ic)),
      ),
    );
  }
}
