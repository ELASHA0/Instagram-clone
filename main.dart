import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quit/providers/user_provider.dart';
import 'package:quit/responsive/responsive_layout_screen.dart';
import 'package:quit/phone_screen_layout.dart';
import 'package:quit/screens/feed_screen.dart';
//import 'package:quit/screens/add_post_screen.dart';
//import 'package:quit/screens/comment.dart';
//import 'package:quit/screens/feed_screen.dart';
import 'package:quit/screens/login_screen.dart';
import 'package:quit/screens/profile_screen.dart';
//import 'package:quit/screens/profile_screen.dart';
//import 'package:quit/screens/search_screen.dart';
//import 'package:quit/screens/signup_screen.dart';
import 'package:quit/web_screen_layout.dart';
import 'package:quit/utiles/utils';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) // k is web
  {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAsmHN9qgiRzY_IZXfM_sEOvmCpG6Cz8ME",
        appId: "1:514884012730:web:cec93ef6a9de6affe75083",
        messagingSenderId: "514884012730",
        projectId: "insta-d9c9d",
        storageBucket: "insta-d9c9d.firebasestorage.app",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'quit clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  phoneScreenLayout: PhoneScreenLayout());
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "${snapshot.error}",
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(color: Colors.white));
            }
            return LoginScreen(); // LoginScreen();
          },
        ),
      ),
    );
  }
}
