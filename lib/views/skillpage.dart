import 'package:apifinalfantasy/services/remote_skills.dart';
import 'package:apifinalfantasy/views/stars.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../models/skill_api.dart';

class SkillPage extends StatefulWidget {
  const SkillPage({super.key, required this.index});
  final index;

  @override
  State<SkillPage> createState() => _SkillPageState();
}

class _SkillPageState extends State<SkillPage> {
  List<SkillApi>? skillApi;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    skillApi = await RemoteSkills().getPosts();
    if (skillApi != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  String extractName(String text) {
    List words = text.split(".");
    String result = words.last.substring(0, 1).toUpperCase() +
        words.last.substring(1).toLowerCase();
    return result;
  }

  Widget rankStar() {
    int rank = skillApi![widget.index].rank.toInt();
    if (rank == 1) {
      return starRow;
    } else if (rank == 2) {
      return starRow2;
    } else if (rank == 3) {
      return starRow3;
    } else if (rank == 4) {
      return starRow4;
    } else {
      return starRow5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.7),
                  spreadRadius: 3,
                  blurRadius: 9,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            width: 500,
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 40),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black87.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 3)),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(29),
                            child: ImageNetwork(
                              image: skillApi![widget.index].icon,
                              height: 50,
                              width: 50,
                              fitAndroidIos: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          skillApi![widget.index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17, //17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 20,
                          width: 40,
                          child: Center(
                            child: Text(
                              "No. ${widget.index + 1}",
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Expanded(
                      child: Text(
                        "Type",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Aspect",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Owned",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Rank",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const SizedBox(width: 40),
                    Expanded(
                      child: Text(
                        extractName(
                            skillApi![widget.index].type.name.toString()),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        extractName(
                            skillApi![widget.index].aspect.name.toString()),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        skillApi![widget.index].owned,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: rankStar(),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    SizedBox(width: 45),
                    Text(
                      "Tooltip",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 45, top: 3),
                        child: Text(
                          skillApi![widget.index].tooltip,
                          style: const TextStyle(
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    SizedBox(width: 45),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 45, right: 45, top: 3),
                        child: Text(
                          skillApi![widget.index].description,
                          style: const TextStyle(
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    SizedBox(width: 45),
                    Text(
                      "How to Learn",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 45, right: 45, top: 3, bottom: 40),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: skillApi![widget.index].sources.length,
                          itemBuilder: (context, index) {
                            return Text(
                              skillApi![widget.index].sources[index].text,
                              style: const TextStyle(
                                color: Colors.white,
                                height: 1.3,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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
