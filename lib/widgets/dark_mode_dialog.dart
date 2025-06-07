import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rto_exam/generated/l10n.dart';
import 'package:rto_exam/theme/app_theme.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/common_text.dart';
import '../../controller/theme/theme_controller.dart';
import 'spacing_widget.dart';

enum ThemeOption { auto, on, off }

class DarkModeDialog extends StatefulWidget {
  final ThemeController themeController;

  const DarkModeDialog({super.key, required this.themeController});

  @override
  State<DarkModeDialog> createState() => _DarkModeDialogState();
}

class _DarkModeDialogState extends State<DarkModeDialog> {
  ThemeOption? selectedOption;

  @override
  void initState() {
    super.initState();
    // Initialize selectedOption based on current theme
    if (widget.themeController.isDarkMode.value) {
      selectedOption = ThemeOption.on;
    } else {
      selectedOption = ThemeOption.off;
    }
    // You can extend logic for Auto mode if needed
  }

  void applySelection() {
    if (selectedOption == ThemeOption.on) {
      if (!widget.themeController.isDarkMode.value) {
        widget.themeController.toggleTheme();
      }
    } else if (selectedOption == ThemeOption.off) {
      if (widget.themeController.isDarkMode.value) {
        widget.themeController.toggleTheme();
      }
    } else if (selectedOption == ThemeOption.auto) {
      if (widget.themeController.isDarkMode.value) {
        widget.themeController.toggleTheme();
      }
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50.h,
            color: Theme.of(context).cardColor,
            width: double.infinity,
            child: Padding(
              padding:AppDimensions. paddingLeftMedium,
              child: Row(
                children: [
                  CommonText(
                    text: l10n.darkMode,
                    fontSize: AppDimensions.fontXMedium,
                    color: AppTheme().getFontColor(context),
                    fontWeight: AppFontWeights.semiBold,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                      child: Icon(Icons.close,color: AppTheme().getSubFontColor(context))),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Spacing.height(10),
          buildOptionTile(context, l10n, ThemeOption.auto, 'Auto'),
          Divider(color: AppTheme().getSubFontColor(context)),
          buildOptionTile(context, l10n, ThemeOption.on, l10n.on),
          Divider(color:  AppTheme().getSubFontColor(context)),
          buildOptionTile(context, l10n, ThemeOption.off, l10n.off),
        ],
      ),
    );
  }

  Widget buildOptionTile(BuildContext context, S l10n, ThemeOption option, String label) {
    bool isSelected = selectedOption == option;

    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
        applySelection();

      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        // color: AppColors.lightGrayMode.withOpacity(0.3),
        child:
        Row(
          children: [
            CommonText(text: label,
              fontSize: AppDimensions.fontMedium,
              color: AppTheme().getFontColor(context),
              fontWeight: AppFontWeights.normal,
            ),
            Spacer(),
            if (isSelected)
              Icon(Icons.check, color: AppTheme().getFontColor(context), size: 22.sp),
          ],
        ),
      ),
    );
  }

}



