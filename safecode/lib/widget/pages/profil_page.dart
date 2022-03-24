import 'package:flutter/material.dart';
import 'package:safecode/dataObject/password.dart';

import 'package:safecode/updatable_interface/updatable.dart';

class ProfilPage extends StatelessWidget implements Updatable {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: ListView(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      // Change the circle color to a gradient maybe ?
                      color: Colors.white,
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 30,
                        color: Colors.black.withOpacity(0.3),
                      )
                    ],
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.virlan.co/trends/wp-content/uploads/2021/08/anime-pfp-aesthetic.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Pseudo",
              hintText: "Yuto",
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "yuto@safecode.com",
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "1234",
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Gotta change that probably
              OutlinedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    //colors : Colors.black
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Enregistrer',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void update(Password password) {}
}
