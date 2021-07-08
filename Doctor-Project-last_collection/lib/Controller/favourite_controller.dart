import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_project/models/doctor_card_model.dart';
import 'package:doctor_project/models/favourite_model.dart';

import '../constants.dart';

class FavouriteController {
  Future<void> setFavouriteDoctor(String id, bool isFavourit) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    print(" ************** Set Favourite Called ********** ");
    await firestore
        .collection("patients")
        .doc(uId)
        .collection("favorites")
        .doc()
        .set({"doctorId": id, "isFavorite": isFavourit});
  }

  Future<void> removeFavouriteDoctor(String doctorId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    print(" ************** remove Favourite Called ********** ");
    var query = await firestore
        .collection("patients")
        .doc(uId)
        .collection("favorites")
        .where("doctorId", isEqualTo: doctorId)
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                print(" Favourite id " + element.id);
                firestore
                    .collection("patients")
                    .doc(uId)
                    .collection("favorites")
                    .doc(element.id)
                    .delete()
                    .then((value) => {print("Success removed ")});
              })
            });
  }

  Future<List<FavouriteModel>> getFavouritDoctor() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<FavouriteModel> favourites = [];
    print(" ************** get Favourites Called ********** ");
    var querySnapshot = await firestore
        .collection("patients")
        .doc(uId)
        .collection("favorites")
        .get();
    var list = querySnapshot.docs;
    list.forEach((element) {
      String id = element.data()["doctorId"];
      bool isFavourite = element.data()["isFavorite"];
      favourites.add(FavouriteModel(element.id, id, isFavourite));
    });

    print(" ************** get Favourite Ended ********** ");

    return favourites;
  }

}
