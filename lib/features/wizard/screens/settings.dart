import 'package:flutter/material.dart';
import 'package:optilife_app/features/wizard/widgets/settings_widgets.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int option = 1;
  int option1 = 1;
  bool isEnabled = false;
    bool isEnabled1 = false;
  bool isEnabled2 = false;
  bool isEnabled3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'),actions: [IconButton(onPressed: (){}, icon: Icon(Icons.more))],),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(radius: 30, child: Icon(Icons.person)),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            'Mohamed Al-Sayed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text('Consistent Achiever • Level 8'),
                        ],
                      ),
                      SizedBox(width: 55),
                      Container(child: Text('data')),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ACCOUNT & SECURITY'),
                    Icon(Icons.security_rounded),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SettingsWidgets(
                      icon: Icons.email_rounded,
                      title: 'Email Address',
                      ontap: () {},
                      trailing: 'Edit',
                      subtitle: 'mohamed@example.com',
                    ),
                    SettingsWidgets(
                      icon: Icons.key,
                      title: 'Change Password',
                      ontap: () {},
                      trailing: 'Edit',
                      subtitle: 'Last changed 3 months ago',
                    ),
                    SettingsWidgets(
                      icon: Icons.verified,
                      title: 'Two-Factor Authentication',
                      ontap: () {},
                      trailing: 'Active',
                      subtitle: 'Enabled (SMS verified)',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('APP PREFERENCES'),
                    Icon(Icons.room_preferences),
                  ],
                ),
              ),
              Container(
                width: 400,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '     Units of Measure',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Center(
                              child: toggle(
                                option: 'Metric (kg/cm)',
                                ontap: () {
                                  setState(() {
                                    option = 1;
                                  });
                                },
                                ontap1: () {
                                  setState(() {
                                    option = 2;
                                  });
                                },
                                option1: 'Imperial (lb/ft)',
                                yee: option,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '    Theme',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            toggle(
                              option: 'Light',
                              ontap: () {
                                setState(() {
                                  option1 = 1;
                                });
                              },
                              ontap1: () {
                                setState(() {
                                  option1 = 2;
                                });
                              },
                              option1: 'Dark',
                              yee: option1,
                              option2: 'Auto',
                              ontap2: () {
                                setState(() {
                                  option1 = 3;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        settingssss(
                          ontap: () {},
                          title: 'Language',
                          trailing: 'English (US)',
                          icon: Icons.language_rounded,
                        ),
                        settingssss(
                          ontap: () {},
                          title: 'Start of Week',
                          trailing: 'Monday',
                          icon: Icons.calendar_month_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SMART NOTIFICATIONS & REMINDERS'),
                    Icon(Icons.notifications),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: [
                    switchh(
                      title: 'Morning Workout Prompt',
                      sub: 'Gentle alarm',
                      value: isEnabled,
                      onChanged: (value) {
                        setState(() {
                          isEnabled = value;
                        });
                      },
                    ),switchh(
                      title: 'Meal Prep Reminder',
                      sub: 'Ahead of dinner',
                      value: isEnabled1,
                      onChanged: (value) {
                        setState(() {
                          isEnabled = value;
                        });
                      },
                    ),switchh(
                      title: 'Gentle Hydration Nudges',
                      sub: 'Active 9am–8pm',
                      value: isEnabled2,
                      onChanged: (value) {
                        setState(() {
                          isEnabled = value;
                        });
                      },
                    ),switchh(
                      title: 'Streak Protection Warning',
                      sub: 'Affirmative check-in before sleep',
                      value: isEnabled,
                      onChanged: (value) {
                        setState(() {
                          isEnabled3 = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFDECEC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFF8D7D7)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Color(0xFFFBD5D5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.delete_outline, size: 20, color: Color(0xFFC81E1E)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delete Account & Stored Data',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC81E1E),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Irreversible habit history wipe',
                  style: TextStyle(fontSize: 13, color: Color(0xFFC81E1E)),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC81E1E),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
            child: Text('Delete', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    ),
    SizedBox(height: 24),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.eco_outlined, size: 14, color: Color(0xFF1C7A3E)),
        SizedBox(width: 4),
        Text(
          'SUSTAINABLE PROGRESS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C7A3E),
            letterSpacing: 0.3,
          ),
        ),
      ],
    ),
    SizedBox(height: 8),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'OptiLife Build 2.4.12 • Built for sustainable real-world habits',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, color: Color(0xFF5D6475)),
      ),
    ),],
          ),
        ),
      ),
    );
  }
}
