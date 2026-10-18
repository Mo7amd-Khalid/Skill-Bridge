import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WhiteSpace on num{

  SizedBox get horizontalSpace => SizedBox(width: toDouble().w);
  SizedBox get verticalSpace => SizedBox(height: toDouble().h);
}


