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
  var sId;
  var price;
  var volume;
  var unsettledVolume;

  Data({this.sId, this.price, this.volume, this.unsettledVolume});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    volume = json['volume'];
    unsettledVolume = json['unsettledVolume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['volume'] = this.volume;
    data['unsettledVolume'] = this.unsettledVolume;
    return data;
  }
}
