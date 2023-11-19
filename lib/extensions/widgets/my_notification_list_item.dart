import 'package:eliud_core/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core/model/member_public_info_model.dart';
import 'package:eliud_core_model/tools/firestore/firestore_tools.dart';
import 'package:eliud_pkg_notifications/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_list_event.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNotificationListItem extends StatelessWidget {
  final AppModel app;
  final NotificationModel value;

  MyNotificationListItem({
    super.key,
    required this.app,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: Key('__Notification_item_${value.documentID}'),
        onDismissed: (_) {
          BlocProvider.of<NotificationListBloc>(context).add(
              UpdateNotificationList(
                  value: value.copyWith(status: NotificationStatus.closed)));
        },
        child: _tile(app.documentID, value.reporterId));
  }

  Widget _tile(String? appId, String? memberId) {
    var style = ((value.read == null) || value.read!)
        ? null
        : TextStyle(fontWeight: FontWeight.bold);
    return FutureBuilder<MemberPublicInfoModel?>(
        future: memberPublicInfoRepository(appId: appId)!.get(memberId),
        builder: (BuildContext context2, AsyncSnapshot snapshot) {
          Widget avatar;
          String? name;
          if (snapshot.hasData) {
            MemberPublicInfoModel memberPublicInfo = snapshot.data;
            avatar = _avatar(memberPublicInfo);
            name = memberPublicInfo.name;
          } else {
            avatar = _letterAvatar("?");
            name = "?";
          }

          return ListTile(
              onTap: () {},
              leading: avatar,
              trailing:
                  Text(formatFullPrecision(value.timestamp!), style: style),
              title: Text("From: $name", style: style),
              subtitle: Text(
                value.description!,
                style: style,
              ));
        });
  }

  Widget _avatar(MemberPublicInfoModel memberPublicInfo) {
    NetworkImage? image;
    if (memberPublicInfo.photoURL != null) {
      image = NetworkImage(memberPublicInfo.photoURL!);
    }
    if (image != null) {
      return Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 60,
            backgroundImage: image),
      );
    } else {
      return _letterAvatar(memberPublicInfo.name![0]);
    }
  }

  Widget _letterAvatar(String letter) {
    return CircleAvatar(
      child: Text(letter),
      backgroundColor: Colors.red,
    );
  }
}
