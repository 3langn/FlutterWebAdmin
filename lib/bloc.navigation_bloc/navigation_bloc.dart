import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_admin/screens/add_major/add_majors.dart';
import 'package:university_admin/screens/add_university/add_university.dart';
import 'package:university_admin/screens/home.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  AddMajorsClickedEvent,
  AddUniversityClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
      case NavigationEvents.AddMajorsClickedEvent:
        yield AddMajorsScreen();
        break;
      case NavigationEvents.AddUniversityClickedEvent:
        yield AddUniversity();
        break;
    }
  }
}
