class NamazModel {
  int? namazId;
  String? namazName;

  NamazModel({
    this.namazId,
    this.namazName,
  });

  NamazModel.fromJson(Map<String, dynamic> items) {
    namazId = items['namazId'];
    namazName = items['namazName'];
  }
}
