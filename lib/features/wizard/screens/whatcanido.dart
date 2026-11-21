import 'package:flutter/material.dart';
import 'package:optilife_app/features/wizard/widgets/whatcanidowidgets.dart';

class Whatcanido extends StatefulWidget {
  @override
  State<Whatcanido> createState() => _WhatcanidoState();
}

class _WhatcanidoState extends State<Whatcanido> {
  String? selectedTime;
  String? selctenrgy;
  int numbermatch = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Activity Detail'), centerTitle: true,actions: [CircleAvatar(),SizedBox(width: 10,)],),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [icon_text(icon1: Icons.stream, label: 'INSTANT SMART MATCHER',sizeeee: 20,coloric: Colors.green,colortext: Colors.green,width: 2,),
                Text(
                  'What can i do today?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Tell us your time & energy.We adapt the workout instantly.',
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    icon_text(
                      icon1: Icons.timer,
                      label: "Available Time",
                    ),
                    Text(
                      'custom duration',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 12, 86, 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  children: [
                    Time_exrcersie(
                      num: '10',
                      isSelected: selectedTime == '10',
                      onTap: () {
                        setState(() {
                          selectedTime = '10';
                        });
                      },
                    ),

                    Time_exrcersie(
                      num: '20',
                      isSelected: selectedTime == '20',
                      onTap: () {
                        setState(() {
                          selectedTime = '20';
                        });
                      },
                    ),

                    Time_exrcersie(
                      num: '30',
                      isSelected: selectedTime == '30',
                      onTap: () {
                        setState(() {
                          selectedTime = '30';
                        });
                      },
                    ),

                    Time_exrcersie(
                      num: '45+',
                      isSelected: selectedTime == '45+',
                      onTap: () {
                        setState(() {
                          selectedTime = '45+';
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                icon_text(
                  icon1: Icons.energy_savings_leaf,coloric: Colors.amber,
                  label: "current energy level",
                ),
                SizedBox(height: 15),
                Container(
                  child: Column(
                    children: [
                      energy_lvl(
                        eng: 'Low Energy',
                        det: 'Gentle mobility & core restore',
                        ic: Icon(Icons.battery_1_bar, color: Colors.red),
                        selectt: selctenrgy == 'low',
                        ontap: () {
                          setState(() {
                            selctenrgy = 'low';
                          });
                        },
                      ),
                      SizedBox(height: 5),
                      energy_lvl(
                        eng: 'Normal',
                        det: 'Moderate cardio & dynamic flow',
                        ic: Icon(
                          Icons.battery_3_bar,
                          color: const Color.fromARGB(255, 201, 230, 17),
                        ),
                        selectt: selctenrgy == 'normal',
                        ontap: () {
                          setState(() {
                            selctenrgy = 'normal';
                          });
                        },
                      ),
                      SizedBox(height: 5),
                      energy_lvl(
                        eng: 'High Energy',
                        det: 'HIIT intervals & peak power',
                        ic: Icon(
                          Icons.battery_6_bar,
                          color: const Color.fromARGB(255, 55, 216, 10),
                        ),
                        selectt: selctenrgy == 'high',
                        ontap: () {
                          setState(() {
                            selctenrgy = 'high';
                          });
                        },
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Surprise Me 🎲'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        spacing: 15,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Today'
                            's Matches',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text('$numbermatch'),
                          Text('Zero equipment needed'),
                        ],
                      ),
                      SizedBox(height: 15),
todaymatches(title:'hii' , description: 'description', duration: '20 min', level: '3', category: 'category', calories: 'calories', firstWelcome: 'firstWelcome', secondWelcome: '125',),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xFFE3F6F3), Color(0xFFEAF2FD)],
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: const BoxDecoration(
                                color: Color(0xFFBDEBE4),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.psychology_outlined,
                                color: Color(0xFF0F8F82),
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 14),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Consistency over intensity',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF1F2937),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'A 20-minute gentle movement session preserves your streak '
                                    'and releases mood-lifting endorphins.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.35,
                                      color: Color(0xFF374151),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
