import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf_viewer/config/theme/color_scheme.dart';

import '../../../config/theme/app_colors.dart';
import '../../constants/asset_res.dart';
import '../../style/text_styles.dart';

class DescriptionTextFieldWidget extends StatefulWidget {
  final String? title;
  final String hint;
  final String? errorText;
  final double? height;
  final bool isPassword;
  final String? icPath;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;

  const DescriptionTextFieldWidget(
      {super.key,
      this.title,
      required this.hint,
      this.errorText,
      this.icPath,
      this.isPassword = false,
      this.height,
      this.controller,
      this.textInputType = TextInputType.text,
      this.inputFormatters,
      this.onChanged});

  @override
  State<DescriptionTextFieldWidget> createState() =>
      _DescriptionTextFieldWidgetState();
}

class _DescriptionTextFieldWidgetState
    extends State<DescriptionTextFieldWidget> {
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
        if (widget.title == null)
          const SizedBox()
        else
          Padding(
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
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            border: Border.all(
              color: AppColors.paleBlue,
              width: 1,
            ),
          ),
          height: widget.height ?? 208,
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: widget.controller,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              hintText: widget.hint,
              border: InputBorder.none,
              hintStyle: pregular.copyWith(
                color: AppColors.steelGrey,
                fontSize: 14,
              ),
              prefixIcon: widget.icPath == null
                  ? null
                  : SvgPicture.asset(
                      widget.icPath!,
                      width: 16,
                      height: 16,
                    ),
              suffixIcon: widget.isPassword == false
                  ? null
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      icon: isShowPassword == true
                          ? SvgPicture.asset(
                              AssetRes.icEyeShowed,
                              width: 24,
                              height: 24,
                            )
                          : SvgPicture.asset(
                              AssetRes.icEyeHidden,
                              width: 24,
                              height: 24,
                            )),
            ),
            cursorColor: AppColors.primary,
            style: pmedium.copyWith(
              fontSize: 15,
              color: Theme.of(context).colorScheme.textColor,
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            textCapitalization: TextCapitalization.sentences,
            obscureText: false,
            enableSuggestions: true,
            autocorrect: !isShowPassword,
            maxLines: null,
            minLines: 1,
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 12),
            child: Text(
              widget.errorText!,
              style: pmedium.copyWith(
                  fontSize: 14, color: AppColors.red, height: 1),
            ),
          ),
      ],
    );
  }
}
