abstract class RegisterStates{}
class InitialRegisterState extends RegisterStates{}
class PostSuccessRegisterState extends RegisterStates
{
  final String message;
  PostSuccessRegisterState({required this.message});
}
class PostErrorRegisterState extends RegisterStates
{
  final String messageErr;
  PostErrorRegisterState({required this.messageErr});
}