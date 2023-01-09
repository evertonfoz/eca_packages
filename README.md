This package was developed in order to specialize components used in the development of my applications. It's not a single-use package, as the rule of thumb for package adoption dictates. Here at ECA Packages you will see several widgets.

It is important that you read all the documentation, check all the widgets and evaluate whether or not to use this package. You can fork it and get just the widget you want.

## Features

TextECA: It is a widget similar to **Text**, however, it uses **RichText** to compose the text to be rendered

## Getting started

To use this package, first of all, you need to configure `pubspec.yaml` according to what is presented below.

```
dependencies:
  eca_packages: <última-versão>
```

After configuration, you need to run flutter packages get, on the console / terminal or in your IDE.

In your Widget it is necessary to import the following package.

```
import 'package:eca_packages/eca_packages.dart';
```

## Basic use

As a test for viewing a Text, we will initially have the following image, displaying a Scaffold with a single TextECA.

![The benchmark view with a TextECA Widget](https://github.com/evertonfoz/eca_packages/tree/main/assets/readme/texteca.png)

In order to get to the previous images, we need to implement the widget presented below.

```
import 'package:eca_packages/eca_packages.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextECA Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TextECA Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: TextECA(
          maxLines: 1,
          text: 'ECA Packages',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24,
          textAlign: TextAlign.start,
          textOverflow: TextOverflow.ellipsis,
        ));
  }
}
```
