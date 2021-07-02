import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'all_blocs.dart';
class ThemeBloc extends HydratedBloc<ThemeEvent,ThemeData>{
   final _lightTheme=ThemeData.light();
   final _darkTheme=ThemeData.dark();
/*Internal Check Into Bloc Base Class:
  1.State or ThemeData is Actually Stored on the disk it will be retrieved and passed value to state will be ignored
  2.If there is no data stored on the desk then the value passed to super or initState will be used
 */
  ThemeBloc() : super(ThemeData.light());

   @override
  Stream<ThemeData> mapEventToState(ThemeEvent event)async* {
    if(event is LightTheme){
yield _lightTheme;
    }else if(event is DarkTheme){
      yield _darkTheme;
    }
  }
  @override
  ThemeData? fromJson(Map<String, dynamic> source) {
    try {
      if (source['light'] as bool) {
        return ThemeData.light();
      }
      return ThemeData.dark();
    } catch (_) {
      //Return Null If There is no Cached or save state or Theme Data on The Storage
      return null;
    }
  }
  @override
  Map<String, bool>? toJson(ThemeData themeData) {
    try {
      return {
        'light': state != ThemeData.light()
      };
    } catch (_) {
      return null;
    } }
}