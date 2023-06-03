import 'package:flutter/material.dart';

class NanuenMainScreen extends StatefulWidget {
  const NanuenMainScreen({super.key});

  @override
  _NanuenMainScreenState createState() => _NanuenMainScreenState();
}

class _NanuenMainScreenState extends State<NanuenMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nanuen main screen'),
      ),
      body: const Center(
        child: Text('Nanuen main page'),
      ),
    );
  }
}
