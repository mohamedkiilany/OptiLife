import 'dart:async';

import 'package:flutter/material.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/wizard/widgets/whatcanidowidgets.dart';

class ActiveWorkoutSession extends StatefulWidget {
  ActiveWorkoutSession({super.key});

  @override
  State<ActiveWorkoutSession> createState() => _ActiveWorkoutSessionState();
}

class _ActiveWorkoutSessionState extends State<ActiveWorkoutSession> {
  int seconds = 60;
  Timer? timer;

  void startTimer() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        t.cancel();
      }
    });
  }

  void resetTimer() {
    timer?.cancel();

    setState(() {
      seconds = 60;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: const Color(0xFFFAF8FF),
      appBar: AppBar(title: Text('ex'), centerTitle: true,actions: [IconButton(onPressed: (){}, icon: Icon( Icons.volume_up_rounded))],),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                    
                              image: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLY6Nhvk3YYZJtn7Fg98QgYTXd5ZHPhBHGLF-jH9KzxQ&s=10',
                              ),
                            ),
                          ),
                          child: 
                             Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              spacing: 150,
                              children: [
                                conicontext(colort: Color(0xFFEAEDFF),iconcolor: const Color.fromARGB(255, 36, 183, 13),
                                  ic: Icons.circle,
                                  text: 'TEMPO • 3s HOLD',
                                ),
                    
                                CircleAvatar(
                                  radius: 20,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.info),
                                  ),
                                ),
                              ],
                            ),
                          
                        ),
                        Container(
                          child: Column(
                            children: [SizedBox(height: 10,),
                              Row(
                                spacing: 20,
                                children: [
                                  Text(
                                    'Glute Bridge Holds',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                    ),
                                  ),
                                  conicontext(colort: Color(0xFFEAEDFF),iconcolor: AppColors.darkGreen,
                                    ic: Icons.accessibility,
                                    text: 'Glutes • Core',
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Squeeze glutes actively at top lock. Maintainneutral ribs and pelvis without hyperextending the lumbar spine.',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Simple Timer
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('SET TRACKER'), Text('TARGET WORK')]),
                      ),

                      Text(
                        '00:${seconds.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),

                      ElevatedButton(
                        onPressed: startTimer,
                        child: Text('Start'),
                      ),

                      ElevatedButton(
                        onPressed: resetTimer,
                        child: Text('Reset'),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: conicontext(colort: Color(0xFFEAEDFF),iconcolor: AppColors.darkGreen,
                                ic: Icons.timer_3_rounded,
                                text: '+15s Rest ',
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: conicontext(colort:Color(0xFFEAEDFF) ,iconcolor: AppColors.darkGreen,
                                ic: Icons.skip_next_rounded,
                                text: 'Skip to Rest',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.skip_previous_rounded,color: Colors.black,),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(backgroundColor: const Color.fromARGB(255, 32, 198, 38),radius: 40, child: Icon(Icons.pause,color: Colors.white,)),
                    ),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.skip_next_rounded,color: Colors.black,),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.switch_account_rounded),
                    Text('Difficulty or Knee Discomfort?'),
                    TextButton(onPressed: () {}, child: Text('Swap Exercise')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
