import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:rto_exam/widgets/constant_widget.dart';
import 'package:rto_exam/widgets/spacing_widget.dart';

import 'common_text.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final int? cartCount;
  final int? notificationCount;
  final Widget? leading;
  final List<Widget>? actions;
  final bool forceMaterialTransparency;
  final Color? iconColor;
  final Color? textColor;
  final Color? backgroundColor;

  const CommonAppBar({
    super.key,
    this.title,
    this.cartCount = 0,
    this.notificationCount = 0,
    this.leading,
    this.actions,
    this.forceMaterialTransparency = false,
    this.iconColor,
    this.textColor, this.backgroundColor,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: forceMaterialTransparency,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      surfaceTintColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: leading,
      // leadingWidth: 60.w,
      // centerTitle: true,
      title: CommonText(
        text: title ?? '',
        fontSize: AppDimensions.fontLarge-2,
        color: textColor ?? Theme.of(context).scaffoldBackgroundColor,
        fontWeight: AppFontWeights.bold,
      ),
      actions: actions ??
          [
            getSvgImage('bag_image.svg',color: iconColor ?? AppColors.buttonColor),
            Spacing.width(12),
            getSvgImage('notification.svg',color: iconColor ?? AppColors.buttonColor),
            Spacing.width(16),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
