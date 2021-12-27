import 'package:eca_packages/src/appbar/container.dart';
import 'package:eca_packages/src/text_and_textformfield/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownShowFile extends StatefulWidget {
  final String fileName;
  final String fileTitle;
  final bool showStatusBar;
  final bool hideStatusBarOnDispose;
  final Color? appBarIconAndTextColor;
  final Color? appBarBackgroundColor;
  final Color? statusBarColor;

  const MarkdownShowFile({
    Key? key,
    required this.fileName,
    required this.fileTitle,
    this.showStatusBar = true,
    this.appBarIconAndTextColor,
    this.hideStatusBarOnDispose = false,
    this.statusBarColor,
    this.appBarBackgroundColor,
  }) : super(key: key);

  @override
  _MarkdownShowFileState createState() => _MarkdownShowFileState();
}

class _MarkdownShowFileState extends State<MarkdownShowFile> {
  late String file;
  @override
  void initState() {
    super.initState();
    file = widget.fileName;
    if (widget.showStatusBar) {
      _showStatusBar();
    } else {
      _hideStatusBar();
    }
  }

  _showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: widget.statusBarColor,
    //   systemNavigationBarColor:
    //       (Platform.isAndroid) ? widget.statusBarColor : null,
    // ));
  }

  _hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.hideStatusBarOnDispose) {
      _hideStatusBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.appBarBackgroundColor ??
              Theme.of(context).appBarTheme.backgroundColor,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: AppBarContainer(
              child: Icon(
                Icons.arrow_back,
                color: widget.appBarIconAndTextColor ??
                    Theme.of(context).appBarTheme.foregroundColor,
                size: 30,
              ),
            ),
          ),
          title: TextECA(
            text: widget.fileTitle,
            fontSize: 25,
            color: widget.appBarIconAndTextColor ??
                Theme.of(context).appBarTheme.foregroundColor,
          ),
        ),
        body: displayMarkdown(getFile()));
  }

  FutureBuilder<String> displayMarkdown(String file) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(file),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            data: snapshot.data!,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  String getFile() {
    return file;
  }

  String setFile(String name) {
    file = name;
    return file;
  }
}
