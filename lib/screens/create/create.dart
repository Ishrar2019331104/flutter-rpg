import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handlign vocation selection

  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      // show error dialog

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const StyledHeading(text: 'Missing character name'),
              content: const StyledText(
                  text: 'Please enter a name for your character.'),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const StyledHeading(text: 'close'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      // show error dialog

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const StyledHeading(text: 'Missing character slogan'),
              content: const StyledText(
                  text: 'Please enter a slogan for your character.'),
              actions: [
                StyledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const StyledHeading(text: 'close'))
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      return;
    }

    Provider.of<CharacterStore>(context, listen: false).addCharacter(Character(
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: selectedVocation,
      id: uuid.v4(),
    ));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle(text: 'Character Creation'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading(text: 'Welcome, new player.'),
              ),
              const Center(
                child: StyledText(
                    text: 'Create a name & slogan for your character.'),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: StyledText(
                    text: 'Character name',
                  ),
                  prefixIcon: Icon(Icons.person_2),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                decoration: const InputDecoration(
                  label: StyledText(
                    text: 'Character slogan',
                  ),
                  prefixIcon: Icon(Icons.chat),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                cursorColor: AppColors.textColor,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading(text: 'Choose a vocation.'),
              ),
              const Center(
                child:
                    StyledText(text: 'This determines your available skills.'),
              ),
              VocationCard(
                  selected: selectedVocation == Vocation.junkie,
                  onTap: updateVocation,
                  vocation: Vocation.junkie),
              VocationCard(
                  selected: selectedVocation == Vocation.ninja,
                  onTap: updateVocation,
                  vocation: Vocation.ninja),
              VocationCard(
                  selected: selectedVocation == Vocation.raider,
                  onTap: updateVocation,
                  vocation: Vocation.raider),
              VocationCard(
                  selected: selectedVocation == Vocation.wizard,
                  onTap: updateVocation,
                  vocation: Vocation.wizard),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(
                child: StyledHeading(text: 'Good Luck.'),
              ),
              const Center(
                child: StyledText(text: 'And enjoy the journey...'),
              ),
              Center(
                  child: StyledButton(
                onPressed: () {
                  handleSubmit();
                },
                child: const StyledHeading(text: 'Create character'),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
