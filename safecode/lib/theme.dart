import 'package:flutter/material.dart';

// import 'colors.dart';
Color background = const Color(0xff252744);
Color icons = const Color(0xfff36b5f);
Color padlock = const Color(0xff759d3a);
Color pinky = const Color(0xffbe4d82);
Color redy = const Color(0xffd9004c);
Color font = Colors.white;
Color button = const Color(0xff41457a);

class CustomTheme {
  static ThemeData get darkTheme {
    //1
    return ThemeData(
      //2
      primaryColor: Colors.red,
      scaffoldBackgroundColor: background,
      dialogBackgroundColor: background,
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: background,
      ),
      fontFamily: 'Montserrat', //3
      backgroundColor: background,
      buttonTheme: ButtonThemeData(
        // 4
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: Colors.green,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: font),
        bodyText2: TextStyle(color: font),
        headline1: TextStyle(color: font),
        headline2: TextStyle(color: font),
        headline3: TextStyle(color: font),
        headline4: TextStyle(color: font),
        headline5: TextStyle(color: font),
        headline6: TextStyle(
          color: font,
          fontSize: 16,
        ),
        subtitle1: TextStyle(color: font),
        subtitle2: TextStyle(color: font),
        caption: TextStyle(color: font),
        button: TextStyle(color: font),
        overline: TextStyle(color: font),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(icons),
        ),
      ),
      sliderTheme: ThemeData.dark().sliderTheme.copyWith(
            valueIndicatorColor: redy,
            valueIndicatorTextStyle: TextStyle(backgroundColor: redy),
            thumbColor: pinky,
            inactiveTrackColor: pinky,
            activeTrackColor: pinky,
          ),
      appBarTheme: AppBarTheme(backgroundColor: icons),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(icons),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: icons,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: font),
        iconColor: padlock,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
            color: icons,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: icons,
      ),
    );
  }
}
