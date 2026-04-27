import 'package:app_pertama/models/profile.dart';
import 'package:app_pertama/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      int lastIndex = profiles.length;
      profiles.add(
        Profile(
          id25: lastIndex + 1,
          name: "ell ${lastIndex + 1}",
          bio: "Flutter Developer",
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", // WAJIB ADA
        ),
      );
    });
  }

  void deleteitem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Profile')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];

          return Dismissible(
            key: Key(profile.id25.toString()),
            onDismissed: (direction) {
              final deletedItem = profiles[index];
              deleteitem(index);
              Fluttertoast.showToast(
                msg: "Profile ${deletedItem.name} dihapus",
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=${profile.id25}', // FOTO BEDA
                ),
              ),
              title: Text(profile.name),
              subtitle: Text(profile.bio),

              // 🔥 FIX: TERIMA DATA BALIK DARI DETAIL
              onTap: () async {
                final updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailProfile(profile: profile),
                  ),
                );

                if (updatedProfile != null) {
                  setState(() {
                    profiles[index] = updatedProfile;
                  });
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}