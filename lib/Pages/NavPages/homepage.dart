import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

////////////////////////////////////
//THIS PAGE IS FOR THE STARTSCREEN
//FOR CALLING THE WEBSITE
////////////////////////////////////

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    appBar:
    AppBar(
      backgroundColor: Colors.black,
      title: const Text("NextBus"),
    );
    // HIER WIRD ALIGN WIEDERGEGEBEN FÜR DAS ZENTRIEREN
    // SONST WIRD HIER DIE WEBVIEW ANGEZEIGT MIT DER ZUGEHÖRIGEN URL
    return Align(
      alignment: Alignment.center,
      child: WebviewScaffold(
        url: "https://semester-projekt.arcin.solutions",
      ),
    );
  }
}
