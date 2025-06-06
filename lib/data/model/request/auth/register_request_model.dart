import 'dart:convert';

class PostingJualRequestModel {
    final String? username;
    final String? email;
    final String? password;
    final String? passwordConfirmation;
    final int? roleId;

    PostingJualRequestModel({
        this.username,
        this.email,
        this.password,
        this.passwordConfirmation,
        this.roleId,
    });

    factory PostingJualRequestModel.fromJson(String str) => PostingJualRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PostingJualRequestModel.fromMap(Map<String, dynamic> json) => PostingJualRequestModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        roleId: json["role_id"],
    );

    Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "role_id": roleId,
    };
}
