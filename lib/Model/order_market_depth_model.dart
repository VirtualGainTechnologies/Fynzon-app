class BuyModel {
  String message;
  String error;
  List<Data> data;

  BuyModel({this.message, this.error, this.data});

  BuyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  var volume;
  var price;

  Data({this.volume, this.price});

  Data.fromJson(Map<String, dynamic> json) {
    volume = json['volume'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['volume'] = this.volume;
    data['price'] = this.price;
    return data;
  }
}