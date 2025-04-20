class MatnDoaModel {
  int? matnid;
  String? matntext;
  int? taghebatid;

  MatnDoaModel({this.matnid, this.matntext, this.taghebatid});

  MatnDoaModel.fromJson(Map<String, dynamic> items) {
    matnid = items['matnId'];
    matntext = items['matnText'];
    taghebatid = items['taghebatId'];
  }
}
