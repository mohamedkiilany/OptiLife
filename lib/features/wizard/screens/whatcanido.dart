import 'package:flutter/material.dart';

class Whatcanido extends StatefulWidget {
  @override
  State<Whatcanido> createState() => _WhatcanidoState();
}

class _WhatcanidoState extends State<Whatcanido> {
  bool press = false;
  bool press1=false;
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
          InkWell(
            onTap: () {
              setState(() {
                press = !press;
              });
            },
            child: press
                ? Container(
                    width: 20,
                    height: 20,
                    child: Column(children: [Text(data), Text(data)]),
                  )
                : Container(
                    width: 20,
                    height: 20,
                    child: Column(children: [Text(data), Text(data)]),
                  ),
          ),
          Row(children: [Icon(icon), Text(data)]),
        InkWell(child: Container(width: 120,height: 30,child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Container(width:10 ,height: 10,child: Icon(icon),),Column(children: [Text(data),Text(data)],),press1 ? CircleAvatar():CircleAvatar()],),),)],
      ),
    );
  }
}
