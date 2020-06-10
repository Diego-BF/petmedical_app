import 'package:flutter/material.dart';
import 'package:pet_medical/PetDetails.dart';
import 'package:pet_medical/utils/pets_icons.dart';

void main() => runApp(MyApp());

const BoldStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pet Medical Central',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeList());
  }
}

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  // TODO Add Data Repository

  @override
  Widget build(BuildContext context) {
    return _buildHome(context);
  }

  Widget _buildHome(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets"),
      ),
      body: Text("Body"), // TODO Add StreamBuilder
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPet();
        },
        tooltip: 'Add Pet',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _addPet() {
    AlertDialogWidget dialogWidget = AlertDialogWidget();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Add Pet"),
              content: dialogWidget,
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel")),
                FlatButton(
                    onPressed: () {
                      // TODO Add New Pet to repository
                      Navigator.of(context).pop();
                    },
                    child: Text("Add")),
              ]);
        });
  }

  Widget _buildList(BuildContext context) { // TODO Add Snapshot list
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: <Widget>[], // TODO Add _BuildListItem call with snapshot list
    );
  }

  Widget _buildListItem(BuildContext context) { // TODO Add Snapshot list
    // TODO Get Pet from snapshot
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: InkWell(
          child: Row(
            children: <Widget>[
              Expanded(child: Text("name", style: BoldStyle)), // TODO add pet name
              _getPetIcon("cat") // TODO Add pet type
            ],
          ),
          onTap: () {
            _navigate(BuildContext context)  {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetDetails(), // TODO add pet
                  ));
            }

            _navigate(context);
          },
          highlightColor: Colors.green,
          splashColor: Colors.blue,
        ));
  }

  Widget _getPetIcon(String type ) {
    Widget petIcon;
    if (type == "cat") {
      petIcon = IconButton(
        icon: Icon(Pets.cat),
        onPressed: () {},
      );
    } else if (type == "dog") {
      petIcon = IconButton(
        icon: Icon(Pets.dog_seating),
        onPressed: () {},
      );

    } else {
      petIcon = IconButton(
        icon: Icon(Icons.pets),
        onPressed: () {},
      );
    }
    return petIcon;
  }

}

class AlertDialogWidget extends StatefulWidget {
  String petName;
  String character = '';

  @override
  _AlertDialogWidgetState createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a Pet Name"),
            onChanged: (text) => widget.petName = text,
          ),
          RadioListTile(
            title: Text("Cat"),
            value: "cat",
            groupValue: widget.character,
            onChanged: (String value) {
              setState(() { widget.character = value; });
            },
          ),
          RadioListTile(
            title: Text("Dog"),
            value: "dog",
            groupValue: widget.character,
            onChanged: (String value) {
              setState(() { widget.character = value; });
            },
          ),
          RadioListTile(
            title: Text("Other"),
            value: "other",
            groupValue: widget.character,
            onChanged: (String value) {
              setState(() { widget.character = value; });
            },
          )
        ],
      ),
    );
  }
}

