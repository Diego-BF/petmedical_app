import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:pet_medical/utils/constants.dart';

typedef DialogCallback = void Function();

class PetDetails extends StatelessWidget {
  // TODO add Pet field with constructor
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("name"), // TODO add pet name
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: PetDetailForm(), // TODO add pet
      ),
    );
  }
}

class PetDetailForm extends StatefulWidget {
  // TODO add Pet field with constructor

  @override
  _PetDetailFormState createState() => _PetDetailFormState();
}

class _PetDetailFormState extends State<PetDetailForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final dateFormat = DateFormat('yyyy-MM-dd');
  String name;
  String type;
  String notes;

  @override
  void initState() {
    // TODO set type to pet type
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: FormBuilder(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            FormBuilderTextField(
              attribute: "name",
              initialValue: "name",
              // TODO use pet name
              decoration: textInputDecoration.copyWith(
                  hintText: 'Name', labelText: "Pet Name"),
              validators: [
                FormBuilderValidators.minLength(1),
                FormBuilderValidators.required()
              ],
              onChanged: (val) {
                setState(() => name = val);
              },
            ),
            FormBuilderRadio(
              decoration: InputDecoration(labelText: 'Animal Type'),
              attribute: "cat",
              initialValue: type,
              leadingInput: true,
              options: [
                FormBuilderFieldOption(
                    value: "cat",
                    child: Text(
                      "Cat",
                      style: TextStyle(fontSize: 16.0),
                    )),
                FormBuilderFieldOption(
                    value: "dog",
                    child: Text(
                      "Dog",
                      style: TextStyle(fontSize: 16.0),
                    )),
                FormBuilderFieldOption(
                    value: "other",
                    child: Text(
                      "Other",
                      style: TextStyle(fontSize: 16.0),
                    )),
              ],
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            FormBuilderTextField(
              attribute: "notes",
              initialValue: "notes", // TODO Add pet notes
              decoration: textInputDecoration.copyWith(
                  hintText: 'Notes', labelText: "Notes"),
              onChanged: (val) {
                setState(() {
                  notes = val;
                });
              },
            ),
            FormBuilderCustomField(
              attribute: "vaccinations",
              formField: FormField(
                enabled: true,
                builder: (FormFieldState<dynamic> field) {
                  return Column(
                    children: <Widget>[
                      SizedBox(height: 6.0),
                      Text(
                        "Vaccinations",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(16.0),
                          itemCount: 0, // TODO use vaccination count
                          itemBuilder: (BuildContext context, int index) {
                            return buildRow(); // TODO Pass in vaccination
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _addVaccination(() {
                  // TODO add Pet
                  setState(() {});
                });
              },
              tooltip: 'Add Vaccination',
              child: Icon(Icons.add),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                    color: Colors.blue.shade600,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )),
                MaterialButton(
                    color: Colors.blue.shade600,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop();
                        // TODO Update widget
                      }
                    },
                    child: Text(
                      "Update",
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow() {
    // TODO Add Vaccination class
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text("vaccination"), // TODO Add vaccination name
        ),
        Text("Date"), // TODO Add Date
        Checkbox(
          value: false, // TODO add done
          onChanged: (newValue) {
            // TODO Update done
          },
        )
      ],
    );
  }

  void _addVaccination(DialogCallback callback) { // TODO Add Pet
    String vaccination;
    DateTime vaccinationDate;
    bool done = false;
    final _formKey = GlobalKey<FormBuilderState>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Vaccination"),
              content: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        attribute: "vaccination",
                        validators: [
                          FormBuilderValidators.minLength(1),
                          FormBuilderValidators.required()
                        ],
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Enter a Vaccination Name',
                            labelText: "Vaccination"),
                        onChanged: (text) {
                          setState(() {
                            vaccination = text;
                          });
                        },
                      ),
                      FormBuilderDateTimePicker(
                        attribute: "date",
                        inputType: InputType.date,
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Enter a Vaccination Date',
                            labelText: "Date"),
                        onChanged: (text) {
                          setState(() {
                            vaccinationDate = text;
                          });
                        },
                      ),
                      FormBuilderCheckbox(
                        attribute: "given",
                        label: Text("Given"),
                        onChanged: (text) {
                          setState(() {
                            done = text;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel")),
                FlatButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pop();
                        // TODO Add new Vaccination
                      }
                      callback();
                    },
                    child: Text("Add")),
              ]);
        });
  }
}
