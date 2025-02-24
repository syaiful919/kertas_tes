import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final VoidCallback onTapPayment;

  const MainPage({
    super.key,
    required this.onTapPayment,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: DSButton(
            title: "GO TO PAYMENT",
            onPressed: widget.onTapPayment,
          ),
        ),
      ),
    );
  }
}
