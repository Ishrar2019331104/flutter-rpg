import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/screens/profile/heart.dart';
import 'package:flutter_rpg/screens/profile/skill_list.dart';
import 'package:flutter_rpg/screens/profile/stats_table.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(text: character.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // basic info - image, vocation, description

              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    color: AppColors.secondaryColor.withOpacity(0.3),
                    child: Row(
                      children: [
                        Hero(
                          tag: character.id,
                          child: Image.asset(
                            'assets/img/vocations/${character.vocation.image}',
                            width: 140,
                            height: 140,
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StyledHeading(text: character.vocation.title),
                              StyledText(text: character.vocation.description),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 10.0,
                      right: 10.0,
                      child: Heart(character: character)),
                ],
              ),

              // weapon and ability and slogan

              const SizedBox(height: 20.0),
              Icon(
                Icons.code,
                color: AppColors.primaryColor,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  color: AppColors.secondaryColor.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StyledHeading(
                        text: 'Slogan',
                      ),
                      StyledText(text: character.slogan),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const StyledHeading(
                        text: 'Weapon of Choice',
                      ),
                      StyledText(text: character.vocation.weapon),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const StyledHeading(
                        text: 'Unique Ability',
                      ),
                      StyledText(text: character.vocation.ability),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),

              // stats and skills

              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    StatsTable(character),
                    SkillList(character),
                  ],
                ),
              ),

              // save button

              StyledButton(
                onPressed: () {
                  Provider.of<CharacterStore>(context, listen: false)
                      .saveCharacter(character);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const StyledHeading(
                      text: 'Character was saved.',
                    ),
                    showCloseIcon: true,
                    duration: const Duration(seconds: 2),
                    backgroundColor: AppColors.secondaryColor,
                  ));
                },
                child: const StyledHeading(text: 'Save Character'),
              ),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
