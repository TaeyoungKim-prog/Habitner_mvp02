
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirestoreProvider {

  Future<void> sendData() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.add({
      'full_name' : 'Kim Kang Hyun',
      'company' : 'Student',
      'age' : 25
    }).then((value) => print("user add")).catchError((e)=>print(e));
  }

  void getData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.doc("ZsuZ2vW7nQijp4WpdPqS").get().then(
        (DocumentSnapshot ds) {
          print(ds.data());
        }
    );
  }

  void setData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc("ZsuZ2vW7nQijp4WpdPqS").set({
      'full_name': "kaisdf",
      'compy': 'asdf'
    });
  }

  void updateData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc("ZsuZ2vW7nQijp4WpdPqS").update({
      'full_name': "fffffff",
      'compssffdy': 'adsdf'
    });
  }

  void deleteUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc("ZsuZ2vW7nQijp4WpdPqS").update({
      'full_name': FieldValue.delete()
    });
    //users.doc("ZsuZ2vW7nQijp4WpdPqS").delete();
  }

}