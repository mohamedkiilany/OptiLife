import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Wizard6 extends StatefulWidget {
  Wizard6({super.key});

  @override
  State<Wizard6> createState() => _Wizard6State();
}

class _Wizard6State extends State<Wizard6> {
  bool select1 = false;

  bool select2 = false;

  bool select3 = false;

  bool select4 = false;

  bool select5 = false;

  bool select6 = false;

  bool select7 = false;

  bool select8 = false;

  bool select9 = false;

  bool select10 = false;
TextEditingController  ingredientController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text("Wizard step 5 Food Budget"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
          TextButton(onPressed: () {}, child: Text("Skip")),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Step 6 OF 8'),
                      ),
                      SizedBox(width: 7),
                      Text('NUTRITION CALIBRATION'),
                      SizedBox(width: 10),
                      Text(
                        '♧ 75% ready',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 8, 192, 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Any dietary preferences or allergies?',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We tailor meals and grocery plans strictly around your lifestyle, cultural traditions, and safe health limits.',
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Select what fits you best',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 25),
                            Text('Multiple choice'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select1 = !select1;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select1
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select1
                                    ? Text(
                                        '♾️ No preference ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('♾️ No preference'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select2 = !select2;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select2
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select2
                                    ? Text(
                                        '🥩 Halal ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('🥩 Halal'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select3 = !select3;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select3
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select3
                                    ? Text(
                                        '💪 High protein ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('💪 High protein'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select4 = !select4;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select4
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select4
                                    ? Text(
                                        '🥗 Vegetarian ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('🥗 Vegetarian'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select5 = !select5;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select5
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select5
                                    ? Text(
                                        '🥦 Low carb ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('🥦 Low carb'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select6 = !select6;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select6
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select6
                                    ? Text(
                                        '🌱 Vegan ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('🌱 Vegan'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select7 = !select7;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select7
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select7
                                    ? Text(
                                        '🥛 Dairy-free ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('🥛 Dairy-free'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select8 = !select8;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select8
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select8
                                    ? Text(
                                        '🌾 Gluten-free ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('🌾 Gluten-free'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select9 = !select9;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select9
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select9
                                    ? Text(
                                        '⚠️ Nut allergy ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('⚠️ Nut allergy'),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  select10 = !select10;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: select10
                                      ? const Color.fromARGB(255, 5, 122, 9)
                                      : Color.fromARGB(255, 217, 227, 236),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: select10
                                    ? Text(
                                        '🐟 Pescatarian ✔',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text('🐟 Pescatarian'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
          
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 237, 241, 239),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 450,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Foods you dislike or avoid',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 25),
                            Text('Optional'),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ingredients you simply don'
                          't enjoy eating. We'
                          'll automatically replace them with equal macro swaps.',
                        ),SizedBox(height: 10,),Row(
            spacing: 10,
            children: [
              Expanded(
                child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: ingredientController,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.grey),
              hintText: 'e.g., Cilantro, Olives, Mushroom',
              hintMaxLines: 1,
              hintStyle: TextStyle(overflow: TextOverflow.ellipsis),
            ),
          ),
                ),
              ),
              InkWell(
                onTap: () {
          // add the ingredient here
                },
                child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 107, 95),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Icon(Icons.add, color: Colors.white, size: 18),
              Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
                ),
              ),
            ],
          ),
                      ],
                    ),
                  ),SizedBox(height: 10,),
                Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 211, 245, 245),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 14,
              children: [
                CircleAvatar(
                 radius: 20,
                 
            backgroundColor: Color.fromARGB(255, 165, 239, 232),
            
          child: Icon(
            Icons.sync,
            color: Color.fromARGB(255, 0, 105, 92),
            size: 20,
          ),
                ),
                Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Text(
                'Zero Food Waste Guarantee',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 105, 92),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Swap or modify ingredients on any planned day. Your daily calories, fiber, and target macros recalculate instantly.',
                style: TextStyle(
                  color: Color.fromARGB(255, 60, 73, 70),
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ],
          ),
                ),
              ],
            ),
          ),SizedBox(height: 10,),Container(
  width: double.infinity,
  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Row(
    spacing: 14,
    children: [
      CircleAvatar(
       
       
          backgroundColor: Color.fromARGB(255, 212, 240, 221),
         radius: 20,
        
        child: Icon(
          Icons.restaurant,
          color: Color.fromARGB(255, 27, 94, 32),
          size: 20,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Curating 340+ compliant recipes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              'Halal-certified sources • High lean-protein',
              style: TextStyle(
                color: Color.fromARGB(255, 80, 90, 88),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
), SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    const Color.fromARGB(255, 11, 185, 17),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Continue →",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
