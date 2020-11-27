import 'package:flutter/material.dart';

class SuccessDialog extends StatefulWidget {
  String _message;

  SuccessDialog({String message}){
    this._message = message;
  }

  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog>
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Row(children: [
        Expanded(child: Text('${widget._message}',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),)),
        Icon(Icons.check, color: const Color(0xffFEC200),)
      ]),
    );
  }
}
