import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'constants.dart';

class ThirdPage extends StatefulWidget {
  final String email;

  ThirdPage({Key key,this.email}) : super(key: key);
  final String title = "Upload Image Demo";

  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  static final String uploadEndPoint = 'http://ip/CleanGoa/add_user_pics.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  String caption;
  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    print('started upload');
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName) {
    print('upload method');
    http.post(uploadEndPoint, body: {
      "user_id": widget.email,
      "image_name": fileName,
      "image_pic": base64Image,
      "caption": caption,
    }).then((result) {
      print('upload complete');
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      print(error.runtimeType);
      setStatus(error.toString());
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          print('inside showimage');
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    chooseImage();
  }

  @override
  Widget build(BuildContext context) {
    print('indeide buider\n');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            TextField(
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
                onChanged: (value) {
                  caption = value;
                },
                decoration: ktextfield.copyWith(hintText: 'ENTER YOUR CAPTION')),
            OutlineButton(
              borderSide: BorderSide(),
              onPressed: startUpload,
              child: Text('Upload Image'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 10.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
