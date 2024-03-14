import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/fire_base/model.dart';
import 'package:intl/intl.dart';


class FireBaseFunctions {


  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks (DateTime date){
    return getTaskCollection().where('date',isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch).snapshots();
  }
  static Future<void> deleteTask(String id){
    return getTaskCollection().doc(id).delete();
  }
  static Future<void> updateTask (String id,TaskModel task){
    return getTaskCollection().doc(id).update(task.toJson());
  }


  static createAcount  (String email,String pass,
      Function onSuccess,Function onError) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);

        print('The account already exists for that email.');
      }
      onError(e.message);

    } catch (e) {
      print(e);
      onError(e.toString());

    }
  }

  static String getDate (DateTime date){
    var formateDate = DateFormat("yyyy mm dd");
    return formateDate.format(date);
  }
}
