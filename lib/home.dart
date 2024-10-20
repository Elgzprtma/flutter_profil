import 'package:flutter/material.dart';
import 'Page2.dart';
import 'LoginPage.dart';
import 'ProfileFormPage.dart'; // We'll rename NameFormPage to ProfileFormPage

class Home extends StatefulWidget {
  final String initialName;
  final String initialClass;
  final String initialSchool;

  const Home({
    Key? key, 
    required this.initialName, 
    required this.initialClass, 
    required this.initialSchool
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String name;
  late String className;
  late String school;

  @override
  void initState() {
    super.initState();
    name = widget.initialName;
    className = widget.initialClass;
    school = widget.initialSchool;
  }

  void updateProfile(String newName, String newClass, String newSchool) {
    setState(() {
      name = newName;
      className = newClass;
      school = newSchool;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Color.fromRGBO(252, 219, 141, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.shortestSide,
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color.fromRGBO(252, 219, 141, 1),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80.0,
                        backgroundImage: AssetImage("assets/images/profil.JPG"),
                      ),
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Kelas: $className",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        school,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Color(0xF9916B0D)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page2()),
                          );
                        },
                        child: Text("See More"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileFormPage(
                                currentName: name,
                                currentClass: className,
                                currentSchool: school,
                              ),
                            ),
                          );
                          if (result != null) {
                            updateProfile(result['name'], result['class'], result['school']);
                          }
                        },
                        child: Text("Edit Profile"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xF9916B0D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}