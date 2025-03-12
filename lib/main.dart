import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/CounterCard.dart';
import 'package:flutter_application_5/components/GenderCard.dart';
import 'package:flutter_application_5/components/HeightCard.dart';
import 'package:flutter_application_5/screens/ResultScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Ensures a dark mode theme
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF1C2135), // Dark navy blue background
          secondary: Color(0xFFE91E63), // Pink for the button
          onPrimary: Colors.white, // Text/icons on primary color
          onSecondary: Colors.white, // Text/icons on secondary color
          surface: Color(0xFF282C40), // Card background
          onSurface: Colors.white, // Text/icons on surface color
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 150;
  int age = 20;
  int weight = 50;
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GenderCard(
                    gender: "Male",
                    icon: (Icons.male),
                    onPressed:
                        () => {
                          setState(() {
                            isMale = true;
                          }),
                        },
                    isSelected: isMale,
                  ),
                  SizedBox(width: 16),
                  GenderCard(
                    gender: "Female",
                    icon: (Icons.female),
                    onPressed:
                        () => {
                          setState(() {
                            isMale = false;
                          }),
                        },
                    isSelected: !isMale,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Heightcard(
              setHeight: (value) {
                setState(() {
                  height = value.roundToDouble();
                });
              },
              height: height,
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Countercard(
                    title: "Weight",
                    value: weight,
                    onIncrement:
                        () => setState(() {
                          weight++;
                        }),
                    onDecrement:
                        () => setState(() {
                          if (weight > 30) weight--;
                        }),
                  ),
                  SizedBox(width: 16),
                  Countercard(
                    title: "Age",
                    value: age,
                    onIncrement:
                        () => setState(() {
                          if (age < 100) age++;
                        }),
                    onDecrement:
                        () => setState(() {
                          if (age > 12) age--;
                        }),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                double bmi = weight / ((height / 100) * (height / 100));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bmi: bmi),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 16),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
