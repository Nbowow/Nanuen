import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:nanuen_sns_login/screen/main_screen.dart';

void main() async {
  KakaoSdk.init(nativeAppKey: '76e93a7e6dad66a0b2d3f68f72ae66e7');
  WidgetsFlutterBinding.ensureInitialized(); //flutter 코어 엔진 초기화
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override //alt + shift + f => 코드 정리(format document)
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const App(),
      //home: const KakaoMain(),
      //home: const LoginPage(),
      home: const LoginSignupScreen(),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Authentication(),
//     );
//   }
// }

// class Authentication extends StatelessWidget {
//   const Authentication({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance
//           .authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           //data �뾾�쓣�븣 > 濡쒓렇�씤 �솕硫�
//           return const SignInScreen(
//             providerConfigs: [EmailProviderConfiguration()],
//           );
//         }
//         return const ChatScreen();
//       },
//     );
//   }
// }
