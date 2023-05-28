import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:nanuen_sns_login/chat_screen.dart';

void main() async {
  KakaoSdk.init(nativeAppKey: '76e93a7e6dad66a0b2d3f68f72ae66e7');
  WidgetsFlutterBinding
      .ensureInitialized(); //flutter에서 firebase를 사용하려면 반드시 비동기 방식으로 플러터 엔진 초기화
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const App(),
      //home: const KakaoMain(),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Authentication(),
    );
  }
}

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance
          .authStateChanges(), //사용자가 로그인/로그아웃을 할때마다 state가 변화하고 builder메소드를 통해 새롭게 화면 그리기 가능
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //data 없을때 > 로그인 화면
          return const SignInScreen(
            providerConfigs: [EmailProviderConfiguration()],
          );
        }
        return const ChatScreen();
      },
    );
  }
}
