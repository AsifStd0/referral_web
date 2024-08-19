import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/Providers/ReferalPartnerProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopDashedBoardScreen.dart';
import 'DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/DisktopNewReferralPartnerScreen/NewReferralPartner.dart';
import 'DisktopViews/DashedBoardScreens/DashedBoardDataScreen/DisktopReferralPartner/refferel_pertner_main_screen_provider.dart';
import 'DisktopViews/DisktopSignInScreen/DisktopSignInScreen.dart';
import 'DisktopViews/DisktopSignInScreen/admin_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        name: "admin panel",
        options: FirebaseOptions(
            apiKey: "AIzaSyAYhtpoZ2epPcpB3eED0_krGINoEdpiYrw",
            authDomain: "refferal-app-cd79f.firebaseapp.com",
            projectId: "refferal-app-cd79f",
            storageBucket: "refferal-app-cd79f.appspot.com",
            messagingSenderId: "103152226924",
            appId: "1:103152226924:web:52d3bfe9ff6cfcfff7be49",
            measurementId: "G-SE7S77FPLQ"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    shareFunction();
    super.initState();
  }

  bool? login;
  bool? issuperadmin;
  String? id;
  List<adminModel> list = [];
  List<String> allIDs = [];
  shareFunction() async {
    SharedPreferences? shared = await SharedPreferences.getInstance();
    setState(() {
      login = shared.getBool('login');
      issuperadmin = shared.getBool('issuperadmin');
      id = shared.getString('ID');
    });

    ///
    ///----> this code is for future use
    ///
    // list = await getSaloonData();
    // list.forEach((element) {
    //   log(element.id!);
    //   print('this is already login id $id');
    //   allIDs.add(element.id!);
    // });
    // if (allIDs.contains(id) && login == true) {
    //   log("yes yeah the ide is matched and login is true");
    // } else {
    //   print("no   the ide is not matched and login is not true");
    // }
    // log("login $login issuperadmin $issuperadmin");
  }

  // String? islogin;
// ignore: todo
  @override
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1920, 1080),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ReferalPartnerProvider()),
            ChangeNotifierProvider(create: (_) => NewRefferalPartner()),
            ChangeNotifierProvider(
                create: (_) => RefferelPartnerMainScreenProvider()),
          ],
          child: GetMaterialApp(
            // theme: da,
            debugShowCheckedModeBanner: false,
            title: 'Refferel admin',
            home: child,

            //DesktopMain(),
          ),
        );
      },
      child: login == true ? DisktopDashedBoardScreen() : DisktopSignInScreen(),
    );
  }
}
