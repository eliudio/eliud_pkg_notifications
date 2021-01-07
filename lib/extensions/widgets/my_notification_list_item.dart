import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_pkg_membership/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_membership/model/member_public_info_repository.dart';
import 'package:eliud_pkg_membership/model/member_public_info_model.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';
import 'package:eliud_core/tools/formatting.dart';
import 'package:eliud_pkg_notifications/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_notifications/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_list_event.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyNotificationListItem extends StatelessWidget {
  final NotificationModel value;

  MyNotificationListItem({
    Key key,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = AccessBloc.app(context);
    return Dismissible(
        key: Key('__Notification_item_${value.documentID}'),
        onDismissed: (_) {
          BlocProvider.of<NotificationListBloc>(context).add(
              UpdateNotificationList(
                  value: value.copyWith(status: NotificationStatus.Closed)));
        },
        child: _tile(app.documentID, value.reporterId));
  }

  Widget _tile(String appId, String memberId) {
    var style = ((value.read == null) || (value.read))
        ? null
        : new TextStyle(fontWeight: FontWeight.bold);
    return FutureBuilder<MemberPublicInfoModel>(
        future: memberPublicInfoRepository(appId: appId).get(memberId),
        builder: (BuildContext context2, AsyncSnapshot snapshot) {
          Widget avatar;
          String name;
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
              trailing: Text(value.timestamp, style: style),
              title: Text("From: " + name, style: style),
              subtitle: Text(
                value.description,
                style: style,
              ));
        }
        );
  }

  Widget _avatar(MemberPublicInfoModel memberPublicInfo) {
    var image;
    if (memberPublicInfo != null) {
      image = AbstractPlatform.platform
          .getImageProviderOnPlatform(memberPublicInfo.photoURL);
    }
    if (image != null) {
      return Container(
          width: 60.0,
          height: 60.0,
          decoration: new BoxDecoration(
            color: Colors.transparent,
            borderRadius:
            new BorderRadius.all(new Radius.circular(50.0)),
            border: new Border.all(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
            decoration: new BoxDecoration(
              color: Colors.transparent,
              image: new DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ));
    } else {
      return _letterAvatar(memberPublicInfo.name[0]);
    }
  }

  Widget _letterAvatar(String letter) {
    return CircleAvatar(
      child: Text(letter),
      backgroundColor: Colors.red,
    );
  }
}
