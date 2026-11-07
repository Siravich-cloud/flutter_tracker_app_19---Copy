// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_tracker_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //-----โค้ดติดต่อ supabase โปรเจ็กต์ที่เราจะทำงานด้วย--------------------
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://azrktjcgwqrmtccsftgu.supabase.co',
    publishableKey: 'sb_publishable_brrV1BTjBk5zlq-8hHgm8g_F98zZB49',
  );
  //---------------------------------------------------------------

  runApp(
    const FlutterTrackerApp(),
  );
}

//---------------------------------------------------------------------------
class FlutterTrackerApp extends StatefulWidget {
  const FlutterTrackerApp({super.key});

  @override
  State<FlutterTrackerApp> createState() => _FlutterTrackerAppState();
}

class _FlutterTrackerAppState extends State<FlutterTrackerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
      theme: ThemeData(),
    );
  }
}
