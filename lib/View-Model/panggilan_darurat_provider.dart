import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:resquecare/Models/panggilan_darurat_model.dart';
import 'package:resquecare/View-Model/enum.dart';

class PanggilanDaruratProvider extends ChangeNotifier {
  List<PanggilanDaruratModel>? _getDataNomor;
  ViewState _state = ViewState.none;

  ViewState get state => _state;
  List<PanggilanDaruratModel> get getDataNomor => _getDataNomor!;

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void getDataNomorPanggilanDarurat() async {
    setState(ViewState.loading);
    try {
      final data = FirebaseFirestore.instance.collection("Panggilan_Darurat").snapshots().map(
            (event) => event.docs.map((e) => PanggilanDaruratModel.fromJson(e.data())).toList(),
          );
      print(data);
      data.forEach((element) {
        print("here");
        print(element);
        _getDataNomor = element;
        print("ootd");
      });
      print("abc");
      print("get data here $_getDataNomor");

      setState(ViewState.none);
    } on FirebaseException catch (e) {
      print(e);
      setState(ViewState.error);
    }
    notifyListeners();
  }

  Future<void> createCallNumber(
    PanggilanDaruratModel data,
  ) async {
    try {
      final docData = FirebaseFirestore.instance.collection("Panggilan_Darurat").doc();
      data.id = docData.id;
      final json = data.toJson();
      docData.set(json);
    } on FirebaseException catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<void> editCallNumber(PanggilanDaruratModel data) async {
    final docData = FirebaseFirestore.instance.collection("Panggilan_Darurat").doc(data.id);
    data.id = docData.id;
    final json = data.toJson();
    docData.update(json);
    notifyListeners();
  }

  Future<void> deleteCallNumber(String id) async {
    final docData = FirebaseFirestore.instance.collection("Panggilan_Darurat").doc(id);
    docData.delete();
    notifyListeners();
  }
}
