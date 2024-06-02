import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resquecare/View-Model/admin_pengaduan_provider.dart';
import 'package:resquecare/View-Model/auth_services.dart';
import 'package:resquecare/View-Model/others_provider.dart';
import 'package:resquecare/View-Model/panggilan_darurat_provider.dart';
import 'package:resquecare/View-Model/pengaduan_provider.dart';
import 'package:resquecare/Views/Auth/login_page.dart';
import 'package:resquecare/colors.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDY2tZ6FWWRhcgoZMKSPsMDRu69cj41tws",
    appId: "1:527314231266:android:7fe92204c5f7300458a3bb",
    messagingSenderId: "527314231266",
    projectId: "rescuecare",
    storageBucket: "rescuecare.appspot.com",
  ));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServicesProvider()),
        ChangeNotifierProvider(create: (_) => OtherProvider()),
        ChangeNotifierProvider(create: (_) => PengaduanProvider()),
        ChangeNotifierProvider(create: (_) => AdminPengaduanProvider()),
        ChangeNotifierProvider(create: (_) => PanggilanDaruratProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan tulisan debugbanner
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.purpleAppbar,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ), //mengubah tema appbar untuk semua page
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme), //mengubah tema font family menjadi poppins
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
