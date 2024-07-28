import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(PetWatchApp());
}

class PetWatchApp extends StatelessWidget {
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'PetWatch',
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: PetWatchScreen(),
    );
  }
}

class Pet {
  final String name;
  final String age;
  final String description;

  Pet(this.name, this.age, this.description);
}

class PetWatchScreen extends StatefulWidget {
  @override
  _PetWatchScreenState createState() => _PetWatchScreenState();
}

class _PetWatchScreenState extends State<PetWatchScreen> {
  final List<Pet> _pets = [
    Pet('Terry', '3', 'Haftada 1 aşı pazartesi'),
    Pet('Roket', '7', 'Obezite, sabah akşam yürüyüş')
  ];

  void _addPet(Pet pet) {
    setState(() {
      _pets.add(pet);
    });
  }

  void _removePet(int index) {
    setState(() {
      _pets.removeAt(index);
    });
  }

  void _showPetDetails(Pet pet) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PetDetailScreen(pet),
      ),
    );
  }

  void _showAddPetForm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPetScreen(onAddPet: _addPet),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet List'),
        backgroundColor: Color.fromARGB(255, 46, 158, 209),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 14, 88, 148),
              Color.fromARGB(255, 122, 201, 247)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: _pets.length,
          itemBuilder: (context, index) {
            final pet = _pets[index];
            return InkWell(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                height: 120,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 153, 218, 255),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: -5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image(
                        image: AssetImage(
                            './assets/images/${pet.name.toLowerCase()}.png'),
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          pet.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          pet.description,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removePet(index),
                    ),
                  ],
                ),
              ),
              onTap: () => _showPetDetails(pet),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _showAddPetForm,
        child: Text('  Add Pet  '),
        backgroundColor: Color.fromARGB(255, 52, 152, 252),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  PetDetailScreen(this.pet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pet.name),
          backgroundColor: Color.fromARGB(255, 46, 158, 209),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 14, 88, 148),
                Color.fromARGB(255, 122, 201, 247)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 153, 218, 255),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: -5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                margin: EdgeInsets.all(8),
                height: 140,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 120,
                          margin: EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image(
                              image: AssetImage(
                                  './assets/images/${pet.name.toLowerCase()}.png'),
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              pet.name,
                              style: TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              'Age: ',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              pet.age,
                              style: TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          pet.description,
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 153, 218, 255),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: -5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: 240,
                width: double.infinity,
                margin: EdgeInsets.all(8),
                child: Center(
                  child: Container(
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage('./assets/images/map.png'),
                        fit: BoxFit.cover,
                        width: 600,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    // margin: EdgeInsets.all(8),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 153, 218, 255),
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: -5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                width: double.infinity,
                margin: EdgeInsets.all(8),
                child: Center(
                  child: Container(
                    child: ClipRRect(
                      child: Image(
                        image: AssetImage('./assets/images/catcam.png'),
                        fit: BoxFit.cover,
                        width: 600,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    // margin: EdgeInsets.all(8),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class AddPetScreen extends StatefulWidget {
  final Function(Pet) onAddPet;

  AddPetScreen({required this.onAddPet});

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _ageController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newPet = Pet(
        _titleController.text,
        _ageController.text,
        _descriptionController.text,
      );
      widget.onAddPet(newPet);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Pet'),
        backgroundColor: Color.fromARGB(255, 46, 158, 209),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 19, 92, 151),
              Color.fromARGB(255, 165, 222, 255)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pets age';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text('Add Pet'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ListTile(
//               leading: const CircleAvatar(
//                 backgroundImage:
//                     AssetImage('./assets/images/spongebob_drive.jpg'),
//               ),
//               title: Text(pet.name),
//               subtitle: Text(pet.description),
//               onTap: () => _showPetDetails(pet),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () => _removePet(index),
//               ),
//             ),
