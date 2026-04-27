import 'package:app_pertama/models/profile.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.profile});

  final Profile profile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController bioController;
  late TextEditingController descController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profile.name);
    bioController = TextEditingController(text: widget.profile.bio);
    descController = TextEditingController(text: widget.profile.description);
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    descController.dispose();
    super.dispose();
  }

  void saveData() {
    if (_formKey.currentState!.validate()) {
      final updatedProfile = Profile(
        id25: widget.profile.id25,
        name: nameController.text,
        bio: bioController.text,
        description: descController.text,
      );

      Navigator.pop(context, updatedProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nama'),
                validator: (v) => v!.isEmpty ? 'Tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: bioController,
                decoration: const InputDecoration(labelText: 'Bio'),
                validator: (v) => v!.isEmpty ? 'Tidak boleh kosong' : null,
              ),
              TextFormField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveData,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}