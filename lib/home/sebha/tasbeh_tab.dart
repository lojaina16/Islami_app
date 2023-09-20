import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  String txt = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Image.asset("assets/images/Group 21.png")),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(150, 183, 147, 95),
                  borderRadius: BorderRadius.circular(20)),
              child: Text("$counter",
                  style: Theme.of(context).textTheme.titleSmall)),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                counter++;
                if (counter == 34) {
                  if (txt == "سبحان الله") {
                    txt = "الحمد لله";
                    counter = 0;
                  } else if (txt == "الحمد لله") {
                    counter = 0;
                    txt = "الله اكبر";
                  } else if (txt == "الله اكبر") {
                    counter = 0;
                    txt = "سبحان الله";
                  }
                  counter = 0;
                }
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(txt,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              )),
        )
      ],
    );
  }
}
