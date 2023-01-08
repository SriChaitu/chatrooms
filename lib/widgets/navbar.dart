import 'package:chatrooms/pages/football.dart';
import 'package:chatrooms/pages/photography.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/arts.dart';
import '../pages/login.dart';
import '../pages/music.dart';

Future Navmain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(NavDrawer());
}
class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  var uname='hello';
  void initState() {
    // TODO: implement initState
    super.initState();
    //uname = UserSimplePreferences.getUname() ?? 'ok';
    loadCounter();
  }
  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uname = prefs.getString('userName') ?? 'ok';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Drawer(
        backgroundColor: Colors.grey[850],
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: Icon(Icons.sports_soccer,color: Colors.white, size:50 ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                          return FootBall(uname: uname,);
                        }));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: Icon(Icons.camera_enhance_outlined,color: Colors.white,size:50),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                          return Photography(uname: uname,);
                        }));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: Icon(Icons.headset_mic_outlined,color: Colors.white,size:50),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                          return music(uname: uname,);
                        }));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.palette_outlined,color: Colors.white,size:50),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                        return Arts(uname: uname,);
                      }));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                leading: Icon(Icons.exit_to_app,color: Colors.white,size:50),
                onTap: () async{
                  SharedPreferences pref =await SharedPreferences.getInstance();
                  pref.remove('userName');
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                    return LoginPage();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}