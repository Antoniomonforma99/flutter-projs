class RequestTokenResponse {
  bool? success;
  String? expiresAt;
  String? requestToken;

  RequestTokenResponse({this.success, this.expiresAt, this.requestToken});

  RequestTokenResponse.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["expires_at"] is String) {
      expiresAt = json["expires_at"];
    }
    if (json["request_token"] is String) {
      requestToken = json["request_token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["expires_at"] = expiresAt;
    _data["request_token"] = requestToken;
    return _data;
  }
}
