class ShareParams {
 late String body;

  ShareParams({required this.body});

  ShareParams.fromJson(Map<String, dynamic> json) {
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    return data;
  }
}