import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:task_3/Models/User/user.dart';
import 'package:http/http.dart' as http;
import 'package:task_3/Screens/profile_screen.dart';
import 'package:task_3/Widget/profile_card.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({super.key});

  static Future<List<UserProfile>?> getallUsers() async {
    List<UserProfile>? users = [];
    final url = Uri.https('randomuser.me', '/api/', {'results': '100'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedObject = jsonDecode(response.body);
      var results = decodedObject['results'] as List<dynamic>;
      users = results.map((value) {
        return UserProfile.fromJson(value);
      }).toList();
      return users;
    } else {
      users = null;
      return users;
    }
  }

  ontap(UserProfile profile, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProfileScreen(userProfile: profile);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          backgroundColor: Colors.blue[400],
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getallUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No users found'));
            } else {
              List<UserProfile> users = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemBuilder: (context, index) => ProfileCard(
                    imagePath:
                        users[index].picture?.medium ?? 'The value is Null',
                    // ignore: prefer_interpolation_to_compose_strings
                    name: (users[index].name?.title ?? 'The value is null') +
                        " " +
                        (users[index].name?.first ?? 'The value is null') +
                        " " +
                        (users[index].name?.last ?? 'The value is null'),
                    email: users[index].email ?? "The Value is null",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfileScreen(userProfile: users[index]);
                      }));
                    },
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: users.length,
                ),
              );
            }
          },
        ));
  }
}
