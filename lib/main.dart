import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:turn_the_page/data/Book.dart';
import 'package:turn_the_page/widgets/PageTurnWidget.dart';
import 'package:turn_the_page/widgets/PageWidget.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.pinkAccent,
      ),
      home: ExampleScreen(),
    ),
  );
}

class ExampleScreen extends StatefulWidget {
  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 1.0,
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var pageWidget = PageWidget(
      key: UniqueKey(),
      pageNumber: Book.pages[1].pageNumber,
      text: Book.pages[1].text);

  var pageTurnWidget = PageWidget(
    key: UniqueKey(),
    text: Book.pages[0].text,
    pageNumber: Book.pages[0].pageNumber,
  );

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final int delta = 8;

    if (details.delta.dx > delta) {
      if (_controller.value == 0.0) {
        _controller.forward();
      } else {
        if (pageTurnWidget.pageNumber == 1) {
          return;
        }

        setState(() {
          pageWidget = PageWidget(
              key: UniqueKey(),
              pageNumber: Book.pages[1].pageNumber,
              text: Book.pages[1].text);
          pageTurnWidget = PageWidget(
            key: UniqueKey(),
            text: Book.pages[0].text,
            pageNumber: Book.pages[0].pageNumber,
          );
          _controller.reset();
          _controller.value = 0.0;
          //_controller.forward();
        });
      }
    } else if (details.delta.dx < -delta) {
      if (_controller.value != 0.0) {
        _controller.reverse();
      } else {
        if (pageWidget.pageNumber == 1) {
          return;
        }

        setState(() {
          pageTurnWidget = PageWidget(
              key: UniqueKey(),
              pageNumber: Book.pages[1].pageNumber,
              text: Book.pages[1].text);
          pageWidget = PageWidget(
              key: UniqueKey(),
              pageNumber: Book.pages[2].pageNumber,
              text: Book.pages[2].text);
          _controller.reset();
          _controller.value = 1.0;
          _controller.reverse();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFCC),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            pageWidget,
            PageTurnWidget(
              key: UniqueKey(),
              amount: _controller,
              child: pageTurnWidget,
            ),
          ],
        ),
      ),
    );
  }
}
