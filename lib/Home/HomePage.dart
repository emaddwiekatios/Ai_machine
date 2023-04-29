import 'package:flutter/material.dart';
import 'package:ml_app/ai_cat_dog/MyApp.dart';

import '../Speech/SpeechToText.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
var  scaffoldKeyState =GlobalKey<ScaffoldState>();
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: scaffoldKeyState,

      drawer: const getDrawer(),

      appBar: AppBar(leading: IconButton(icon:Icon(Icons.menu),onPressed: (){
        scaffoldKeyState.currentState?.openDrawer();

      },),),
      body :const Center(child: Text('Welcome')),
    );
  }
}

class getDrawer extends StatelessWidget {
  const getDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      width: MediaQuery.of(context).size.width/2,
      child:    ListView(
        children: [
      DrawerHeader(

            child: UserAccountsDrawerHeader(
              accountEmail: Text('eeee'),
              accountName: Text('eee'),
              margin: EdgeInsets.all(0),
            ),
          ),
          const Divider(color: Colors.black,height: 4,),
          ListTile(
            subtitle: Text('Ai'),
            leading: IconButton(icon:const Icon(Icons.account_tree_sharp),
              onPressed: (){
              print('tttt');
              Navigator.push(context, MaterialPageRoute(builder: (_)=>MyApp()));
            },),
            title: Text('Ai  '),
          // trailing: Icon(Icons.dangerous),
      ),
          ListTile(
            subtitle: Text('Speech to Text'),
            leading: IconButton(icon:const Icon(Icons.takeout_dining),
              onPressed: (){
                print('ttfdbgdbsdgbtt     ghthfdh');
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SpeechToText()));
              },),
            title: Text('Speech to Text'),
            // trailing: Icon(Icons.dangerous),
          )
        ],
      ),
    );
  }
}
