import 'dart:convert';

/// GetToken decoder
GetToken getTokenFromJson(String str) => GetToken.fromJson(json.decode(str));
String getTokenToJson(GetToken data) => json.encode(data.toJson());

/// GetToken Future
class GetToken {
    String token;
    int error;
    String status;

    GetToken({
        this.token,
        this.error,
        this.status,
    });

    factory GetToken.fromJson(Map<String, dynamic> json) => GetToken(
        token: json["token"],
        error: json["error"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "error": error,
        "status": status,
    };
}