import 'package:apifinalfantasy/services/remote_skills.dart';
import 'package:apifinalfantasy/views/containerlist.dart';
import 'package:apifinalfantasy/views/skillpage.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../models/skill_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //drawer: Drawer(),
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20.0, bottom: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerList(
                        textA:
                            Image.asset("assets/images/minion_roulette.png")),
                    const SizedBox(width: 12),
                    ContainerList(
                        textA: Image.asset("assets/images/mount_roulette.png")),
                    const SizedBox(width: 12),
                    ContainerList(textA: const Icon(Icons.medical_information)),
                    const SizedBox(width: 12),
                    ContainerList(textA: const Icon(Icons.g_translate_rounded)),
                  ],
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: skillApi!.length, //TODO
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SkillPage(index: index)));
                        },
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black54,
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(29),
                                  child: ImageNetwork(
                                    image: skillApi![index].icon,
                                    height: 50,
                                    width: 50,
                                    fitAndroidIos: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      skillApi![index].name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 20,
                                  width: 40,
                                  child: Center(
                                    child: Text(
                                      "No. ${index + 1}",
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
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
