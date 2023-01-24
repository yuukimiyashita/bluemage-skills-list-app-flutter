import 'package:flutter/material.dart';

Widget starRow = Row(
  children: [star],
);
Widget starRow2 = Row(
  children: [star, star],
);
Widget starRow3 = Row(
  children: [star, star, star],
);
Widget starRow4 = Row(
  children: [
    star,
    star,
    star,
    star,
  ],
);
Widget starRow5 = Row(
  children: [star, star, star, star, star],
);

Widget star = const Icon(
  Icons.star,
  color: Colors.white,
  size: 13,
);
