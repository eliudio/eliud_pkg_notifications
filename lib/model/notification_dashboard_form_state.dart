/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_dashboard_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'notification_dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NotificationDashboardFormState extends Equatable {
  const NotificationDashboardFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class NotificationDashboardFormUninitialized extends NotificationDashboardFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''NotificationDashboardFormState()''';
  }
}

// NotificationDashboardModel has been initialised and hence NotificationDashboardModel is available
class NotificationDashboardFormInitialized extends NotificationDashboardFormState {
  final NotificationDashboardModel value;

  @override
  List<Object> get props => [ value ];

  const NotificationDashboardFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class NotificationDashboardFormError extends NotificationDashboardFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const NotificationDashboardFormError({this.message, NotificationDashboardModel value }) : super(value: value);

  @override
  String toString() {
    return '''NotificationDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDNotificationDashboardFormError extends NotificationDashboardFormError { 
  const DocumentIDNotificationDashboardFormError({ String message, NotificationDashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDNotificationDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdNotificationDashboardFormError extends NotificationDashboardFormError { 
  const AppIdNotificationDashboardFormError({ String message, NotificationDashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdNotificationDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionNotificationDashboardFormError extends NotificationDashboardFormError { 
  const DescriptionNotificationDashboardFormError({ String message, NotificationDashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionNotificationDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NotificationDashboardFormLoaded extends NotificationDashboardFormInitialized { 
  const NotificationDashboardFormLoaded({ NotificationDashboardModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''NotificationDashboardFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableNotificationDashboardForm extends NotificationDashboardFormInitialized { 
  const SubmittableNotificationDashboardForm({ NotificationDashboardModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableNotificationDashboardForm {
      value: $value,
    }''';
  }
}


