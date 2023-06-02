import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:nanuen_sns_login/chat_screen.dart';

void main() async {
  KakaoSdk.init(nativeAppKey: '76e93a7e6dad66a0b2d3f68f72ae66e7');
  WidgetsFlutterBinding
      .ensureInitialized(); //flutter�뿉�꽌 firebase瑜� �궗�슜�븯�젮硫� 諛섎뱶�떆 鍮꾨룞湲� 諛⑹떇�쑝濡� �뵆�윭�꽣 �뿏吏� 珥덇린�솕
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override //alt + shift + f => 코드 정리(format document)
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
          .authStateChanges(), //�궗�슜�옄媛� 濡쒓렇�씤/濡쒓렇�븘�썐�쓣 �븷�븣留덈떎 state媛� 蹂��솕�븯怨� builder硫붿냼�뱶瑜� �넻�빐 �깉濡�寃� �솕硫� 洹몃━湲� 媛��뒫
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //data �뾾�쓣�븣 > 濡쒓렇�씤 �솕硫�
          return const SignInScreen(
            providerConfigs: [EmailProviderConfiguration()],
          );
        }
        return const ChatScreen();
      },
    );
  }
}
