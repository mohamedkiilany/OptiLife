import 'package:flutter/material.dart';
import 'package:flutter_application_1/project/Wizard6.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class Wizard5 extends StatefulWidget {
  Wizard5({super.key});

  @override
  State<Wizard5> createState() => _Wizard5State();
}

class _Wizard5State extends State<Wizard5> {
  @override
  bool selected = false;
  bool selected2 = false;
  bool selected3 = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5FF),
      appBar: AppBar(
        title: Text("Wizard step 5 Food Budget"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
          TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Wizard6();
                },));}, child: Text("Skip")),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'What'
                's your grocery budget?',
                style: TextStyle(color: Color(0xFF0F172A)),
              ),
              Text(
                "We recommend ingredients you can actually afford withou breaking the bank.",
                style: TextStyle(color: Color(0xFF475569)),
              ),

              // ---------------- CARD 1 ----------------
              InkWell(
                onTap: () {
                  setState(() {
                    selected = !selected;
                    selected2 = false;
                    selected3 = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: selected ? Color(0xFF22C55E) : Colors.transparent,
                      width: 2.5,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Icon(
                            LucideIcons.circleDollarSign,
                            color: Color(0xFF15803D),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Budget-Conscious",
                                  style: TextStyle(color: Color(0xFF0F172A)),
                                ),
                                Text(
                                  "Maximum Value Per Dollar",
                                  style: TextStyle(color: Color(0xFF15803D)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          selected
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFF22C55E),
                                  child: Icon(
                                    LucideIcons.check,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFE0E4FF),
                                ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            r'$30 – $50',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            '/ week',
                            style: TextStyle(color: Color(0xFF334155)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE3C2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r'~$2.00–$3.50 / meal',
                              style: TextStyle(color: Color(0xFF92400E)),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Focuses on bulk staples, canned beans, seasonal vegetables, eggs, and smart protein swaps.',
                        style: TextStyle(color: Color(0xFF334155)),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r' Saves ~$210/mo',
                              style: TextStyle(color: Color(0xFF0F172A)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r' Bulk-Friendly',
                              style: TextStyle(color: Color(0xFF0F172A)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ---------------- CARD 2 ----------------
              InkWell(
                onTap: () {
                  setState(() {
                    selected2 = !selected2;
                    selected = false;
                    selected3 = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: selected2 ? Color(0xFF22C55E) : Colors.transparent,
                      width: 2.5,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Icon(LucideIcons.wallet, color: Color(0xFF0F766E)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Moderate & Flexible",
                                  style: TextStyle(color: Color(0xFF0F172A)),
                                ),
                                Text(
                                  "Most Popular Choice",
                                  style: TextStyle(color: Color(0xFF475569)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          selected2
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFF22C55E),
                                  child: Icon(
                                    LucideIcons.check,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFE0E4FF),
                                ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            r'$50 – $80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            '/ week',
                            style: TextStyle(color: Color(0xFF334155)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r'~$4.00–$6.50 / meal',
                              style: TextStyle(color: Color(0xFF3B3F5C)),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Balanced whole foods, poultry, fresh produce, and occasional specialty pantry items.',
                        style: TextStyle(color: Color(0xFF334155)),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r' High Variety',
                              style: TextStyle(color: Color(0xFF0F172A)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r' Fresh Greens',
                              style: TextStyle(color: Color(0xFF0F172A)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ---------------- CARD 3 ----------------
              InkWell(
                onTap: () {
                  setState(() {
                    selected3 = !selected3;
                    selected = false;
                    selected2 = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: selected3 ? Color(0xFF22C55E) : Colors.transparent,
                      width: 2.5,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Icon(
                            LucideIcons.shoppingBag,
                            color: Color(0xFFA16207),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Premium / Organic",
                                  style: TextStyle(color: Color(0xFF0F172A)),
                                ),
                                Text(
                                  "Cleanest Whole Sourcing",
                                  style: TextStyle(color: Color(0xFF475569)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          selected3
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFF22C55E),
                                  child: Icon(
                                    LucideIcons.check,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFE0E4FF),
                                ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            r'$80+',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            '/ week',
                            style: TextStyle(color: Color(0xFF334155)),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r'$7.00+ / meal',
                              style: TextStyle(color: Color(0xFF3B3F5C)),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Wild-caught fish, organic meats, specialty superfoods, and premium health items.',
                        style: TextStyle(color: Color(0xFF334155)),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r' 100% Organic Priority',
                              style: TextStyle(color: Color(0xFF0F172A)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8EAFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 5,
                            width: 20,
                            child: Text(
                              r' Wild-Caught Sourced',
                              style: TextStyle(color: Color(0xFF0F172A)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFEEF0FF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE3C2),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        LucideIcons.arrowLeftRight,
                        color: Color(0xFF92400E),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Row(
                            spacing: 8,
                            children: [
                              Flexible(
                                child: Text(
                                  "Smart Ingredient Swaps",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF854D0E),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xFFE0E4FF),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  "ACTIVE",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Our engine automatically suggests nutrient-dense, high-protein alternatives whenever a recipe ingredient exceeds your target meal budget.",
                            style: TextStyle(
                              height: 1.5,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    const Color.fromARGB(255, 11, 185, 17),
                  ),
                ),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Wizard6();
                },));},
                child: Text(
                  "Continue →",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
