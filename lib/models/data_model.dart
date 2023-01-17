class DataModel {
  String brand_name;
  String brand_logo;
  int status;
  int price;
  String message;

  DataModel(
      {required this.brand_logo,
      required this.brand_name,
      required this.message,
      required this.status,
      required this.price});
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      brand_logo: json["brand_img"] ?? "Random",
      brand_name: json["brand_name"],
      status: json["status"] != 0 || json["status"] != 1 ? 0 : json["status"],
      price: json["price"],
      message: json["message"]);
}
