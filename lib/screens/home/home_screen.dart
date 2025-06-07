import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/controller/theme/theme_controller.dart';
import 'package:rto_exam/screens/practice/practice_screen.dart';
import 'package:rto_exam/screens/question_bank/question_bank_screen.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_app_bar.dart';
import 'package:rto_exam/widgets/common_text.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../controller/home/home_controller.dart';
import '../../generated/l10n.dart';
import '../../model/menu_model.dart'; // Add this import

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      homeController.generateData();
    });
  }

  ThemeController themeController = Get.find();
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    List<HomeCardModel> menuItems = homeController.getMenuItem(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CommonAppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: l10n.appTitle,
        textColor: AppColors.backGroundColor,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.menu,
              color: AppColors.backGroundColor,
            )),
        actions: [
          IconButton(
              onPressed: () {
                themeController.toggleTheme();
              },
              icon: Icon(
                Icons.more_vert,
                color: AppColors.backGroundColor,
              )),
        ],
      ),
      body: Column(
        children: [
         Obx(() =>  homeController.isLoading.value
             ? Center(
               child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
               Theme.of(context).primaryColor,
                          ),
                        ),
             )
             : Expanded(
           child: ListView.builder(
             padding: AppDimensions.paddingAllMedium,
             itemCount: menuItems.length,
             itemBuilder: (context, index) {
               return Padding(
                 padding: AppDimensions.paddingBottomMedium,
                 child: _buildMenuItem(menuItems[index], context),
               );
             },
           ),

         ),)
        ],
      ),
    );
  }

  Widget _buildMenuItem(HomeCardModel item, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: 8.r,
              offset: Offset(0, 2.5),
            ),
          ],
        ),
        child: SmoothContainer(
          smoothness: 0.9,
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.transparent,
          child: InkWell(
            onTap: item.onTap,
            borderRadius: BorderRadius.circular(5.r),
            child: Padding(
              padding: AppDimensions.paddingAllMedium,
              child: Row(
                children: [
                  SmoothContainer(
                    smoothness: 0.6,
                    borderRadius: BorderRadius.circular(50),
                    width: 60.w,
                    height: 60.h,
                    color: item.color,
                    alignment: Alignment.center,
                    child: Icon(
                      item.icon,
                      color: Colors.white,
                      size: Icons.psychology == item.icon ? 40.w : 30.w,
                    ),
                  ),
                  Spacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: item.title,
                          fontSize: AppDimensions.fontXMedium + 2,
                          color: AppTheme().getFontColor(context),
                          fontWeight: AppFontWeights.bold,
                        ),
                        Container(
                          width: 22.w,
                          height: 2.5.h,
                          color: item.color,
                        ),
                        Spacing.height(6),
                        CommonText(
                          text: item.subtitle,
                          fontSize: AppDimensions.fontSmall,
                          color: AppTheme().getSubFontColor(context),
                          fontWeight: AppFontWeights.medium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
