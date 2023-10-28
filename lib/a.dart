import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sh extends StatefulWidget {
  const sh({super.key});

  @override
  State<sh> createState() => _shState();
}

class _shState extends State<sh> {
  TextEditingController _name=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _update();
  }
  String saving='';
  void _saving( text)async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString('save', text);
  }
  void _update()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      saving=prefs.getString("save")??'';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _name,

            ),
            ElevatedButton(onPressed: (){
              final text=_name.text.toString();
              _saving(text);
              setState(() {
                saving=text;
              });

            }, child: Text("save")),
            ElevatedButton(onPressed: (){
                showDialog(context: context, builder: (context) {
                  return Text("savedtext=$saving");
                },);
            }, child: Text("show"))
          ],
        ),
      ),
    );
  }
}