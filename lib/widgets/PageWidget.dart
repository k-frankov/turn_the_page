import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final int pageNumber;
  final String text;
  const PageWidget(
      {required Key key, required this.pageNumber, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(fontSize: 16.0),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 32.0),
              Expanded(
                child: Text(
                  this.text,
                ),
              ),
              const SizedBox(height: 32.0),
              Center(child: Text(this.pageNumber.toString())),
            ],
          ),
        ),
      ),
    );
  }
}
