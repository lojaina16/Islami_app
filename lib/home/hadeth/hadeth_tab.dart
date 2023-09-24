import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/hadeth_details_screen.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      hadethLoadFile();
    }
    return Column(
      children: [
        Center(child: Image.asset("assets/images/ahadeth_image.png")),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        Text(
          "Ahadeth",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          thickness: 2,
        ),
        hadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Center(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, HadethDetails.routeName,
                                    arguments: hadethList[index]);
                              },
                              child: Text(hadethList[index].title)));
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Theme.of(context).primaryColor,
                        thickness: 2,
                      );
                    },
                    itemCount: hadethList.length),
              )
      ],
    );
  }

  void hadethLoadFile() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadeth = content.split("#\r\n");
    for (int i = 0; i < hadeth.length; i++) {
      List<String> lines = hadeth[i].split("\n");
      String title = lines[0]; //title of hadeth
      lines.removeAt(0); //content of hadeth
      Hadeth h = Hadeth(title: title, content: lines);
      hadethList.add(h);
      setState(() {});
    }
  }
}

//data class for hadeth
class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
