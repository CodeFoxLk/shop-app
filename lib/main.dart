import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shop_app/configs/theme/custom_colors.dart';
import 'package:shop_app/configs/theme/custom_text_styles.dart';
import 'package:shop_app/configs/theme/custom_theme_data.dart';
import 'package:shop_app/configs/theme/ui_parameters.dart';
import 'package:shop_app/controllers/dynamiclink_controller.dart';
import 'package:shop_app/routes/routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //dynamic links
  final initialLink = await DynamicLinkController.initializeApp();
  DynamicLinkController.listen();
  runApp(MyApp(link: initialLink));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, this.link}) : super(key: key);

  final PendingDynamicLinkData? link;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //dynamic links
    Future.delayed(Duration.zero, () {
      DynamicLinkController.navigationHandler(link: widget.link);
    });
    super.initState();
  }

  Iterable<ThemeExtension<dynamic>> getExtentions(bool isDarkMode) => [
        UIParameters(),
        CustomTextStyles.getStyle(isDarkMode),
        AppColors.getStyle(isDarkMode)
      ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue,
          extensions: getExtentions(false),
          appBarTheme: appBarTheme),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue,
          extensions: getExtentions(true),
          appBarTheme: appBarTheme),
      // home: const HomeScreen(),
      initialRoute: HomeScreen.routeName,
      getPages: AppRoutes.pages,
    );
  }
}
