class ZekrModel {
  int? taghebatId;
  String? taghebatTitle;
  int? namazId;

  ZekrModel({
    this.taghebatId,
    this.taghebatTitle,
    this.namazId,
  });
  ZekrModel.fromJson(Map<String, dynamic> json) {
    taghebatId = json['taghebatId'];
    taghebatTitle = json['taghebatTitle'];
    namazId = json['namazId'];
  }
}
