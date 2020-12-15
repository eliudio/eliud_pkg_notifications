/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 dashboard_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dashboard_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DashboardFormState extends Equatable {
  const DashboardFormState();

  @override
  List<Object> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class DashboardFormUninitialized extends DashboardFormState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return '''DashboardFormState()''';
  }
}

// DashboardModel has been initialised and hence DashboardModel is available
class DashboardFormInitialized extends DashboardFormState {
  final DashboardModel value;

  @override
  List<Object> get props => [ value ];

  const DashboardFormInitialized({ this.value });
}

// Menu has been initialised and hence a menu is available
abstract class DashboardFormError extends DashboardFormInitialized {
  final String message;

  @override
  List<Object> get props => [ message, value ];

  const DashboardFormError({this.message, DashboardModel value }) : super(value: value);

  @override
  String toString() {
    return '''DashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}
class DocumentIDDashboardFormError extends DashboardFormError { 
  const DocumentIDDashboardFormError({ String message, DashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DocumentIDDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class AppIdDashboardFormError extends DashboardFormError { 
  const AppIdDashboardFormError({ String message, DashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''AppIdDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DescriptionDashboardFormError extends DashboardFormError { 
  const DescriptionDashboardFormError({ String message, DashboardModel value }): super(message: message, value: value);

  @override
  List<Object> get props => [ message, value ];

  @override
  String toString() {
    return '''DescriptionDashboardFormError {
      value: $value,
      message: $message,
    }''';
  }
}


class DashboardFormLoaded extends DashboardFormInitialized { 
  const DashboardFormLoaded({ DashboardModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''DashboardFormLoaded {
      value: $value,
    }''';
  }
}


class SubmittableDashboardForm extends DashboardFormInitialized { 
  const SubmittableDashboardForm({ DashboardModel value }): super(value: value);

  @override
  List<Object> get props => [ value ];

  @override
  String toString() {
    return '''SubmittableDashboardForm {
      value: $value,
    }''';
  }
}


