abstract class LoginStates{}
class InitialLoginState extends LoginStates{}
class PostSuccessLoginState extends LoginStates
{
  final String message;
  PostSuccessLoginState({required this.message});
}
class PostErrorLoginState extends LoginStates
{
  final String messageErr;
  PostErrorLoginState({required this.messageErr});
}

class PostSuccessEditProfileState extends LoginStates
{

}
class PostErrorEditProfileState extends LoginStates
{

}