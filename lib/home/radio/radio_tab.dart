import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/radio/iconBtn.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(child: Image.asset("assets/images/radio_image.png")),
        Text(AppLocalizations.of(context)!.quran_audio,
            style: Theme.of(context).textTheme.titleMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconBtn(icon: Icons.skip_previous_sharp),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconBtn(icon: Icons.play_arrow),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: IconBtn(icon: Icons.skip_next_sharp),
            )
          ],
        )
      ],
    );
  }
}
