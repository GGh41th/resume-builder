import 'package:flutter/material.dart';

class ERow extends StatelessWidget {
  const ERow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.1, right: width * 0.1, top: height * 0.01),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: width*0.08,
          ),
          Padding(
            padding:  EdgeInsets.only(left: width*0.06),
            child: SizedBox(
              width: width*0.6,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
