import 'package:flutter/material.dart';
import 'package:move_app/common/extensions/size_extensions.dart';

class Logo extends StatelessWidget {
  const Logo({Key key, @required this.height})
      : assert(height != null, 'height must not null'),
        assert(height > 0, 'height should begreater than 0'),
        super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/pngs/logo.png',
      color: Colors.white,
      height: height.h,
    );
  }
}
