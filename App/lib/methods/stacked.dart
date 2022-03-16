
import 'package:flutter/material.dart';
import 'dart:math' as math;


class StackedList extends StatelessWidget {
  final List<Color> _colors = Colors.primaries;
  static const _minHeight = 16.0;
  static const _maxHeight = 120.0;
  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: _colors.map((color) => StackedListChild(minHeight: _minHeight, maxHeight: _colors.indexOf(color) == _colors.length - 1 ? MediaQuery.of(context).size.height : _maxHeight,
      pinned: true,
      child:
      Container(
        color: _colors.indexOf(color) == 0 ? Colors.black : _colors[_colors.indexOf(color) - 1],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(_minHeight)),
            color: color,
          ),
        ),
      ),
    ),
    ).toList(),
  );
}



class StackedListChild extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final bool pinned;
  final bool floating;
  final Widget child;

  SliverPersistentHeaderDelegate get _delegate => _StackedListDelegate(
      minHeight: minHeight, maxHeight: maxHeight, child: child);

  const StackedListChild({required this.minHeight, required this.maxHeight, required this.child, this.pinned = false, this.floating = false,})  : assert(child != null),
        assert(minHeight != null),
        assert(maxHeight != null),
        assert(pinned != null),
        assert(floating != null);


  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
      key: key, pinned: pinned, floating: floating, delegate: _delegate);
}

class _StackedListDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _StackedListDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_StackedListDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}



