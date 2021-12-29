import 'package:eca_packages/src/markdown/markdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomePoliceAndTermUseAccess extends StatelessWidget {
  final String policeFileName;
  final String policeFileTitle;
  final String termsFileName;
  final String termsFileTitle;
  final Color? foregroundTextColor;
  final Color? appBarIconAndTextColor;
  final Color? appBarBackgroundColor;
  final Color? statusBarColor;
  final bool showStatusBar;
  final bool hideStatusBarOnDispose;
  final TextAlign textAlign;
  final double fontSize;

  const WelcomePoliceAndTermUseAccess({
    Key? key,
    required this.policeFileName,
    required this.policeFileTitle,
    required this.termsFileName,
    required this.termsFileTitle,
    this.appBarIconAndTextColor,
    this.statusBarColor,
    this.appBarBackgroundColor,
    this.foregroundTextColor,
    this.showStatusBar = true,
    this.hideStatusBarOnDispose = false,
    this.textAlign = TextAlign.justify,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          textAlign: textAlign,
          text: TextSpan(
            style: TextStyle(
                color: foregroundTextColor ??
                    Theme.of(context).textTheme.caption?.color,
                fontSize: fontSize),
            children: <TextSpan>[
              const TextSpan(text: "Ao entrar, você concorda com a nossa\n"),
              TextSpan(
                text: "política de privacidade",
                style: const TextStyle(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _buildMarkdown(
                              fileName: policeFileName,
                              fileTitle: policeFileTitle),
                        ),
                      ),
              ),
              const TextSpan(text: " e nosso "),
              TextSpan(
                text: "Termo de uso",
                style: const TextStyle(fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _buildMarkdown(
                              fileName: termsFileName,
                              fileTitle: termsFileTitle),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildMarkdown({required String fileName, required String fileTitle}) {
    return MarkdownShowFile(
      fileName: fileName,
      fileTitle: fileTitle,
      appBarBackgroundColor: appBarBackgroundColor,
      appBarIconAndTextColor: appBarIconAndTextColor,
      statusBarColor: statusBarColor,
      hideStatusBarOnDispose: hideStatusBarOnDispose,
      showStatusBar: showStatusBar,
    );
  }
}
