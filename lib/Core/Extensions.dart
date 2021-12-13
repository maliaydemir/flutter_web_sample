import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get safeHeight =>
      mediaQuery.size.height -
      mediaQuery.padding.bottom -
      mediaQuery.padding.top;

  double get safeWidth =>
      mediaQuery.size.width -
      mediaQuery.padding.left -
      mediaQuery.padding.right;

  double get lowValue => height * 0.01;

  double get normalValue => height * 0.02;

  double get mediumValue => height * 0.04;

  double get highValue => height * 0.1;

  double w(double val) => width * val / 100;

  double h(double val) => height * val / 100;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);

  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);

  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);

  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);

  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);

  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);

  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);

  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);

  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);

  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => Duration(milliseconds: 500);

  Duration get normalDuration => Duration(seconds: 1);
}

extension WidgetExtension on Widget {
  Widget toVisible(bool val) => val ? this : Container();
}

extension AnimateRoute on NavigatorState {
  Future<dynamic> pushFromBottom(Widget newPage) {
    return Navigator.of(context).push(bottomRoute(newPage));
  }

  Route bottomRoute(newPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

extension DurationExt on Duration {
  String getString() {
    var seconds = this.inSeconds;
    int minutes = (seconds / 60).toInt();
    seconds = seconds % 60;
    var mStr = minutes < 10 ? '0$minutes' : '$minutes';
    var sStr = seconds < 10 ? '0$seconds' : '$seconds';
    return '$mStr:$sStr';
  }
}

extension DurationExtNull on Duration? {
  String getString() {
    if (this == null) return '00:00';
    var seconds = this?.inSeconds ?? 0;
    int minutes = (seconds / 60).toInt();
    seconds = seconds % 60;
    var mStr = minutes < 10 ? '0$minutes' : '$minutes';
    var sStr = seconds < 10 ? '0$seconds' : '$seconds';
    return '$mStr:$sStr';
  }
}

extension DateTimeExt on DateTime {
  String getAgo() {
    var ago = DateTime.now().difference(this);
    if (ago.inHours > 0) return ago.inHours.toInt().toString() + ' saat önce';
    if (ago.inMinutes > 0)
      return ago.inMinutes.toInt().toString() + ' dakika önce';
    if (ago.inSeconds > 0)
      return ago.inSeconds.toInt().toString() + ' saniye önce';
    return 'az önce';
  }
}

extension StringExt on String {
  String limit({int limitCount = 24}) {
    if (this.length < limitCount) return this;
    return this.substring(0, limitCount - 3) + '..';
  }
}

extension DoubleExt on double {
  String limit({int max = 20}) {
    if (this > max)
      return '+$max';
    else
      return this.toStringAsFixed(1);
  }
}
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
