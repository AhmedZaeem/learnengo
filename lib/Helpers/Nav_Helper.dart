import 'package:flutter/material.dart';

mixin Nav_Helper {
  void jump(BuildContext context, Widget to, {bool replace = false}) {
    if (replace) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => to));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => to));
    }
  }
}
