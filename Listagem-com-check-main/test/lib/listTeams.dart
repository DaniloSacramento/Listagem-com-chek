// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'listOfTeams.dart';

class ListTeams extends StatefulWidget {
  @override
  State<ListTeams> createState() => _ListTeamsState();
}

class _ListTeamsState extends State<ListTeams> {
  List<Map> staticData = Teams.teams;
  Map<int, bool> selectedFlag = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: ListView.builder(
          itemCount: staticData.length,
          itemBuilder: ((context, index) {
            Map data = staticData[index];
            // For the first time selectedFlag[index] will be null
            // so, for that time we will initialize with false
            selectedFlag[index] = selectedFlag[index] ?? false;
            bool isSelected = selectedFlag[index]!;
            return Column(key: Key('$index'), children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListTile(
                    minVerticalPadding: 15,
                    onTap: () => onTap(isSelected, index),
                    title: Text("${data['name']}"),
                    leading: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        height: 30,
                        color: Colors.blue,
                        width: 30,
                      )
                    ]),
                    subtitle: Text("${data['subtitle']}"),
                    trailing: _buildSelectIcon(isSelected, data)),
              ),
              Container(height: 10.0, color: Colors.grey[200]),
            ]);
          }),
        ),
      ),
    );
  }

  Widget _buildSelectIcon(bool isSelected, Map data) {
    return Checkbox(
        fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          return states.contains(MaterialState.selected) ? Colors.green : Colors.transparent;
        }),
        shape: CircleBorder(),
        value: isSelected,
        onChanged: (bool? value) {
          setState(() {
            isSelected = !isSelected;
          });
        });
  }

  void onTap(bool isSelected, int index) {
    setState(() {
      selectedFlag[index] = !isSelected;
    });
  }
}

class Teams {
  static List<Map> teams = [
    {
      "name": "Arsenal",
      "subtitle": "England",
    },
    {
      "name": "Bayern Munchen",
      "subtitle": "Germany",
    },
    {
      "name": "Barcelona",
      "subtitle": "Spain",
    },
    {
      "name": "Chelsea",
      "subtitle": "Spain",
    },
    {
      "name": "Arsenal",
      "subtitle": "England",
    },
    {
      "name": "Bayern Munchen",
      "subtitle": "Germany",
    },
    {
      "name": "Barcelona",
      "subtitle": "Spain",
    },
    {
      "name": "Chelsea",
      "subtitle": "Spain",
    },
    {
      "name": "Arsenal",
      "subtitle": "England",
    },
    {
      "name": "Bayern Munchen",
      "subtitle": "Germany",
    },
    {
      "name": "Barcelona",
      "subtitle": "Spain",
    },
    {
      "name": "Chelsea",
      "subtitle": "Spain",
    },
  ];
}
