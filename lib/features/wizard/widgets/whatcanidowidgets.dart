import 'package:flutter/material.dart';

class Time_exrcersie extends StatelessWidget {
  final String num;
  final bool isSelected;
  final VoidCallback onTap;

  const Time_exrcersie({
    super.key,
    required this.num,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? Color.fromARGB(255, 120, 236, 78)
              : const Color.fromARGB(240, 240, 252, 255),
        ),
        width: 80,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSelected)
              Icon(Icons.check, color: const Color.fromARGB(255, 0, 0, 0)),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  num,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                const Text(
                  'min',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class energy_lvl extends StatelessWidget {
  final String eng;
  final String det;
  final Icon ic;
  final VoidCallback ontap;
  final bool selectt;

  energy_lvl({
    super.key,
    required this.eng,
    required this.det,
    required this.ic,
    required this.ontap,
    required this.selectt,
  });

  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 254, 254),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ic,
            SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(eng), Text(det)],
              ),
            ),

            CircleAvatar(
              backgroundColor: selectt
                  ? const Color.fromARGB(255, 7, 7, 7)
                  : Colors.white,
              radius: 20,
              child: selectt
                  ? Icon(
                      Icons.check,
                      color: const Color.fromARGB(255, 244, 241, 241),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class icon_text extends StatelessWidget {
  final IconData icon1;
  final String label;
  final Color? coloric;
  final Color? colortext;
  final double? sizeeee;
  final double? width;
  icon_text({
    super.key,
    required this.icon1,
    required this.label,
    this.coloric,
    this.colortext,
    this.sizeeee,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon1, color: coloric),
        SizedBox(width: width ?? 5),
        Text(
          "$label",
          style: TextStyle(color: colortext, fontSize: sizeeee),
        ),
      ],
    );
  }
}

class todaymatches extends StatelessWidget {
  final String? imageUrl;

  final String title;
  final String description;
  final String duration;
  final String level;
  final String category;
  final String calories;
  final String firstWelcome;
  final String secondWelcome;

  const todaymatches({
    super.key,
    this.imageUrl,
    required this.title,
    required this.description,
    required this.duration,
    required this.level,
    required this.category,
    required this.calories,
    required this.firstWelcome,
    required this.secondWelcome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(240, 240, 252, 255),
      child: Column(
        children: [
          Container(
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: imageUrl != null && imageUrl!.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        firstWelcome,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 11, 11, 11),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 200),
                  icon_text(
                    icon1: Icons.energy_savings_leaf_outlined,
                    label: secondWelcome,
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),

                Text(title),

                Text(description),

                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 5,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(254, 242, 225, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: icon_text(
                            icon1: Icons.timer_3_outlined,
                            label: duration,
                          ),
                        ),
                      ),

                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(240, 241, 244, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: icon_text(icon1: Icons.home, label: level),
                        ),
                      ),

                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(224, 237, 253, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: icon_text(
                            icon1: Icons.run_circle,
                            label: category,
                          ),
                        ),
                      ),

                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(220, 244, 240, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: icon_text(
                            icon1: Icons.energy_savings_leaf_outlined,
                            label: calories,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Preview workout'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
