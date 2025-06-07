import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rto_exam/controller/language/language_selection_controller.dart';
import 'package:rto_exam/controller/theme/theme_controller.dart';
import 'package:rto_exam/screens/splash/splash_screen.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(LanguageController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    ThemeController themeController = Get.find();
    String language = box.read('selected_language') ?? 'en';
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Sizer(builder: (context, orientation, deviceType) {
          return Obx(() => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'RTO Exam : TraffIQ',
            // theme: ThemeData(
            //   primaryColor: AppColors.primaryBlue,
            //   colorScheme: ColorScheme.fromSwatch(
            //     primarySwatch: MaterialColor(
            //       AppColors.primaryBlue.value,
            //       const {
            //         50: Color(0xFFE8F5FC),
            //         100: Color(0xFFC5E6F8),
            //         200: Color(0xFF9FD5F3),
            //         300: Color(0xFF78C4EE),
            //         400: Color(0xFF5BB7EB),
            //         500: Color(0xFF1E95D3),
            //         600: Color(0xFF37A3E4),
            //         700: Color(0xFF2F99E0),
            //         800: Color(0xFF2790DD),
            //         900: Color(0xFF1A7FD7),
            //       },
            //     ),
            //     accentColor: AppColors.primaryBlue,
            //   ),
            //   visualDensity: VisualDensity.adaptivePlatformDensity,
            //   appBarTheme: AppBarTheme(
            //     backgroundColor: AppColors.primaryBlue,
            //     foregroundColor: Colors.white,
            //   ),
            //   scaffoldBackgroundColor: AppColors.backGroundColor,
            // ),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.theme,
            locale: Locale(language),
            supportedLocales: const [
              Locale('en'),
              Locale('hi'),
            ],
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (locale == null) return supportedLocales.first;
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            home: SplashScreen(),
          ),);
        });
      },
    );
  }
}
