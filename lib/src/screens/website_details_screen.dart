import 'package:barq/src/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WebsiteDetailsScreen extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => WebsiteDetailsScreen());

  @override
  _WebsiteDetailsScreenState createState() => _WebsiteDetailsScreenState();
}

class _WebsiteDetailsScreenState extends State<WebsiteDetailsScreen> {
  bool active = false;

  final List<NotificationModel> notifications = <NotificationModel>[
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    NotificationModel("Force Touches website", "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
    // NotificationModel(
    //     "Force Touches website has been broken down, Please check it ASAP",
    //     "Last update at 10.00 A.M"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff212121),
        title: Text('Website Name'),
        textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
      ),
      body: Column(
          children: [
            Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 70,
                      color: const Color(0xffFEC200),
                    ),
                    Column(
                      children: [
                        Text(
                          'Website Name',
                          style: TextStyle(
                              color: const Color(0xff212121),
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Text('Website Link',
                            style: TextStyle(
                              color: const Color(0xffC1C1C1),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Switch(
                      value: active,
                      onChanged: (value) {
                        setState(() {
                          active = value;
                        });
                      },
                      activeTrackColor: const Color(0xff212121),
                      activeColor: const Color(0xffFEC200),
                    )
                  ],
                )),
            const Divider(
              color: const Color(0x309e9e9e),
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.only(top: 24, left: 24, right: 8),
                  child: Wrap(
                    children: [
                      Text(
                        "2",
                        style: TextStyle(
                            fontSize: 30,
                            color: const Color(0xff212121),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        child: Text(
                          "hours",
                          style: TextStyle(
                              fontSize: 15, color: const Color(0xff9e9e9e)),
                        ),
                        margin: EdgeInsets.only(top: 15),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff9e9e9e), width: 1),
                      borderRadius: BorderRadius.circular(4)),
                ),
                Container(
                  padding: EdgeInsets.all(13),
                  margin: EdgeInsets.only(top: 24, left: 8, right: 24),
                  child: Wrap(
                    children: [
                      Text(
                        "30",
                        style: TextStyle(
                            fontSize: 30,
                            color: const Color(0xff212121),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        child: Text(
                          "minutes",
                          style: TextStyle(
                              fontSize: 15, color: const Color(0xff9e9e9e)),
                        ),
                        margin: EdgeInsets.only(top: 15),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(4)),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            const Divider(
              color: const Color(0x309e9e9e),
              thickness: 1,
              indent: 30,
              endIndent: 30,
            ),
            Stack(
              children: [
                Container(
                  child: Align(
                    child: Text(
                      'Latest Notifications',
                      style: TextStyle(
                          fontSize: 15,
                          color: const Color(0xff212121),
                          fontWeight: FontWeight.w500),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  margin: EdgeInsets.only(left: 10, top: 30),
                ),
                Container(
                  child: Align(
                    child: Text(
                      'Show all',
                      style: TextStyle(
                          fontSize: 13,
                          color: const Color(0xff9e9e9e),
                          fontWeight: FontWeight.w400),
                    ),
                    alignment: Alignment.topRight,
                  ),
                  margin: EdgeInsets.only(right: 10, top: 30),
                )
              ],
            ),
            Expanded(child:
            Container(
                child:
                ListView.separated(
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (context, index) {
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
                          Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    '${notifications[index].title}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '${notifications[index].time}',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              )),
                        ],
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
