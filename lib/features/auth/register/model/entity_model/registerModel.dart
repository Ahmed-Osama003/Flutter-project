

class registerModel{

  String? name, email, phone, password;
  int? id;
  registerModel.fromjson(Map m){
    print(m.toString());
    name = m['name'];
    email = m['email'];
    phone = m['phone'];
    id = m['id'];
    password = m['password'];
  }




}