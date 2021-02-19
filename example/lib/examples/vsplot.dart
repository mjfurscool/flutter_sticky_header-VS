import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

import '../common.dart';

class VSplotExample extends StatelessWidget {
  const VSplotExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'VS Plot Example',
      slivers: [
        _StickyHeaderGridSPO2(index: 0),
        _StickyHeaderGridHR(index: 1),
        _StickyHeaderGridHR(index: 2),
        _StickyHeaderGridHR(index: 3),
        _StickyHeaderGridHR(index: 4),
      ],
    );
  }
}

//----------SPO2 section---------------------------
class _StickyHeaderGridSPO2 extends StatelessWidget {
  const _StickyHeaderGridSPO2({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: VSHeader(
        index: index,
        title: "SPO2", // change header title here eg. SPO2 HR RR BP
      ),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        delegate: SliverChildBuilderDelegate(
          (context, i) => GridTile(
            child: Card(
              child: Container(
                //------------------------------------the container to contain plots---------------------------------
                color: Colors.green,
              ),
            ),
            footer: Container(
              //------------------------------------footer-----------------------------------------------
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'SPO2 Plot',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          childCount:
              1, //change this to display multiple plots under one header
        ),
      ),
    );
  }
}

//------------------HR Section--------------

class _StickyHeaderGridHR extends StatelessWidget {
  const _StickyHeaderGridHR({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: VSHeader(
          index: index,
          title: "HR"), // change header title here eg. SPO2 HR RR BP
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        delegate: SliverChildBuilderDelegate(
          (context, i) => GridTile(
            child: Card(
              child: Container(
                color: Colors.green,
              ),
            ),
            footer: Container(
              color: Colors.white.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'HR Plot',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          childCount:
              1, //change this to display multiple plots under one header
        ),
      ),
    );
  }
}
