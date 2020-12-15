/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 notification_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'notification_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NotificationFormState extends Equatable {
  const NotificationFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class NotificationFormUninitialized extends NotificationFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''NotificationFormState()''';
  }
}

// NotificationModel has been initialised and hence NotificationModel is available
class NotificationFormInitialized extends NotificationFormState {
  final NotificationModel value;

  @override
  List<Object> get props => [ value ];

  const NotificationFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class NotificationFormError extends NotificationFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const NotificationFormError({this.message, NotificationModel value }) : super(value: value);

  @override
  String toString() {
    return '''NotificationFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDNotificationFormError extends NotificationFormError { 
  const DocumentIDNotificationFormError({ String message, NotificationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDNotificationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class TimestampNotificationFormError extends NotificationFormError { 
  const TimestampNotificationFormError({ String message, NotificationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''TimestampNotificationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdNotificationFormError extends NotificationFormError { 
  const AppIdNotificationFormError({ String message, NotificationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdNotificationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionNotificationFormError extends NotificationFormError { 
  const DescriptionNotificationFormError({ String message, NotificationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionNotificationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ReadNotificationFormError extends NotificationFormError { 
  const ReadNotificationFormError({ String message, NotificationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ReadNotificationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class ActionNotificationFormError extends NotificationFormError { 
  const ActionNotificationFormError({ String message, NotificationModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''ActionNotificationFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class NotificationFormLoaded extends NotificationFormInitialized { 
  const NotificationFormLoaded({ NotificationModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''NotificationFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableNotificationForm extends NotificationFormInitialized { 
  const SubmittableNotificationForm({ NotificationModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableNotificationForm {
      value: $value,
    }''';
  }
}


