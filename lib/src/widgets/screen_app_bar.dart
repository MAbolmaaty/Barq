import 'package:flutter/material.dart';

class ScreenAppBar extends StatelessWidget {
  bool _implyLeading;
  String _screenTitle;
  GestureDetector _thirdAction;


  ScreenAppBar({screenTitle = "", implyLeading = false, GestureDetector thirdAction}) {
    this._implyLeading = implyLeading;
    this._screenTitle = screenTitle;
    this._thirdAction = thirdAction;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(children: [
      Visibility(
          visible: _implyLeading,
          child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                      height: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Icons.arrow_back,
                          color: const Color(0xffFEC200),
                        ),
                      ))))),
      Align(
        alignment: Alignment.center,
        child: Text(
          _screenTitle,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: _thirdAction

        // GestureDetector(child:Container(
        //     height: double.infinity,
        //     child: Padding(padding: EdgeInsets.all(15), child: _thirdAction))),
      )
    ]));
  }
}
