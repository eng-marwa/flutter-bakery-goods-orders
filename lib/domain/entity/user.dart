import 'package:equatable/equatable.dart';

class User extends Equatable{
   String userId;
   String email;
   String name;

   User(this.userId, this.email, this.name);



  @override
  List<Object?> get props => [userId, email , name];

}