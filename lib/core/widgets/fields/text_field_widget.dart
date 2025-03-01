import 'package:pdf_viewer/config/theme/color_scheme.dart';
import 'package:pdf_viewer/core/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/app_colors.dart';
import '../../style/text_styles.dart';
import '../common/primary_icon_widget.dart';

class TextFieldWidget extends StatefulWidget {
  final String? title;
  final String hint;
  final String? errorText;
  final bool isPassword;
  final String? icPath;
  final double? width;
  final String? leadingIconPath;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;

  const TextFieldWidget({
    super.key,
    this.title,
    required this.hint,
    this.errorText,
    this.icPath,
    this.width,
    this.leadingIconPath,
    this.isPassword = false,
    this.controller,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isShowPassword = false;

  @override
  void initState() {
    isShowPassword = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.title == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  widget.title!,
                  style: pmedium.copyWith(
                    color: AppColors.steelGrey,
                    fontSize: 14,
                  ),
                ),
              ),
        Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: context.containerColor,
            border: Border.all(
              color: AppColors.paleBlue,
              width: 1,
            ),
          ),
          height: 48.h,
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: TextField(
              controller: widget.controller,
              inputFormatters: widget.inputFormatters,
              onChanged: widget.onChanged,
              focusNode: widget.focusNode,
              decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  hintStyle: pregular.copyWith(
                    color: AppColors.steelGrey,
                    fontSize: 14,
                  ),
                  prefixIcon: widget.leadingIconPath == null
                      ? null
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: primarySvgIcon(context,
                              iconPath: widget.leadingIconPath!),
                        ),
                  suffixIcon: Icon(
                    CupertinoIcons.search,
                    size: 22,
                  )),
              cursorColor: AppColors.primary,
              style: pmedium.copyWith(
                fontSize: 15,
                color: Theme.of(context).colorScheme.textColor,
              ),
              keyboardType: widget.textInputType,
              textCapitalization: TextCapitalization.sentences,
              obscureText: isShowPassword,
              enableSuggestions: isShowPassword,
              autocorrect: isShowPassword,
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 12),
            child: Text(
              widget.errorText!,
              style: pmedium.copyWith(
                fontSize: 14,
                color: AppColors.red,
                height: 1,
              ),
            ),
          ),
      ],
    );
  }
}
