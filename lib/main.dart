import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _screenShotController=ScreenshotController();

  void takeScreenshot()async{
    final imageFile = await _screenShotController.capture();
    Share.shareFiles([imageFile.path]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Screenshot'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Screenshot(
                      controller: _screenShotController,
                      child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Image.asset('images/codepassionately.png'),
                                Text(
                                  'Code Passionately',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                  ),
                    ),
                  TextButton(
                    child: Text('Take Screenshot and Share'),
                    onPressed: takeScreenshot,
                  )
                ]))
      ),
    );
  }
}

