import 'package:codecraft/core/global/generaldata/templates.dart';
import 'package:flutter/material.dart';

class CPageView extends StatefulWidget {
  const CPageView({super.key});

  @override
  State<CPageView> createState() => _CPageViewState();
}

class _CPageViewState extends State<CPageView> {
  List<Map<String,String>>data=templates;
  @override
  Widget build(BuildContext context) {
    return PageView(

    );
  }
}
