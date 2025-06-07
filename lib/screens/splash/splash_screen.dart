import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rto_exam/screens/home/home_screen.dart';
import 'package:rto_exam/screens/language/language_selection_screen.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';

import '../../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        // MaterialPageRoute(builder: (context) => LanguageSelectionScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
          'https://play-lh.googleusercontent.com/4BmVp8HRlfwIZzJoRW1_XHztzrMFv0QGOBXQeloJQMb7bIU_5Daj-yWvQbv45QxFTuE',
          width: 200.w,
          height: 200.h,
        ),
        Spacing.height(30),
        CommonText(
          text: l10n.welcomeTORTOExam,
          fontSize: AppDimensions.fontXLarge,
          color: Theme.of(context).scaffoldBackgroundColor,
          fontWeight: AppFontWeights.bold,
        ),
        Spacing.height(10),
        CommonText(
          text: l10n.pleaseSelectStateLanguage,
          fontSize: AppDimensions.fontMedium,
          color: Theme.of(context).scaffoldBackgroundColor,
          fontWeight: AppFontWeights.normal,
        ),
        Spacing.height(50),
         CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).scaffoldBackgroundColor,),)
      ])),
      bottomNavigationBar: Padding(
        padding: AppDimensions.paddingBottomMedium,
        child: CommonText(
          textAlign: TextAlign.center,
          text: l10n.poweredBy,
          fontSize: AppDimensions.fontSmall - 1,
          color: Theme.of(context).scaffoldBackgroundColor,
          fontWeight: AppFontWeights.bold,
        ),
      ),
    );
  }
}
