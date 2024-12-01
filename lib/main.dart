import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BotDiceApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Dice App',
      ),
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
  int leftdicenumber=5;
  int rightdicenumber=1;
  int sum=0;
void randomnumber() {
  setState(() {
     leftdicenumber = Random().nextInt(6) + 1;
     rightdicenumber = Random().nextInt(6) + 1;
     sum=leftdicenumber+rightdicenumber;
     print('Dice Rolled: Left: $leftdicenumber, Right: $rightdicenumber');
     print('Total Sum: $sum');
  });
     Fluttertoast.showToast(
       msg: "Your Total is : $sum",
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.white,
       textColor: Colors.red,
       fontSize: 16.0,
     );
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child:TextButton(
            onPressed: (){
              print('the left dice is pressed');
              randomnumber();
              print('the number is $leftdicenumber');
      },
                child: Image.asset('images/dice$leftdicenumber.jpeg'),
        )
            ),

            Expanded(
              flex: 1,
              child:TextButton(
                onPressed: (){
                  print('the right dice is clicked');
                    randomnumber();
                  print('the right dice is $rightdicenumber');
                },
                child: Image.asset('images/dice$rightdicenumber.jpeg'),
              )

            )

          ],
        ),

  ]
          
      ),

    );
  }
}
