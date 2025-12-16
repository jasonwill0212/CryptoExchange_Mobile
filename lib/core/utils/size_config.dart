import 'package:flutter/widgets.dart';

extension SizeConfig on BuildContext {
  double w(double v) => MediaQuery.of(this).size.width * v / 375;
  double h(double v) => MediaQuery.of(this).size.height * v / 812;
}
