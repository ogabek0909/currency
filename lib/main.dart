import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController text2 = TextEditingController(text: "");
  TextEditingController text1 = TextEditingController(text: '');
  double a = 0;
  String uzb = '🇺🇿 UZB';
  String us = '🇺🇸 USA';
  String all = '🇺🇸 USA';
  String s='UZS';
  String w='USD';
  String x='UZS';

  func() {
    a = double.parse(text1.text);
    setState(() {
      if (uzb == "🇺🇿 UZB") {
        a *= 10000;
      } else {
        a *= 0.0001;
      }
      text2.text = a.toString();
    });
  }

  changer() {
    setState(() {
      us = uzb;
      uzb = all;
      all = us;
      s=w;
      w=x;
      x=s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.blue,
            )),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Currency \nCalculator',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: text1,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[350],
                          labelText: 'Input amount',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      w,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      controller: text2,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[350],
                          labelText: 'Converted amount',
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      s,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 55,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${us}',
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: changer,
                            icon: Icon(Icons.sync_alt_rounded)),
                        Text(
                          '${uzb}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  ElevatedButton(
                      onPressed: func,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          'Convert',
                          style: TextStyle(fontSize: 35),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
