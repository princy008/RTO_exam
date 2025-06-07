// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:rto_exam/generated/l10n.dart';
// import 'package:rto_exam/theme/app_theme.dart';
// import 'package:rto_exam/utils/colors.dart';
// import 'package:rto_exam/utils/constant.dart';
// import 'package:rto_exam/widgets/common_app_bar.dart';
// import 'package:rto_exam/widgets/common_text.dart';
//
// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final l10n = S.of(context);
//
//     return Scaffold(
//       backgroundColor: AppTheme().getQuizBackgroundColor(context),
//       appBar: CommonAppBar(
//         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//         title: l10n.settingsHelp,
//         textColor: AppColors.backGroundColor,
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(Icons.arrow_back, color: AppColors.backGroundColor),
//         ),
//         actions: [
//           Center(
//             child: Padding(
//               padding: AppDimensions.paddingRightMedium,
//               child:CommonText(
//                 text: l10n.getVersion,
//                 fontSize: AppDimensions.fontMedium,
//                 color: AppColors.backGroundColor,
//                 fontWeight: AppFontWeights.normal,
//               ),
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 10),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5.r),
//                 color: Theme.of(context).cardColor,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Theme.of(context).shadowColor.withOpacity(0.1),
//                     blurRadius: 8.r,
//                     offset: Offset(0, 2.5),
//                   ),
//                 ],
//               ),
//               padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall-4),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium, vertical: AppDimensions.paddingSmall),
//                     child: CommonText(
//                       text: l10n.settingsHelp,
//                       fontSize: AppDimensions.fontXMedium,
//                       color: AppTheme().getFontColor(context),
//                       fontWeight: AppFontWeights.medium,
//                     ),
//                   ),
//                   settingRow(Icons.location_on, l10n.changeState, "Gujarat"),
//                   dividerLine(),
//                   settingRow(Icons.language, l10n.changeLanguage, "English"),
//                   dividerLine(),
//                   settingRow(Icons.dark_mode, l10n.darkMode, l10n.off),
//                   // dividerLine(),
//                   // settingRow(Icons.description, "Forms", ""),
//                   // dividerLine(),
//                   // settingRow(Icons.sync_alt, "Process of Driving Licence", ""),
//                   // dividerLine(),
//                   // settingRow(Icons.apartment, "RTO Offices", ""),
//                   dividerLine(),
//                   settingRow(Icons.email, "Contact Us", ""),
//                   // // dividerLine(),
//                   // settingRow(Icons.location_pin, "Add Driving School", ""),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 10),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5.r),
//                 color: Theme.of(context).cardColor,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Theme.of(context).shadowColor.withOpacity(0.1),
//                     blurRadius: 8.r,
//                     offset: Offset(0, 2.5),
//                   ),
//                 ],
//               ),
//               padding: EdgeInsets.symmetric(vertical: 12),
//               child: Column(
//                 children: [
//                   settingRow(Icons.share, "Share App", ""),
//                   dividerLine(),
//                   settingRow(Icons.star, "Rate App", ""),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget sectionTitle(String title) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: Text(
//         title,
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//     );
//   }
//
//   Widget settingRow(IconData icon, String title, String trailingText) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingMedium, vertical: AppDimensions.paddingMedium),
//       child: Row(
//         children: [
//           Icon(icon, size: 24),
//           SizedBox(width: 16),
//           Expanded(child: Text(title, style: TextStyle(fontSize: 16))),
//           if (trailingText.isNotEmpty)
//             Text(trailingText, style: TextStyle(color: Colors.grey[700])),
//           Icon(Icons.arrow_drop_down),
//         ],
//       ),
//     );
//   }
//
//   Widget dividerLine() {
//     return Container(
//       // margin: EdgeInsets.symmetric(horizontal: 16),
//       height: 1,
//       color: Colors.grey[300],
//     );
//   }
//
// }
//
//
// class SettingsScreenRowBased extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.yellow[700],
//         title: Text("Settings & Help", style: TextStyle(color: Colors.black)),
//         leading: Icon(Icons.arrow_back, color: Colors.black),
//         actions: [
//           Center(
//             child: Padding(
//               padding: EdgeInsets.only(right: 16),
//               child: Text("v3.43 (101)", style: TextStyle(color: Colors.black)),
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Remove Ads button
//             Container(
//               color: Colors.yellow[700],
//               width: double.infinity,
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.block, color: Colors.black),
//                   SizedBox(width: 8),
//                   Text("Remove Ads : ₹50.00", style: TextStyle(fontSize: 16, color: Colors.black)),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 10),
//
//             // ==== Settings & Help Section ====
//             Container(
//               color: Colors.grey[100],
//               padding: EdgeInsets.symmetric(vertical: 12),
//               child: Column(
//                 children: [
//                   settingRow(Icons.location_on, "Change State", "Gujarat"),
//                   dividerLine(),
//                   settingRow(Icons.language, "Change Language", "English"),
//                   dividerLine(),
//                   settingRow(Icons.dark_mode, "Dark Mode", "Off"),
//                   dividerLine(),
//                   settingRow(Icons.description, "Forms", ""),
//                   dividerLine(),
//                   settingRow(Icons.sync_alt, "Process of Driving Licence", ""),
//                   dividerLine(),
//                   settingRow(Icons.apartment, "RTO Offices", ""),
//                   dividerLine(),
//                   settingRow(Icons.email, "Contact Us", ""),
//                   dividerLine(),
//                   settingRow(Icons.location_pin, "Add Driving School", ""),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 10),
//
//             // ==== Share & Rate Section ====
//             Container(
//               color: Colors.grey[100],
//               padding: EdgeInsets.symmetric(vertical: 12),
//               child: Column(
//                 children: [
//                   settingRow(Icons.share, "Share App", ""),
//                   dividerLine(),
//                   settingRow(Icons.star, "Rate App", ""),
//                 ],
//               ),
//             ),
//
//             // Ad Banner Image (placeholder)
//             SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: Image.network(
//                 'https://m.media-amazon.com/images/I/81oHCMtj-fL._SL1500_.jpg',
//                 height: 80,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Setting row using Row and Expanded
//   Widget settingRow(IconData icon, String title, String trailingText) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       child: Row(
//         children: [
//           Icon(icon, size: 24),
//           SizedBox(width: 16),
//           Expanded(child: Text(title, style: TextStyle(fontSize: 16))),
//           if (trailingText.isNotEmpty)
//             Text(trailingText, style: TextStyle(color: Colors.grey[700])),
//           Icon(Icons.arrow_drop_down),
//         ],
//       ),
//     );
//   }
//
//   // Divider line
//   Widget dividerLine() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 16),
//       height: 1,
//       color: Colors.grey[300],
//     );
//   }
// }
//
