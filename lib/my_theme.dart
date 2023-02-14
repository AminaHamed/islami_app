import 'package:flutter/material.dart';

class MyTheme{
  static const Color lightPrimary=Color(0XFFB7935F);
  static const Color darkPrimary=Color(0XFF141A2E);
  static const Color gold=Color(0xFFFACC1D);
  static final ThemeData lightTheme= ThemeData(
      bottomSheetTheme:const BottomSheetThemeData(
          backgroundColor:Colors.white,
          elevation: 12,
          shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18)
              )
          )
      ),
    cardColor: Colors.white,
    accentColor: lightPrimary,
      textTheme:const TextTheme(
        headline4: TextStyle(
            fontSize: 22,color: Colors.black
        ), headline6: TextStyle(
          fontSize: 18,color: Colors.black
      ),
        subtitle1: TextStyle(
            fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600
        ),
      ),
    scaffoldBackgroundColor:Colors.transparent ,
    primaryColor: lightPrimary,
    appBarTheme:  const AppBarTheme(
        backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.black,
          fontSize: 30,fontWeight: FontWeight.w600),
      centerTitle: true,
      iconTheme: IconThemeData(
        color:  Colors.black,
      )
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      selectedIconTheme: IconThemeData(
        size: 46,color: Colors.black
      ),
      unselectedIconTheme: IconThemeData(
        size: 36,color: Colors.white
      ),
      selectedLabelStyle: TextStyle(
        color: Colors.black
      ),
      unselectedLabelStyle: TextStyle(
          color: Colors.white
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white
    )
    // scaffoldBackgroundColor: Colors.cyan,
  );
  static final ThemeData darkTheme= ThemeData(
    bottomSheetTheme:const BottomSheetThemeData(
      backgroundColor:darkPrimary,
      elevation: 12,
      shape: RoundedRectangleBorder (
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18)
        )
      )
    ),
    cardColor: darkPrimary,
    accentColor: gold,
    textTheme:const TextTheme(
      headline4: TextStyle(
        fontSize: 28,color: Colors.white,
      fontWeight:  FontWeight.w500)

      , headline6: TextStyle(
        fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600
      ),
      subtitle1: TextStyle(
          fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600
      ),

    ),
    scaffoldBackgroundColor:Colors.transparent ,
    primaryColor: darkPrimary,
    appBarTheme:  const AppBarTheme(
        backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(color: Colors.white,
          fontSize: 30,fontWeight: FontWeight.w600),
      centerTitle: true,
      iconTheme: IconThemeData(
        color:  Colors.white,
      )
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      selectedIconTheme: IconThemeData(
        size: 46,color: gold
      ),
      unselectedIconTheme: IconThemeData(
        size: 36,color: Colors.white
      ),
      selectedLabelStyle: TextStyle(
        color: gold
      ),
      unselectedLabelStyle: TextStyle(
          color: Colors.white
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: gold,
      unselectedItemColor: Colors.white
    )
    // scaffoldBackgroundColor: Colors.cyan,
  );
}