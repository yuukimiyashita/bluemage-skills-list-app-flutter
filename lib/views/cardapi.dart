import 'package:apifinalfantasy/models/cards_api.dart';
import 'package:apifinalfantasy/services/remote_cards.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<Cards>? cardsApi;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cardsApi = await RemoteCards().getCards();
    if (cardsApi != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              itemCount: cardsApi!.length,
              itemBuilder: (context, index) {
                return Text(cardsApi![index].name);
              }),
        ],
      ),
    );
  }
}
