import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:uas/component/component.dart';
import 'package:uas/helper/dbhelper.dart';
import 'package:uas/model/data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  DBHelper dbHelper = DBHelper();
  List<Data> dataList = [];
  File image;
  final picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  Future getImage() async {
    var img = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (img != null) {
        print(img.path);
        image = File(img.path);
      } else {
        print("image not picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CRUD Apps',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'We Take Your Data',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    print("pressed");
                    getImage();
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).accentColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: (image != null)
                        ? Image.file(image, fit: BoxFit.cover)
                        : Icon(
                            Icons.add_a_photo,
                            color: Theme.of(context).accentColor,
                            size: 50,
                          ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                TextComponent(
                  readOnly: false,
                  hintText: " Name",
                  textEditingController: nameController,
                ),
                SizedBox(height: 10),
                TextComponent(
                  readOnly: false,
                  hintText: " Age",
                  textEditingController: ageController,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextComponent(
                  readOnly: false,
                  hintText: " Hobby",
                  textEditingController: hobbyController,
                ),
              ],
            ),
            Column(children: [
              ButtonComponent(
                label: "Save Data",
                onTap: () {
                  print("pressed");
                  dbHelper.insert(Data(
                      age: ageController.text,
                      hobby: hobbyController.text,
                      image_path: image.path,
                      name: nameController.text));
                  setState(() {
                    image = null;
                    ageController.clear();
                    nameController.clear();
                    hobbyController.clear();
                  });
                },
              ),
              SizedBox(height: 10),
              ButtonComponent(
                onTap: () {
                  Navigator.pushNamed(context, "/view");
                },
                label: "View Data",
                textColor: Theme.of(context).primaryColor,
                bgColor: Theme.of(context).buttonColor,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
