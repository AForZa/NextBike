import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Auth/controller/auth_controller.dart';
import 'package:intl/intl.dart';

//DIESE PAGE DIENT ZUR VERANSCHAULICHUNG DER ACCOUNT DATEN
//ZUM BEISPIEL DIE EMAIL SOWIE DAS DATUM ALS AUCH DIE NUTZER ID
//NUTZER ID, EMAIL WERDEN IN FIRESTORE GESPEICHERT

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthController = ref.read(authProvider.notifier);
    final AuthUser = ref.watch(authProvider).user;
    final WohnortController = TextEditingController();
    final CollectionReference ortWohnort =
        FirebaseFirestore.instance.collection("wohnort");
    var dt = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Abmelden"),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                  hintText: "Next Alpha 0.15.12",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          TextField(
            textAlign: TextAlign.center,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(),
              ),
              hintText: "E-Mail:  ${AuthUser.email}",
            ),
            style: TextStyle(
                color: Colors.white, fontFamily: 'Outfit', fontSize: 20),
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                  hintText:
                      "E-Mail Verifiziert? : ${AuthUser.emailVerified}", //EMAIL WIRD ANGEZEIGT
                ),
                style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          TextField(
            textAlign: TextAlign.center,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.horizontal(),
              ),
              hintText: "Nutzer ID: ${AuthUser.id}",
            ),
            style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(),
                    ),
                    hintText: " Datum: " +
                        DateFormat.yMd().format(
                            dt)), //DATUM WURDE MIT INTL PACKAGE FORMATIERT
                style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                enabled: false,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.horizontal(),
                  ),
                  hintText: "von Aimen und Duy",
                ),
                style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              Padding(padding: const EdgeInsets.only(top: 10)),
              ElevatedButton(
                child: const Text("Abmelden"),
                onPressed: () {
                  AuthController.onSignOut();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10.0)),
              ElevatedButton(
                //DER FIRESTORE BEREICH, HIER WERDEN DIE NUTZER ID UND MAILS ÜBERGEBEN UND GESPEICHERT
                child: const Text("Ich bin kein Roboter"),
                onPressed: () async {
                  CollectionReference user =
                      FirebaseFirestore.instance.collection("Roboter");
                  user
                      .doc("${AuthUser.id}")
                      .set({'Roboter?': 'Nein', 'E-Mail': '${AuthUser.email}'});
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}







/*
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [




              Text(
                "user id: ${AuthUser.id}",
                style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              // BEI USER ID UND VERIFIED EMAIL MACHEN
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "user email ${AuthUser.email}",
                ),
                style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "email verified ${AuthUser.emailVerified}",
                style: TextStyle(fontFamily: 'Outfit', fontSize: 20),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: const Text("Abmelden"),
                onPressed: () {
                  AuthController.onSignOut();
                },
              ),
              ElevatedButton(
                  child: const Text("Ich bin kein Roboter"),
                  onPressed: () async {
                    CollectionReference user =
                        FirebaseFirestore.instance.collection("Roboter");
                    user.doc("${AuthUser.id}").set(
                        {'Roboter?': 'Nein', 'E-Mail': '${AuthUser.email}'});
                  }),
                  */

