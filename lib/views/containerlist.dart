import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  ContainerList({Key? key, required this.textA}) : super(key: key);
  Widget textA;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          //TODO
        },
        child: textA,
      ),
    );
  }
}
