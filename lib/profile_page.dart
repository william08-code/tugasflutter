import 'package:app_pertama/models/profile.dart';
import 'package:flutter/material.dart';
import 'package:app_pertama/edit_profile.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key, required this.profile});
  final Profile profile;

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  late Profile profile;

  @override
  void initState() {
    super.initState();
    profile = widget.profile;
  }

  void goToEdit() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfile(profile: profile),
      ),
    );

    if (result != null) {
      setState(() {
        profile = result;
      });
    }
  }

  void goBack() {
    Navigator.pop(context, profile); // KIRIM BALIK DATA
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: Colors.blue[100],
              padding: const EdgeInsets.only(top: 50, left: 10, bottom: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: goBack,
                  ),
                  const Text(
                    'Detail Profile',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),

            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/download.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 120,
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/en/f/f2/Astro_Boy_anime_version.png',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    profile.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    profile.bio,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    profile.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(height: 1.5),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: goToEdit,
                    child: const Text('Edit Profile'),
                  ),

                  ElevatedButton(
                    onPressed: goBack,
                    child: const Text('Back'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}