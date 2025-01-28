import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uber_clone_supabase/app/home_screen.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      home: HomeScreen(),
    ),
  );
}
