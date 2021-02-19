import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key key,
    @required this.title,
    @required this.slivers,
    this.reverse = false,
  }) : super(key: key);

  final String title;
  final List<Widget> slivers;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return DefaultStickyHeaderController(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: CustomScrollView(
          slivers: slivers,
          reverse: reverse,
        ),
        floatingActionButton: const _FloatingActionButton(),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.adjust),
      backgroundColor: Colors.green,
      onPressed: () {
        final double offset =
            DefaultStickyHeaderController.of(context).stickyHeaderScrollOffset;
        PrimaryScrollController.of(context).animateTo(
          offset,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }
}

//----------------------------VS plot header---------
class VSHeader extends StatelessWidget {
  const VSHeader({
    Key key,
    this.index,
    this.title,
    this.color = Colors.lightBlue,
  }) : super(key: key);

  final String title;
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
//                          height: 40,
            width: 60,
            child: Card(
              //change to SPO2 Icon here
              child: Container(
                color: Colors.pink,
              ),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 17),
                Row(
                  children: <Widget>[
                    Text(
                      '$title',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
