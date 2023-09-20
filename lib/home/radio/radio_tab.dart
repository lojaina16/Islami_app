import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(child: Image.asset("assets/images/radio_image.png")),
        Text("اذاعة القرأن الكريم",
            style: Theme.of(context).textTheme.titleMedium),
        Center(child: Image.asset("assets/images/Group 5.png")),
      ],
    );
  }
}
