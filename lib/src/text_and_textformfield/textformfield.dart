import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFormFieldECA extends StatefulWidget {
  final Function(String?)? onSaved;
  final List<String> errorMessages;
  final List<Function(String?)> validationFunctions;
  final int errorMaxLines;
  final bool obscureText;
  final List<IconData>? aditionalSufixIcons;
  final VoidCallback? onPressAditionalSufixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Function(bool)? registerStatusInStoreForm;
  final Function(String)? registerValueInStoreForm;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? textInputFormatters;
  final String? prefixText;
  final FocusNode? nextFocus;
  final String? valueToTextController;
  final int maxLines;
  final String? hintText;
  final Color? hintTextColor;
  final bool showSuffixIcon;
  final bool? enabled;
  final bool autofocus;
  final Icon? suffixIcon;
  final Color? checkedSuffixColor;
  final Color? errorSuffixColor;
  final bool isObservable;
  final TextAlign? textFieldTextAlign;
  final double? fontSize;
  final Color? fontColor;
  final double? bottomContentPadding;
  final bool requiredField;
  final int? minLines;
  final double? errorFontSize;
  final Color? fillColor;
  final int? maxLength;

  const TextFormFieldECA({
    Key? key,
    this.onSaved,
    required this.errorMessages,
    required this.validationFunctions,
    this.errorMaxLines = 1,
    this.obscureText = false,
    this.aditionalSufixIcons,
    this.onPressAditionalSufixIcon,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.registerStatusInStoreForm,
    this.registerValueInStoreForm,
    this.textEditingController,
    this.textInputFormatters,
    this.prefixText,
    this.focusNode,
    this.nextFocus,
    this.valueToTextController,
    this.maxLines = 1,
    this.hintText,
    this.showSuffixIcon = false,
    this.enabled = true,
    this.autofocus = false,
    this.suffixIcon,
    this.checkedSuffixColor,
    this.errorSuffixColor,
    this.isObservable = false,
    this.textFieldTextAlign,
    this.fontSize,
    this.hintTextColor,
    this.fontColor,
    this.bottomContentPadding,
    this.requiredField = false,
    this.minLines,
    this.errorFontSize,
    this.fillColor,
    this.maxLength,
  }) : super(key: key);

  @override
  _TextFormFieldECAState createState() => _TextFormFieldECAState();
}

class _TextFormFieldECAState extends State<TextFormFieldECA> {
  bool? hasError;
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool hasSufixIcons = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.textEditingController ??
        TextEditingController(
          text: widget.valueToTextController ?? '',
        );
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selectAll();
      }
    });

    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        if (!mounted) return;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final fontSize =
        widget.fontSize ?? Theme.of(context).textTheme.caption?.fontSize ?? 12;

    if (widget.isObservable &&
        widget.valueToTextController != null &&
        widget.valueToTextController != _controller.text) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _controller.text = widget.valueToTextController!;
      });
    }
    return TextFormField(
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + fontSize * 8),
      style: TextStyle(
        fontSize: fontSize,
        color: widget.fontColor ?? Theme.of(context).textTheme.caption?.color,
      ),
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      minLines: widget.minLines ?? widget.maxLines,
      maxLines: widget.minLines != null && widget.maxLines < widget.minLines!
          ? widget.minLines
          : widget.maxLines,
      obscureText: widget.obscureText,
      focusNode: _focusNode,
      inputFormatters:
          widget.textInputFormatters != null ? widget.textInputFormatters! : [],
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      onChanged: (value) {
        setState(() {
          hasError = (value.isNotEmpty) ? false : null;
        });
        for (var i = 0; i < widget.validationFunctions.length; i++) {
          if (!widget.validationFunctions[i](value)) {
            setState(() {
              hasError = true;
            });
          }
        }

        if (widget.registerStatusInStoreForm != null) {
          widget.registerStatusInStoreForm!(!hasError!);
        }
        if (widget.registerValueInStoreForm != null) {
          widget.registerValueInStoreForm!(value);
        }
      },
      validator: (value) {
        for (var i = 0; i < widget.validationFunctions.length; i++) {
          if (!widget.validationFunctions[i](value)) {
            return widget.errorMessages[i];
          }
        }
        return null;
      },
      controller: _controller,
      textAlign: widget.textFieldTextAlign ?? TextAlign.left,
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? Colors.white,
        errorStyle: TextStyle(fontSize: widget.errorFontSize),
        counterStyle:
            TextStyle(color: hasError ?? false ? Colors.red : widget.fontColor),
        counterText: widget.maxLength != null
            ? !(hasError ?? false)
                ? '${_controller.text.length.toString()}/${widget.maxLength}'
                : 'Valor mínimo/máximo atingido: ${_controller.text.length.toString()}/${widget.maxLength}'
            : null,
        prefixText: widget.prefixText ?? '',
        suffixIcon: _buildSufixIcon(context),
        filled: true,
        errorMaxLines: widget.errorMaxLines,
        contentPadding: EdgeInsets.only(
          top: 10.0,
          bottom: widget.bottomContentPadding ?? 10.0,
          left: 10.0,
          right: !hasSufixIcons ? 10.0 : 0,
        ),
        // vertical: 10.0, horizontal: !hasSufixIcons ? 10.0 : 0),
        hintText: widget.hintText ?? '',
        hintStyle: TextStyle(fontSize: 14, color: widget.hintTextColor),
      ),
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.nextFocus == null
          ? null
          : (value) => FocusScope.of(context).requestFocus(widget.nextFocus),
    );
  }

  Widget? _buildSufixIcon(BuildContext context) {
    if (!widget.showSuffixIcon && !widget.requiredField) {
      return null;
    } else if (widget.suffixIcon != null && (hasError == null || !hasError!)) {
      return null;
    }

    List<Widget> sufixIcons = [];

    if (widget.suffixIcon != null) {
      sufixIcons.add(widget.suffixIcon!);
    } else {
      if (hasError != null && !hasError!) {
        sufixIcons.add(
          FaIcon(
            FontAwesomeIcons.checkCircle,
            color: Theme.of(context).iconTheme.color,
          ),
        );
      }
      // if (hasError != null && hasError! && _controller.text.isNotEmpty) {
      if (hasError != null && hasError!) {
        sufixIcons.add(const Icon(
          Icons.error,
          color: Colors.red,
        ));
      }
    }
    _addAdditionalSufixIcon(sufixIcons,
        widget.errorSuffixColor ?? Theme.of(context).iconTheme.color);

    // return Container();
    hasSufixIcons = sufixIcons.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: sufixIcons),
    );
  }

  void _addAdditionalSufixIcon(List<Widget> sufixIcons, Color? color) {
    if (widget.aditionalSufixIcons != null) {
      sufixIcons.add(const SizedBox(width: 8));
      sufixIcons.add(InkWell(
        onTap: () => widget.onPressAditionalSufixIcon == null
            ? null
            : widget.onPressAditionalSufixIcon!(),
        child: FaIcon(
          widget.aditionalSufixIcons![widget.obscureText ? 1 : 0],
          color: color,
        ),
      ));
    }
  }
}

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}
