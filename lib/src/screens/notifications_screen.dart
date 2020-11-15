import 'package:barq/src/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => NotificationsScreen(),
      );

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationModel> notifications = <NotificationModel>[
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
    NotificationModel(
        "Force Touches website has been broken down, Please check it ASAP",
        "Last update at 10.00 A.M"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF333333),
          title: Text("Notifications"),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(8),
            separatorBuilder: (context, index){
              return Divider(
                color: const Color(0x309e9e9e),
                thickness: 1,
                indent: 5,
                endIndent: 5,
              );
            },
            itemCount: notifications.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  CircleAvatar(
                      backgroundColor: const Color(0xFF333333),
                      child: Icon(
                        Icons.notifications,
                        color: const Color(0xFFFEC200),
                      )),
                ],
              );
            }));
  }
}
