import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spga/txt_box.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(124, 0, 92, 131),
  ),

  // textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final c4s1 = TextEditingController();
  final c4s2 = TextEditingController();
  final c3s1 = TextEditingController();
  final c3s2 = TextEditingController();
  final c3s3 = TextEditingController();
  final c1s1 = TextEditingController();
  final c1s2 = TextEditingController();
  final c1s3 = TextEditingController();
  String spga = '0';

  void onChange(a) {
    setState(() {
      spga = data(c4s1, c4s2, c3s1, c3s2, c3s3, c1s1, c1s2, c1s3);
    });
  }

  String data(a1, a2, b1, b2, b3, c1, c2, c3) {
    final ta1 = a1.text == '' ? 0 : toGrade(a1.text);
    final ta2 = a2.text == '' ? 0 : toGrade(a2.text);
    final tb1 = b1.text == '' ? 0 : toGrade(b1.text);
    final tb2 = b2.text == '' ? 0 : toGrade(b2.text);
    final tb3 = b3.text == '' ? 0 : toGrade(b3.text);
    final tc1 = c1.text == '' ? 0 : toGrade(c1.text);
    final tc2 = c2.text == '' ? 0 : toGrade(c2.text);
    final tc3 = c3.text == '' ? 0 : toGrade(c3.text);

    int ans4 = (ta1 + ta2);
    int ans3 = (tb1 + tb2 + tb3);
    int ans1 = (tc1 + tc2 + tc3);
    double ta = ((ans4 * 4) + (ans3 * 3) + (ans1 * 1)) / 20;
    return ta.toString();
  }

  int toGrade(a) {
    a = int.parse(a);
    if (a >= 90)
      return 10;
    else if (a >= 80)
      return 9;
    else if (a >= 70)
      return 8;
    else if (a >= 60)
      return 7;
    else if (a >= 50)
      return 6;
    else if (a >= 45)
      return 5;
    else if (a >= 40)
      return 4;
    else
      return 0;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: theme.colorScheme.background,
          foregroundColor: theme.colorScheme.onPrimaryContainer,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SPGA calculator",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontFamily: 'american typewriter',
              )),
        ),
        body: Center(
          child: SingleChildScrollView(
            controller: ScrollController(keepScrollOffset: false),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context)
                    .colorScheme
                    .onPrimaryContainer
                    .withOpacity(0.1),
              ),
              width: 400,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextBox(ctrl: c4s1, onChange: onChange, s: 1, c: 4),
                  TextBox(ctrl: c4s2, onChange: onChange, s: 2, c: 4),
                  TextBox(ctrl: c3s1, onChange: onChange, s: 1, c: 3),
                  TextBox(ctrl: c3s2, onChange: onChange, s: 2, c: 3),
                  TextBox(ctrl: c3s3, onChange: onChange, s: 3, c: 3),
                  TextBox(ctrl: c1s1, onChange: onChange, s: 1, c: 1),
                  TextBox(ctrl: c1s2, onChange: onChange, s: 2, c: 1),
                  TextBox(ctrl: c1s3, onChange: onChange, s: 3, c: 1),
                  const SizedBox(height: 10),
                  Text(
                    'SGPA : $spga ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontFamily: 'american typewriter',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
