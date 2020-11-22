import 'package:flutter/material.dart';

class RegisterSuccessDialog extends StatefulWidget {
  @override
  _RegisterSuccessDialogState createState() => _RegisterSuccessDialogState();
}

class _RegisterSuccessDialogState extends State<RegisterSuccessDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Successfully created new account'),
    );
  }
}
