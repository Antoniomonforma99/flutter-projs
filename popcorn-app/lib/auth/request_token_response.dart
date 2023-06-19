class RequestToken {
  bool? success;
  late final String expiresAt;
  String? requestToken;

  RequestToken({this.success, required this.expiresAt, this.requestToken});

  factory RequestToken.fromJson(Map<String, dynamic> json) {
    return RequestToken(
      success: json['success'],
      requestToken: json['request_token'],
      expiresAt: json['expires_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["expires_at"] = expiresAt;
    _data["request_token"] = requestToken;
    return _data;
  }

  Map<String, dynamic> toJson1() => {
        'request_token': requestToken,
      };
}
