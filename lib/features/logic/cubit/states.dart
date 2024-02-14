import 'package:n_m_c/features/auth/Register/register_model/register_model.dart';

abstract class AppStates{}
class InitialState extends AppStates{}
class changeButtonState extends AppStates{}
class changeSuffixIconState extends AppStates{}
class changeSuffixSignUpIconState extends AppStates{}
class FamilyChange extends AppStates{}
class ChangeCheckBoxIconState extends AppStates{}
class changeSuffixIconVerifyState extends AppStates{}
class OnPressState extends AppStates{}
class CreatePasswordState extends AppStates{}

class ChangeBottomNavState extends AppStates{}
class ApiPostCreateNewUser extends AppStates {
  final Client newUser;
  ApiPostCreateNewUser(this.newUser);
}

class IsCheckedState extends AppStates{}