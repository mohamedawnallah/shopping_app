import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeEvent extends Equatable{
  const ThemeEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class DarkTheme extends ThemeEvent{
  const DarkTheme();
}
class LightTheme extends ThemeEvent{
  const LightTheme();
}