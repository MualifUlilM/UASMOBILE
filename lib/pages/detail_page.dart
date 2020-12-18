import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:uas/component/component.dart';
import 'package:uas/helper/dbhelper.dart';
import 'package:uas/model/data.dart';

class DetailPage extends StatefulWidget {
  Data data;

  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameController;
  TextEditingController ageController;
  TextEditingController hobbyController;
  File image;

  final picker = ImagePicker();

  DBHelper dbHelper = DBHelper();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    image = File(widget.data.image_path);
    this.nameController = TextEditingController(text: widget.data.name);
    this.ageController = TextEditingController(text: widget.data.age);
    this.hobbyController = TextEditingController(text: widget.data.hobby);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
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
                label: "Update Data",
                onTap: () {
                  print("pressed");
                  dbHelper.update(Data(
                      id: widget.data.id,
                      age: ageController.text,
                      hobby: hobbyController.text,
                      image_path:
                          (image == null) ? widget.data.image_path : image.path,
                      name: nameController.text));
                  dbHelper.select();
                },
              ),
              SizedBox(height: 10),
              ButtonComponent(
                onTap: () {
                  dbHelper.delete(widget.data.id);
                  Navigator.pop(context);
                },
                label: "Hapus Data",
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
