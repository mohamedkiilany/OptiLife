import 'package:flutter/material.dart';

class SettingsWidgets extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback ontap;
  final String trailing;

  final IconData icon;
  SettingsWidgets({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.ontap,
    required this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    bool sub = false;
    if (subtitle == null) {
      sub = true;
    } else {
      sub = false;
    }

    return ListTile(
      onTap: ontap,
      leading: CircleAvatar(radius: 25, child: Icon(icon)),
      title: Text(title),
      subtitle: sub ? null : Text(subtitle!),
      trailing: Text(trailing, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class toggle extends StatelessWidget {
  final String option;

  final VoidCallback ontap;
  final VoidCallback ontap1;
    final VoidCallback? ontap2;

  final String option1;
  final int yee;
  String ? option2;

  toggle({
    super.key,
    required this.option,
    required this.ontap,
    required this.ontap1,
    required this.option1,
    required this.yee,this.option2  , this.ontap2,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Container(
              width: 120,
              height: 36,
              color: yee==1 ? Colors.white : Color(0xFFEEF0F6),
              child: Center(
                child: Text(
                  option,textAlign: TextAlign.center,
                  style: yee==1 ? TextStyle(color: Color(0xFF1C7A3E)) : null,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ontap1,
            child: Container(
              width: 120,
              height: 36,
              color: yee==2 ? Colors.white : Color(0xFFEEF0F6),
              child: Center(
                child: Text(
                  option1,textAlign: TextAlign.center,
                  style: yee==2 ? TextStyle(color: Color(0xFF1C7A3E)) :null ,
                ),
              ),
            ),
          ), option2==null ? const SizedBox.shrink():GestureDetector(
            onTap: ontap2,
            child: Container(
              width: 120,
              height: 36,
              color: yee==3 ? Colors.white : Color(0xFFEEF0F6),
              child: Center(
                child: Text(
                  option2!,textAlign: TextAlign.center,
                  style: yee==3 ? TextStyle(color: Color(0xFF1C7A3E)) :null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}class settingssss extends StatelessWidget{
   final String title;
  final VoidCallback ontap;
  final String trailing;
  final IconData icon;

  settingssss({super.key,required this.ontap,required this.title,required this.trailing,required this.icon});
  @override
  Widget build(BuildContext context) {
   
return   ListTile(
      onTap: ontap,
      title: Row(spacing: 5,children: [Icon(icon),Text(title)],),
      trailing: Text('$trailing >', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
    ); }
}
class switchh extends StatelessWidget{
   final String title;
  final String sub;
  final bool value;
    final ValueChanged<bool> onChanged;


  switchh({super.key,required this.title,required this.sub,required this.value,    required this.onChanged,
});
  @override
  Widget build(BuildContext context) {
   
return   ListTile(
      title: Text(title),
      subtitle: Text(sub),
      trailing: Switch(value: value, onChanged: onChanged ,),
    ); }
}