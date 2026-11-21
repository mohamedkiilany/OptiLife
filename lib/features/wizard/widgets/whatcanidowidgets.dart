import 'package:flutter/material.dart';

class Time_exrcersie extends StatefulWidget {
  final String num;

  Time_exrcersie({super.key, required this.num});

  @override
  State<Time_exrcersie> createState() => _Time_exrcersieState();
}

class _Time_exrcersieState extends State<Time_exrcersie> {
  bool press = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          press = !press;
        });
      },
      child: press
          ? Container(
              width: 20,
              height: 20,
              child: Column(children: [Text(widget.num), Text("min")]),
            )
          : Container(
              width: 20,
              height: 20,
              child: Column(children: [Text(widget.num), Text("min")]),
            ),
    );
  }
}

class energy_lvl extends StatefulWidget {
  final String eng;
  final String det;
  final Icon ic;
  energy_lvl({
    super.key,
    required this.eng,
    required this.det,
    required this.ic,
  });

  @override
  State<energy_lvl> createState() => _energy_lvlState();
}

class _energy_lvlState extends State<energy_lvl> {
    bool press1 = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 120,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 10, height: 10, child: widget.ic),
            Column(children: [Text('${widget.eng}'), Text('${widget.eng}')]),
            press1 ? CircleAvatar() : CircleAvatar(),
          ],
        ),
      ),
    );
  }
}
class icon_text extends StatelessWidget{
  final Icon icon1;
  final String label;
  icon_text({super.key  ,required this.icon1,
    required this.label,});
  @override
  Widget build(BuildContext context) {
return  Row(children: [icon1, Text("$label")]);  
  }
}
