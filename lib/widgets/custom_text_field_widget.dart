import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rto_exam/utils/colors.dart';
import 'package:rto_exam/utils/constant.dart';
import 'package:flutter/foundation.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Color? prefixIconColor;
  final Color? focusedPrefixIconColor;
  final FocusNode? focusNode;
  /// add new N. 01/06
  final Widget? suffixIcon;
  final int? maxLines;
  // final Color? suffixIconColor;
  // final Color? focusedSuffixIconColor;

  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.borderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.borderRadius = 30,
    this.contentPadding,
    this.prefixIconColor,
    this.focusedPrefixIconColor,
    this.focusNode,
    /// add new N. 01/06
    this.suffixIcon,
    this.maxLines,
    // this.suffixIconColor,
    // this.focusedSuffixIconColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine icon colors based on focus state
    Color prefixIconColor =
        _isFocused ? (widget.focusedPrefixIconColor ?? AppColors.buttonColor) : (widget.prefixIconColor ?? AppColors.blueLightGray);

    // Color suffixIconColor =
    //     _isFocused ? (widget.focusedSuffixIconColor ?? AppColors.buttonColor) : (widget.suffixIconColor ?? AppColors.blueLightGray);

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode ?? _focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      /// add new N. 01/06
      maxLines: widget.maxLines ?? 1,
      style: GoogleFonts.roboto(
        fontSize: AppDimensions.fontXMedium.sp,
        color: AppColors.buttonColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: kIsWeb
            ? (widget.fillColor ?? AppColors.gray) // Web-specific fill color
            : widget.fillColor ?? Colors.transparent,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.roboto(
          color: AppColors.blueGrey,
          fontSize: AppDimensions.fontXMedium.sp,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  widget.prefixIcon,
                  color: prefixIconColor,
                  size: 21,
                ),
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.blueLightGray,
                  size: 21,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kIsWeb ? 15 : widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.lightGray,
            width: 1.5,
          ),
        ),
        enabledBorder: kIsWeb
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.lightGray,
                  width: 1.5,
                ),
              ),
        focusedBorder: kIsWeb
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: AppColors.darkGreen,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: widget.focusedBorderColor ?? AppColors.buttonColor,
                  width: 2,
                ),
              ),
        errorBorder: kIsWeb
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                ),
              ),
        focusedErrorBorder: kIsWeb
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
      ),
    );
  }
}
