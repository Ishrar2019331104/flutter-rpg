import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            children: [
              Image.asset(
                'assets/img/vocations/${character.vocation.image}',
                width: 80.0,
              ),
              const SizedBox(width: 20.0),
              Column(
                children: [
                  StyledHeading(text: character.name),
                  StyledText(
                    text: character.vocation.title,
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward),
                color: AppColors.textColor,
              ),
            ],
          )),
    );
  }
}
