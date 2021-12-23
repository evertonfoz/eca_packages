import 'package:eca_packages/src/markdown/markdown.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomePoliceAndTermUseAccess extends StatelessWidget {
  final String policeFileName;
  final String policeFileTitle;
  final String termsFileName;
  final String termsFileTitle;
  final Color? appBarIconAndTextColor;
  final Color? appBarBackgroundColor;
  final Color? statusBarColor;
  final bool showStatusBar;
  final bool hideStatusBarOnDispose;

  const WelcomePoliceAndTermUseAccess({
    Key? key,
    required this.policeFileName,
    required this.policeFileTitle,
    required this.termsFileName,
    required this.termsFileTitle,
    this.appBarIconAndTextColor,
    this.statusBarColor,
    this.appBarBackgroundColor,
    this.showStatusBar = true,
    this.hideStatusBarOnDispose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white70,
          ),
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
                            fileName: termsFileName, fileTitle: termsFileTitle),
                      ),
                    ),
            ),
          ],
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
