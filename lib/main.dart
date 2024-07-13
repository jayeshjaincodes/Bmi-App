import 'package:bmiapp/Splashpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Splashpage(),
    );
  }
}

class BMIPage extends StatefulWidget {
  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var backgColor = Colors.white;
  var msg = "";
  var appbgc = Colors.grey.shade100;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbgc,
          title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                "assets/images/logoofbmi.png",
                width: 40,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: backgColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 35),
                ),
                Text(
                  'Body Mass Index',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: 300,
                  child: Text(
                    'Enter your Weight',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  child: TextField(
                    controller: wtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Kilograms',
                      prefixIcon: Icon(
                        Icons.line_weight_outlined,
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 300,
                  child: Text(
                    'Enter your Height',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 135,
                      child: TextField(
                        controller: ftController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Feet',
                          prefixIcon: Icon(
                            Icons.height,
                            color: Colors.blue,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 135,
                      child: TextField(
                        controller: inController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Inches',
                          prefixIcon: Icon(
                            Icons.height,
                            color: Colors.blue,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.blue,
                      shadowColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      if (wt != "" &&
                          ft != "" &&
                          inch != "" &&
                          iWt > 0 &&
                          iFt > 0 &&
                          iInch > 0) {
                        var foot = (iInch / 12) + iFt;
                        var meter = foot * 0.3048;

                        var bmi = iWt / (meter * meter);

                        result = "Your BMI is : ${bmi.toStringAsFixed(2)}";
                        if (bmi < 18.5) {
                          backgColor = Colors.yellow;
                          appbgc = Colors.yellow.shade400;
                          msg =
                              "Your BMI indicates that you are \nUnderweight.\n\n It's important to maintain a balanced diet and consult a doctor for personalized advice.";
                        } else if (bmi < 25) {
                          backgColor = Colors.green.shade400;
                          appbgc = Colors.green.shade200;
                          msg =
                              "Congratulations! \n\nYour BMI is within the healthy range. Keep up the good work with healthy habits.";
                        } else if (bmi < 30) {
                          backgColor = Colors.orange;
                          appbgc = Colors.orange.shade400;
                          msg =
                              "Your BMI suggests that you are overweight.\n \nConsider adopting healthy eating habits and increasing physical activity.";
                        } else {
                          backgColor = Colors.red.shade500;
                          appbgc = Colors.red.shade300;
                          msg =
                              "Your BMI indicates that you are obese. \n\nIt's essential to prioritize your health by consulting a healthcare professional for guidance.";
                        }
                        setState(() {});
                      } else {
                        result =
                            "Please fill all the required fields with Correct Values!";
                        msg = "";
                        setState(() {});
                      }
                    },
                    child: Text('Calculate'),
                  ),
                ),
                SizedBox(height: 11),
                Text(
                  textAlign: TextAlign.center,
                  msg,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 19),
                Text(
                  textAlign: TextAlign.center,
                  result,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
