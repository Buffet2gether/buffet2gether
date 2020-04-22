//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileInfo {
  String profilePicture;
  String id;
  String bio;
  String name;
  String password;
  String gender;
  DateTime dateofBirth;
  List<bool> interestingBool;
  List<String> interestingText;
  List<IconData> interestingIconUrl;
  List<String> history;

  ProfileInfo(
      {this.profilePicture,
        this.id,
        this.name,
        this.bio,
        this.password,
        this.gender,
        this.dateofBirth,
        this.interestingBool,
        this.interestingText,
        this.interestingIconUrl,
        this.history});
}

final myProfile = new ProfileInfo(
    profilePicture: 'assets/images/profile.jpg',
    name: 'Tanapon',
    bio:
    'I love meat and steak! seafood too! The dessert is also a must have, especially the ice-cream',
    password: '123456',
    gender: 'Male',
    dateofBirth: DateTime.utc(1999, 6, 27),
    interestingBool: [
      true, // 0 fasion
      true, // 1 sport
      true, // 2 technology
      true, // 3 politic
      true, // 4 entertainment
      true, // 5 book
      true, // 6 pet
    ],
    interestingText: [
      'Fashion',
      'Sports',
      'Technology',
      'Politics',
      'Entertainment',
      'Books',
      'Pet',
    ],
    interestingIconUrl: [
      FontAwesomeIcons.hatCowboySide,
      FontAwesomeIcons.footballBall,
      FontAwesomeIcons.laptop,
      FontAwesomeIcons.balanceScale,
      FontAwesomeIcons.dice,
      FontAwesomeIcons.book,
      FontAwesomeIcons.cat,
    ],
    history: [
      'Ayutthaya',
      'Lopburi',
      'Bangkok',
    ]);