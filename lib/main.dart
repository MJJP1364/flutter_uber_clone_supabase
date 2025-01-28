import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_uber_clone_supabase/app/home_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  String supabaseUrl = "https://hbvnnvmzxkmfnbtcomwr.supabase.co";
  String supabaseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imhidm5udm16eGttZm5idGNvbXdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgwODg2ODUsImV4cCI6MjA1MzY2NDY4NX0.LkkSpWI6FfmoGqkbGmrzE73eCS_Hbk-bjAuMJfmOU40";
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      home: HomeScreen(),
    ),
  );
}
