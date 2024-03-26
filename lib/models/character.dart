import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stat {
  Character(
      {required this.name,
      required this.slogan,
      required this.id,
      required this.vocation});

  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;

  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // character to firestore(map)

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  // firestore to character

  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    // extract data from snapshot

    final data = snapshot.data()!;

    // make character instance

    Character character = Character(
        name: data['name'],
        slogan: data['slogan'],
        id: snapshot.id,
        vocation: Vocation.values
            .firstWhere((v) => v.toString() == data['vocation']));

    // update skill
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkills(skill);
    }

    // set isFav

    if (data['isFav'] == true) {
      character.toggleIsFav();
    }

    // set stats

    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}

// dummy character data

List<Character> characters = [
  Character(
    id: '1',
    name: 'Klara',
    vocation: Vocation.wizard,
    slogan: 'Kapunf!',
  ),
  Character(
    id: '2',
    name: 'Johny',
    vocation: Vocation.junkie,
    slogan: 'Light me up...',
  ),
  Character(
    id: '3',
    name: 'Crimson',
    vocation: Vocation.raider,
    slogan: 'Fire in the hole!!',
  ),
  Character(
    id: '4',
    name: 'Shaun',
    vocation: Vocation.ninja,
    slogan: 'Alright then gang.!',
  ),
];
