import 'dart:convert';

class ThongTin {
  int? id;
  String? first_name;
  String? last_name;
  String? email;
  String? avatar;
  int? page;
  int? total_page;


  ThongTin({this.id,
    this.first_name,
     this.last_name,this.email,this.avatar,this.page,this.total_page
  });

  static ThongTin fromMap(Map<String, dynamic> user) {
    return new ThongTin(
      id: user['id'],
      first_name: user['first_name'],
      last_name: user['last_name'],
      email: user['email'],
      avatar: user['avatar'],
      page: user['page'],
      total_page: user['total_page'],
    );
  }

  toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'avatar': avatar,
      'page': page,
      'total_page': total_page,
    };
  }
}
