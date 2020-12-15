/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core/core/global_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:eliud_core/platform/platform.dart';
import 'package:eliud_core/core/widgets/progress_indicator.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:eliud_core/core/access/bloc/access_state.dart';
import 'package:eliud_core/core/access/bloc/access_bloc.dart';


import 'package:eliud_pkg_notifications/model/notification_list_bloc.dart';
import 'package:eliud_pkg_notifications/model/notification_list_state.dart';
import 'package:eliud_pkg_notifications/model/notification_model.dart';


typedef NotificationChanged(String value);

class NotificationDropdownButtonWidget extends StatefulWidget {
  final String value;
  final NotificationChanged trigger;
  final bool optional;

  NotificationDropdownButtonWidget({ this.value, this.trigger, this.optional, Key key }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NotificationDropdownButtonWidgetState();
  }
}

class NotificationDropdownButtonWidgetState extends State<NotificationDropdownButtonWidget> {
  NotificationListBloc bloc;

  NotificationDropdownButtonWidgetState();

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<NotificationListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (bloc != null) bloc.close();
    super.dispose();
  }

List<Widget> widgets(NotificationModel pm) {
List<Widget> widgets = List();
if (pm.timestamp.toString() != null) widgets.add(new Text(pm.timestamp.toString()));
if (pm.documentID != null) widgets.add(new Text(pm.documentID));
return widgets;
}


  @override
  Widget build(BuildContext context) {
    var accessState = AccessBloc.getState(context);
    return BlocBuilder<NotificationListBloc, NotificationListState>(builder: (context, state) {
      if (state is NotificationListLoading) {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      } else if (state is NotificationListLoaded) {
        String valueChosen;
        if (state.values.indexWhere((v) => (v.documentID == widget.value)) >= 0)
          valueChosen = widget.value;
        else
          if (widget.optional != null && widget.optional) valueChosen = null;
          
        final values = state.values;
        final List<DropdownMenuItem<String>> items = List();
        if (state.values.isNotEmpty) {
          if (widget.optional != null && widget.optional) {
            items.add(new DropdownMenuItem<String>(
                value: null,
                child: new Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [ new Text("None") ],
                  ),
                )));
          }
          state.values.forEach((element) {
            items.add(new DropdownMenuItem<String>(
                value: element.documentID,
                child: new Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  height: 100.0,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widgets(element),
                  ),
                )));
          });
        }
        DropdownButton button = 
                    DropdownButton<String>(
                      isDense: false,
                      isExpanded: false,
                      items: items,
                      value: valueChosen,
                      hint: Text('Select a notification'),
                      onChanged: !accessState.memberIsOwner() ? null : _onChange,
                    );
        if (false) {
          return Container(height:48, child: Center(child: button));
        } else {
          return Center(child: button);
        }
      } else {
        return Center(
          child: DelayedCircularProgressIndicator(),
        );
      }
    });
  }

  void _onChange(String value) {
    widget.trigger(value);
  }
}

