import 'package:flutter/material.dart';

//گردی گوشه های کادرها براساس عرض دیوایس
double deviceBasedRadius(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width <= 391) return 7;
  if (width > 391 && width <= 450) return 12;
  if (width > 450 && width <= 800) return 18;
  return 32;
}

// سایز فونت ها برای دیوایس های متفاوت
double deviceBasedFontSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width <= 391) return 12; // Small devices
  if (width > 391 && width <= 450) return 14; // Medium devices
  if (width > 450 && width <= 800) return 16; // Medium devices
  if (width > 800 && width <= 1000) return 18; // Medium devices

  return 27; // Large devices
}

// سایز فونت ها برای دیوایس های متفاوت
double deviceBasedTitrFontSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width <= 391) return 22; // Small devices
  if (width > 391 && width <= 450) return 22; // Medium devices
  if (width > 450 && width <= 800) return 22; // Medium devices
  if (width > 800 && width <= 1000) return 22; // Medium devices

  return 27; // Large devices
}

// سایز بنر برای دیوایس های متفاوت
Size deviceBasedSizeBanner(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double width = double.infinity;
  double height = 350;
  if (widthDevice <= 391) {
    width = double.infinity;
    height = 210;
    return Size(width, height);
  } // Small devices
  if (widthDevice > 391 && widthDevice <= 450) {
    width = double.infinity;
    height = 210;
    return Size(width, height);
  }
  if (widthDevice > 450 && widthDevice <= 800) {
    width = double.infinity;
    height = 210;
    return Size(width, height);
  }
  if (widthDevice > 800 && widthDevice <= 1000) {
    width = double.infinity;
    height = 210;
    return Size(width, height);
  }
  return Size(width, height);
}

// سایز آیکن ها برای دیوایس های متفاوت
Size deviceBasedSizeIcons(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double width = 150;
  double height = 350;
  if (widthDevice <= 391) {
    width = 24;
    height = 24;
    return Size(width, height);
  } // Small devices
  if (widthDevice > 391 && widthDevice <= 450) {
    width = 32;
    height = 32;
    return Size(width, height);
  }
  if (widthDevice > 450 && widthDevice <= 800) {
    width = 32;
    height = 32;
    return Size(width, height);
  }
  if (widthDevice > 800 && widthDevice <= 1000) {
    width = 32;
    height = 32;
    return Size(width, height);
  }
  return Size(width, height);
}

// فاصله ی کاشی ها از بالا برای دیوایس های متفاوت
EdgeInsets deviceSpaceFromTop(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double top = 0;

  if (widthDevice <= 391) {
    top = 15;
  } else if (widthDevice > 391 && widthDevice <= 450) {
    top = 15;
  } else if (widthDevice > 450 && widthDevice <= 800) {
    top = 15;
  } else if (widthDevice > 800 && widthDevice <= 1000) {
    top = 15;
  } else {
    top = 15;
  }

  return EdgeInsets.only(top: top);
}

// فاصله ی کاشی ها از راست برای دیوایس های متفاوت
EdgeInsets deviceSpaceFromRight(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double right = 0;

  if (widthDevice <= 391) {
    right = 15;
  } else if (widthDevice > 391 && widthDevice <= 450) {
    right = 15;
  } else if (widthDevice > 450 && widthDevice <= 800) {
    right = 15;
  } else if (widthDevice > 800 && widthDevice <= 1000) {
    right = 15;
  } else {
    right = 15;
  }

  return EdgeInsets.only(right: right);
}

// فاصله ی کاشی ها از چپ برای دیوایس های متفاوت
EdgeInsets deviceSpaceFromLeft(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double right = 0;

  if (widthDevice <= 391) {
    right = 15;
  } else if (widthDevice > 391 && widthDevice <= 450) {
    right = 15;
  } else if (widthDevice > 450 && widthDevice <= 800) {
    right = 15;
  } else if (widthDevice > 800 && widthDevice <= 1000) {
    right = 15;
  } else {
    right = 15;
  }

  return EdgeInsets.only(left: right);
}

// فاصله ی کاشی ها از پایین برای دیوایس های متفاوت
EdgeInsets deviceSpaceFromBottom(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double right = 0;

  if (widthDevice <= 391) {
    right = 15;
  } else if (widthDevice > 391 && widthDevice <= 450) {
    right = 15;
  } else if (widthDevice > 450 && widthDevice <= 800) {
    right = 15;
  } else if (widthDevice > 800 && widthDevice <= 1000) {
    right = 15;
  } else {
    right = 15;
  }

  return EdgeInsets.only(bottom: right);
}

// فاصله بین گرید ها
Size deviceSpaceGrid(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double width;
  double height;

  if (widthDevice <= 391) {
    width = 10;
    height = 20;
  } else if (widthDevice <= 450) {
    width = 10;
    height = 20;
  } else if (widthDevice <= 800) {
    width = 10;
    height = 20;
  } else if (widthDevice <= 1000) {
    width = 10;
    height = 20;
  } else {
    width = 10;
    height = 20;
  }

  return Size(width, height);
}

// سایز تولبار اپ
double toolBarHeight(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double height;
  if (widthDevice <= 391) {
    height = 65;
  } else if (widthDevice > 391 && widthDevice <= 450) {
    height = 65;
  } else if (widthDevice > 450 && widthDevice <= 800) {
    height = 65;
  } else if (widthDevice > 800 && widthDevice <= 1000) {
    height = 65;
  } else {
    height = 65;
  }
  return height;
}

Size deviceBasedWidgetSizeFixed(BuildContext context) {
  final widthDevice = MediaQuery.of(context).size.width;
  double width;
  double height;

  if (widthDevice <= 391) {
    width = 250;
    height = 75;
  } else if (widthDevice <= 450) {
    width = 280;
    height = 110;
  } else if (widthDevice <= 800) {
    width = 320;
    height = 140;
  } else if (widthDevice <= 1000) {
    width = 360;
    height = 160;
  } else {
    width = 400;
    height = 180;
  }

  return Size(width, height);
}
