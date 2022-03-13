import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/screens.dart';
import 'constants-and-themes/constants_themes.dart';

void main() => runApp(const WhatsApp());

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: WhatsAppConstants.themeData,
      title: WhatsAppConstants.title,
      home: const DefaultTabController(
        length: 3,
        child: Home(),
      ),
    );
  }
}
