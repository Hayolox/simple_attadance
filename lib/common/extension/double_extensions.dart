import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_banking/common/extension/extension.dart';

extension SpacingExtension on double {
  Widget get width => SizedBox(width: w);

  Widget get height => SizedBox(height: h);
}

extension DividerExtension on double {
  Widget get divider => Divider(
        height: h,
        thickness: h,
        color: HexColorExtension.fromHex('#E0E0E0'),
      );
}
