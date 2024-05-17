import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resquecare/Views/Admin/admin_home_page.dart';
import 'package:resquecare/Views/Auth/welcome_page.dart';
import 'package:resquecare/Views/home_page.dart';
import 'package:resquecare/Views/Auth/splash_screen.dart';
import 'package:resquecare/colors.dart';


main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan tulisan debugbanner
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.purpleAppbar, titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)), //mengubah tema appbar untuk semua page
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme), //mengubah tema font family menjadi poppins
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
