// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Post({
        required this.postId,
        required this.imageUrl,
        required this.username,
        required this.createdAt,
        required this.liked,
        required this.message,
        required this.attachments,
    });

    String postId;
    String imageUrl;
    String username;
    String createdAt;
    List<String> liked;
    Message message;
    List<Attachment> attachments;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json["postId"],
        imageUrl: json["imageUrl"],
        username: json["username"],
        createdAt: json["created_At"],
        liked: List<String>.from(json["liked"].map((x) => x)),
        message: Message.fromJson(json["message"]),
        attachments: List<Attachment>.from(json["attachments"].map((x) => Attachment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "imageUrl": imageUrl,
        "username": username,
        "created_At": createdAt,
        "liked" : List<String>.from(liked.map((x) => x)),
        "message": message.toJson(),
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
    };
}

class Attachment {
    Attachment({
        required this.type,
        required this.url,
    });

    String type;
    String url;

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}

class Message {
    Message({
        required this.title,
        required this.description,
    });

    String title;
    String description;

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.userId,
        required this.username,
        required this.email,
        required this.education,
        required this.experience,
    });

    DateTime userId;
    String username;
    String email;
    List<Education> education;
    List<Experience> experience;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: DateTime.parse(json["userId"]),
        username: json["username"],
        email: json["email"],
        education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
        experience: List<Experience>.from(json["experience"].map((x) => Experience.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId.toIso8601String(),
        "username": username,
        "email": email,
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
    };
}

class Education {
    Education({
        required this.university,
        required this.degree,
        required this.field,
        required this.grade,
        required this.activities,
        required this.startYear,
        required this.endYear,
        required this.description,
    });

    String university;
    String degree;
    String field;
    String grade;
    String activities;
    String startYear;
    String endYear;
    String description;

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        university: json["university"],
        degree: json["degree"],
        field: json["field"],
        grade: json["grade"],
        activities: json["activities"],
        startYear: json["startYear"],
        endYear: json["endYear"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "university": university,
        "degree": degree,
        "field": field,
        "grade": grade,
        "activities": activities,
        "startYear": startYear,
        "endYear": endYear,
        "description": description,
    };
}

class Experience {
    Experience({
        required this.jobroll,
        required this.companyname,
        required this.started,
    });

    String jobroll;
    String companyname;
    String started;

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        jobroll: json["jobroll"],
        companyname: json["companyname"],
        started: json["started"],
    );

    Map<String, dynamic> toJson() => {
        "jobroll": jobroll,
        "companyname": companyname,
        "started": started,
    };
}

