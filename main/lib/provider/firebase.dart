import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reccomandations_app/main.dart';

class Project {
  List tags;
  String description;
  String name;
  String difficulty;
  Map<String, String> comments;

  Project.fromMap(Map args) {
    tags = args["tags"];
    description = args["description"];
    name = args["name"];
    difficulty = args["difficulty"];
  }
}

class FirebaseProjects with ChangeNotifier {
  List<String> tags = [];

  List<Project> projects = [];

  FirebaseProjects(){
    getPosts();
  }

  void getPosts() async {
    final List<DocumentSnapshot> posts =
        (await databaseReference.collection("projects").getDocuments())
            .documents;

    projects = posts.map<Project>((e) => Project.fromMap(e.data)).toList();

    projects.forEach((element) => print(element.name));
    notifyListeners();
  }

  void postProject(String name, String description,
      String difficulty, List<String> tags) async {
    await databaseReference
        .collection("projects")
        .document()
        .setData({
      "name": name,
      "description": description,
      "difficulty": difficulty,
      "tags": tags
    });
  }
}