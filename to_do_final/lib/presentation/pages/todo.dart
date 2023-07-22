import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:to_do_final/internal/theme/dark_theme.dart';
import 'package:to_do_final/presentation/pages/navbar.dart';


class ToDo extends StatefulWidget {
  ToDo({Key? key}) : super(key: key);


  final FirebaseDatabase database1 = FirebaseDatabase.instanceFor(app: Firebase.app('first DB'));
  final DatabaseReference dbRef1 = FirebaseDatabase.instanceFor(app: Firebase.app('first DB')).ref().child('toDouser');

  final FirebaseDatabase database2 = FirebaseDatabase.instanceFor(app: Firebase.app('second DB'));
  final DatabaseReference dbRef2 = FirebaseDatabase.instanceFor(app: Firebase.app('second DB')).ref().child('inProgressuser');



  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {

  late String _TaskName;
  late String _TaskAbout;

  

 @override
  void initState() {
    super.initState();
    _getData();
  }

  late String collectionName;
  String dataText = '';

  Future<void> _checkData(String taskName, String taskAbout, DateTime date, String time) async {
    if (taskName.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Warning'),
            content: const Text('Please enter name of your task'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK', style: TextStyle(color: Colors.white)),
              )
            ],
          );
        },
      );
      return;
    }
    _setData(taskName, taskAbout, date, time);
  }

  Future<void> _setData(String taskName, String taskAbout, DateTime date, String time) async {
    final newTaskRef = widget.dbRef1.push();
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    await newTaskRef.set({
      "name": taskName,
      "about": taskAbout,
      "date": formattedDate,
      "time": time
    });
    setState(() {
      selectedDate = DateTime.now();
    });
    setState(() {
      selectedTime = TimeOfDay.now();
    });
  }
  Future<void> _updateData(taskKey, taskName, taskAbout, date, time) async {
    await widget.dbRef1.child(taskKey).update({
      "name": "$taskName",
      "about": "$taskAbout",
      "date": "$date",
      "time": "$time",
    });
    setState(() {
      selectedDate = DateTime.now();
    });
    setState(() {
      selectedTime = TimeOfDay.now();
    });
  }

  Future<void> _getData() async {
    final snapshot = await widget.dbRef1.child('').get();
    if (snapshot.exists) {
      setState(() {
        dataText = snapshot.value.toString();
      });
    } else {
      setState(() {
        dataText = 'No data available.';
      });
    }
  }

  Future<void> _deleteData(taskKey) async {
    await widget.dbRef1.child(taskKey).remove();
  }

  Future<void> _moveRightData(taskKey, taskName, taskAbout, date, time) async {
    await widget.dbRef1.child(taskKey).get();
    final moveRef = widget.dbRef2.push();
    await moveRef.set({
      "name": taskName,
      "about": taskAbout,
      "date": date,
      "time": time,
    });
    _deleteData(taskKey);
  }




  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 110),
          child: Text('To do')
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
            child: FirebaseAnimatedList(
              query: widget.dbRef1,
              itemBuilder: (context, snapshot, animation, index) {
                final key = snapshot.key;
                final name = snapshot.child('name').value;
                final about = snapshot.child('about').value;
                final date = snapshot.child('date').value;
                final time = snapshot.child('time').value;
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      // Змах вправо: виконати дію
                      _moveRightData(key.toString(), name, about, date, time);
                    } else if (direction == DismissDirection.endToStart) {
                      // Змах вліво: видалити завдання
                      _deleteData(key.toString());
                    }
                  },
                  background: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(Icons.timelapse, color: Theme.of(context).colorScheme.onBackground, size: 30,),
                  ),
                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.onBackground, size: 30,),
                  ),
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                    child: ListTile(
                      title: Text(
                        name.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Deleting'),
                                content: const Text('After deleting it is impossible to return. Are you sure?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }, 
                                    child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.outline),),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      _deleteData(key.toString());
                                      Navigator.pop(context);
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red
                                    ),
                                    child: const Text('Delete', style: TextStyle(color: Colors.white))
                                  )
                                ],
                              );
                            }
                          );
                        },
                      ),
                      subtitle: Text(
                        " ${about.toString()} \n Deadline: $date \n $time",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Editing'),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  onChanged: (String value) {
                                    _TaskName = value;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    hintText: name.toString(),
                                  ),
                                ),
                                TextField(
                                  onChanged: (String value) {
                                    _TaskAbout = value;
                                  },
                                    decoration: InputDecoration(
                                      labelText: 'About',
                                      hintText: about.toString(), 
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final DateTime? dateTime = await showDatePicker(
                                        context: context, 
                                        initialDate: selectedDate, 
                                        firstDate: DateTime(2000), 
                                        lastDate: DateTime(3000),
                                      );
                                      if (dateTime != null) {
                                        setState(() {
                                          selectedDate = dateTime;
                                        });
                                      }
                                    }, 
                                    child: const Text('Choose date', style: TextStyle(color: Colors.white))
                                  ),
                                  const Divider(),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final TimeOfDay? timeOfDay = await showTimePicker(
                                        context: context, 
                                        initialTime: TimeOfDay.now()
                                      );
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                      }
                                    }, 
                                    child: const Text('Choose time', style: TextStyle(color: Colors.white))
                                  )
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }, 
                                  child: const Text('Cancel'),
                                  ),
                                ElevatedButton(
                                  onPressed: () {
                                    _updateData(key.toString(), _TaskName, _TaskAbout, selectedDate, selectedTime.format(context).toString());
                                    Navigator.of(context).pop();
                                  }, 
                                  child: const Text('Save', style: TextStyle(color: Colors.white))
                                  )
                              ],
                            );
                          }
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Adding new task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      onChanged: (String value) {
                        _TaskName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        hintText: 'Wash my car',
                      ),
                    ),
                    TextField(
                      onChanged: (String value) {
                        _TaskAbout = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'About',
                        hintText: 'Use shampoo and...',
                      ),
                    ),
                    const Divider(),
                    ElevatedButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                          context: context, 
                          initialDate: selectedDate, 
                          firstDate: DateTime(2023), 
                          lastDate: DateTime(2033),
                        );
                        if (dateTime != null) {
                          setState(() {
                            selectedDate = dateTime;
                          });
                        }
                      }, 
                      child: const Text('Choose date', style: TextStyle(color: Colors.white))
                    ),
                    const Divider(),
                    ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context, 
                          initialTime: TimeOfDay.now()
                        );
                        if (timeOfDay != null) {
                          setState(() {
                            selectedTime = timeOfDay;
                          });
                        }
                      }, 
                      child: const Text('Choose time', style: TextStyle(color: Colors.white))
                    )
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.outline),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _checkData(_TaskName, _TaskAbout, selectedDate, selectedTime.format(context).toString());
                      setState(() {
                        _TaskName = '';
                        _TaskAbout = '';
                      });
                    },
                    child: const Text('Done', style: TextStyle(color: Colors.white)),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}