class HomeCircularProgressIndicator {
  int? status;
  Data? data;
  HomeCircularProgressIndicator({this.status, this.data});
  HomeCircularProgressIndicator.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  int? response;
  String? message;
  List<Body>? body;

  Data({this.response, this.message, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    if (json['body'] != null) {
      body = <Body>[];
      json['body'].forEach((v) {
        body!.add(new Body.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['message'] = this.message;
    if (this.body != null) {
      data['body'] = this.body!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Body {
  String? totalCn;
  String? deliveredCn;
  String? returnedCn;
  String? pendingCn;
  String? totalAmount;
  String? deliveredAmount;
  String? returnedAmount;
  String? pendingAmount;

  Body(
      {this.totalCn,
      this.deliveredCn,
      this.returnedCn,
      this.pendingCn,
      this.totalAmount,
      this.deliveredAmount,
      this.returnedAmount,
      this.pendingAmount});

  Body.fromJson(Map<String, dynamic> json) {
    totalCn = json['total_cn'];
    deliveredCn = json['delivered_cn'];
    returnedCn = json['returned_cn'];
    pendingCn = json['pending_cn'];
    totalAmount = json['total_amount'];
    deliveredAmount = json['delivered_amount'];
    returnedAmount = json['returned_amount'];
    pendingAmount = json['pending_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_cn'] = this.totalCn;
    data['delivered_cn'] = this.deliveredCn;
    data['returned_cn'] = this.returnedCn;
    data['pending_cn'] = this.pendingCn;
    data['total_amount'] = this.totalAmount;
    data['delivered_amount'] = this.deliveredAmount;
    data['returned_amount'] = this.returnedAmount;
    data['pending_amount'] = this.pendingAmount;
    return data;
  }
}