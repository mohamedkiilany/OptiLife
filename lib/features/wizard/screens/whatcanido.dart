import 'package:flutter/material.dart';
import 'package:optilife_app/features/wizard/widgets/whatcanidowidgets.dart';

class Whatcanido extends StatefulWidget {
  @override
  State<Whatcanido> createState() => _WhatcanidoState();
}

class _WhatcanidoState extends State<Whatcanido> {
  bool press = false;
  bool press1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activity Detail'), centerTitle: true),
      body: Column(
        children: [
          Text('What can i do today?'),
          Text('Tell us your time & energy .We adapt the workout instantly.'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('AVAILABLE TIME'), Text('custom duration')],
          ),
          Row(children: [Time_exrcersie(num: '10'),Time_exrcersie(num: '20'),Time_exrcersie(num: '30'),Time_exrcersie(num: '45+')],),
          icon_text(
            icon1: Icon(Icons.abc_outlined),
            label: "current energy level",
          ),
          Container(
            child: Column(
              children: [
                energy_lvl(
                  eng: 'Low Energy',
                  det: 'Gentle mobility & core restore',
                  ic: Icon(Icons.abc_outlined),
                ),
                energy_lvl(
                  eng: 'Normal',
                  det: 'Moderate cardio & dynamic flow',
                  ic: Icon(Icons.abc_outlined),
                ),
                energy_lvl(
                  eng: 'High Energy',
                  det: 'HIIT intervals & peak power',
                  ic: Icon(Icons.abc_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
