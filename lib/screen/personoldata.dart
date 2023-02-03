import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firestore1/screen/personoldata.dart';

class PersonaldataScreen extends StatefulWidget {
  const PersonaldataScreen({Key? key}) : super(key: key);

  @override
  State<PersonaldataScreen> createState() => _HomePageState();
}

class _HomePageState extends State<PersonaldataScreen> {
  // text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  final CollectionReference _personal =
      FirebaseFirestore.instance.collection('personal');

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _nameController.text = documentSnapshot['name'];
      _ageController.text = documentSnapshot['age'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'age',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? name = _nameController.text;
                    final double? age = double.tryParse(_ageController.text);
                    if (name != null && age != null) {
                      if (action == 'create') {
                        // Persist a new Personal to Firestore
                        await _personal.add({"name": name, "age": age});
                      }

                      if (action == 'update') {
                        // Update the Personal
                        await _personal
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "age": age});
                      }

                      // Clear the text fields
                      _nameController.text = '';
                      _ageController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleteing a personal by id
  Future<void> _deletePersonal(String personalId) async {
    await _personal.doc(personalId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color.fromARGB(255, 71, 224, 0),
        content: Text('You have successfully deleted a personal')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal data'),
      ),
      // Using StreamBuilder to display all personal from Firestore in real-time
      body: StreamBuilder(
        stream: _personal.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      // backgroundColor: Color.fromARGB(255, 182, 182, 182),
                      backgroundImage: NetworkImage(
                          "https://nattasit0123.github.io/flutter/pic/user.png"),
                    ),
                    title: Text(documentSnapshot['name']),
                    subtitle: Text(documentSnapshot['age'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  _deletePersonal(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
