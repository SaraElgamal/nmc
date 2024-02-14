// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Hello `
  String get hello_user {
    return Intl.message(
      'Hello ',
      name: 'hello_user',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get more {
    return Intl.message(
      'See More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get HeaderListH {
    return Intl.message(
      'Home Page',
      name: 'HeaderListH',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get HeaderListA {
    return Intl.message(
      'About Us',
      name: 'HeaderListA',
      desc: '',
      args: [],
    );
  }

  /// `Medical Network`
  String get HeaderListN {
    return Intl.message(
      'Medical Network',
      name: 'HeaderListN',
      desc: '',
      args: [],
    );
  }

  /// `Applying for the card`
  String get HeaderListAP {
    return Intl.message(
      'Applying for the card',
      name: 'HeaderListAP',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get HeaderListC {
    return Intl.message(
      'Contact Us',
      name: 'HeaderListC',
      desc: '',
      args: [],
    );
  }

  /// `Medical Card`
  String get HeaderListCart {
    return Intl.message(
      'Medical Card',
      name: 'HeaderListCart',
      desc: '',
      args: [],
    );
  }

  /// `No Card`
  String get no_Cart {
    return Intl.message(
      'No Card',
      name: 'no_Cart',
      desc: '',
      args: [],
    );
  }

  /// `The card has been reserved and is currently on the review list`
  String get not_get_Cart {
    return Intl.message(
      'The card has been reserved and is currently on the review list',
      name: 'not_get_Cart',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get buttonEnt {
    return Intl.message(
      'Log in',
      name: 'buttonEnt',
      desc: '',
      args: [],
    );
  }

  /// `log in`
  String get Login {
    return Intl.message(
      'log in',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there is no data to display. Make sure you are connected to the Internet`
  String get connection_data {
    return Intl.message(
      'Sorry, there is no data to display. Make sure you are connected to the Internet',
      name: 'connection_data',
      desc: '',
      args: [],
    );
  }

  /// `You are not connected to the Internet`
  String get connection {
    return Intl.message(
      'You are not connected to the Internet',
      name: 'connection',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get create_an_account {
    return Intl.message(
      'Sign Up',
      name: 'create_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Already Have an Account?`
  String get have_account {
    return Intl.message(
      'Already Have an Account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `The name must consist of at least two letters`
  String get condition_name {
    return Intl.message(
      'The name must consist of at least two letters',
      name: 'condition_name',
      desc: '',
      args: [],
    );
  }

  /// `Please phone number must be valid`
  String get condition_phone {
    return Intl.message(
      'Please phone number must be valid',
      name: 'condition_phone',
      desc: '',
      args: [],
    );
  }

  /// `This is not a valid email`
  String get condition_email {
    return Intl.message(
      'This is not a valid email',
      name: 'condition_email',
      desc: '',
      args: [],
    );
  }

  /// `Password is too short`
  String get condition_pass {
    return Intl.message(
      'Password is too short',
      name: 'condition_pass',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get buttonExit {
    return Intl.message(
      'Log out',
      name: 'buttonExit',
      desc: '',
      args: [],
    );
  }

  /// `PassWord`
  String get pass {
    return Intl.message(
      'PassWord',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get remember_me {
    return Intl.message(
      'Remember Me',
      name: 'remember_me',
      desc: '',
      args: [],
    );
  }

  /// `Don't have Account?`
  String get have_not_account {
    return Intl.message(
      'Don\'t have Account?',
      name: 'have_not_account',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Doctor or Hospital`
  String get first_filed {
    return Intl.message(
      'Doctor or Hospital',
      name: 'first_filed',
      desc: '',
      args: [],
    );
  }

  /// `Select Name`
  String get first_label {
    return Intl.message(
      'Select Name',
      name: 'first_label',
      desc: '',
      args: [],
    );
  }

  /// `filter from here`
  String get filter_text {
    return Intl.message(
      'filter from here',
      name: 'filter_text',
      desc: '',
      args: [],
    );
  }

  /// `loading ....`
  String get loading {
    return Intl.message(
      'loading ....',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Select Specialization`
  String get second_filed {
    return Intl.message(
      'Select Specialization',
      name: 'second_filed',
      desc: '',
      args: [],
    );
  }

  /// `Select Specialization`
  String get second_label {
    return Intl.message(
      'Select Specialization',
      name: 'second_label',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get third_filed {
    return Intl.message(
      'Governorate',
      name: 'third_filed',
      desc: '',
      args: [],
    );
  }

  /// `Select Governorate`
  String get third_label {
    return Intl.message(
      'Select Governorate',
      name: 'third_label',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get four_filed {
    return Intl.message(
      'Region',
      name: 'four_filed',
      desc: '',
      args: [],
    );
  }

  /// `Select Region`
  String get four_label {
    return Intl.message(
      'Select Region',
      name: 'four_label',
      desc: '',
      args: [],
    );
  }

  /// `choose governorate first`
  String get button_first_ch {
    return Intl.message(
      'choose governorate first',
      name: 'button_first_ch',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get nothing {
    return Intl.message(
      'Not Found',
      name: 'nothing',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get button_search {
    return Intl.message(
      'Search',
      name: 'button_search',
      desc: '',
      args: [],
    );
  }

  /// `More about us`
  String get button_more {
    return Intl.message(
      'More about us',
      name: 'button_more',
      desc: '',
      args: [],
    );
  }

  /// `All medical networks`
  String get allNet {
    return Intl.message(
      'All medical networks',
      name: 'allNet',
      desc: '',
      args: [],
    );
  }

  /// `contracts`
  String get contracts {
    return Intl.message(
      'contracts',
      name: 'contracts',
      desc: '',
      args: [],
    );
  }

  /// `Our latest contracts`
  String get contractLatest {
    return Intl.message(
      'Our latest contracts',
      name: 'contractLatest',
      desc: '',
      args: [],
    );
  }

  /// `All Contracts`
  String get allContracts {
    return Intl.message(
      'All Contracts',
      name: 'allContracts',
      desc: '',
      args: [],
    );
  }

  /// `Our services in medical institution development`
  String get service {
    return Intl.message(
      'Our services in medical institution development',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `All services`
  String get allService {
    return Intl.message(
      'All services',
      name: 'allService',
      desc: '',
      args: [],
    );
  }

  /// `Our customers`
  String get customers {
    return Intl.message(
      'Our customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get addPhoto {
    return Intl.message(
      'Add Photo',
      name: 'addPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Features of Waver Medical Card`
  String get cart {
    return Intl.message(
      'Features of Waver Medical Card',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `About The Company`
  String get about_company {
    return Intl.message(
      'About The Company',
      name: 'about_company',
      desc: '',
      args: [],
    );
  }

  /// `Apply for card`
  String get register_card {
    return Intl.message(
      'Apply for card',
      name: 'register_card',
      desc: '',
      args: [],
    );
  }

  /// `Individual`
  String get Individual {
    return Intl.message(
      'Individual',
      name: 'Individual',
      desc: '',
      args: [],
    );
  }

  /// `For the family`
  String get For_the_family {
    return Intl.message(
      'For the family',
      name: 'For_the_family',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personInformation {
    return Intl.message(
      'Personal Information',
      name: 'personInformation',
      desc: '',
      args: [],
    );
  }

  /// `This field must not be empty`
  String get validation {
    return Intl.message(
      'This field must not be empty',
      name: 'validation',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Setting {
    return Intl.message(
      'Settings',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get Date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'Date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `National ID number`
  String get National_ID_numbe {
    return Intl.message(
      'National ID number',
      name: 'National_ID_numbe',
      desc: '',
      args: [],
    );
  }

  /// `number of years`
  String get number_of_year {
    return Intl.message(
      'number of years',
      name: 'number_of_year',
      desc: '',
      args: [],
    );
  }

  /// `Contact information`
  String get Contact_information {
    return Intl.message(
      'Contact information',
      name: 'Contact_information',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobile_number {
    return Intl.message(
      'Mobile Number',
      name: 'mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `job`
  String get job {
    return Intl.message(
      'job',
      name: 'job',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get home_phone_number {
    return Intl.message(
      'Phone Number',
      name: 'home_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get company_name {
    return Intl.message(
      'Company Name',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Place Of Employment`
  String get Place_of_employment {
    return Intl.message(
      'Place Of Employment',
      name: 'Place_of_employment',
      desc: '',
      args: [],
    );
  }

  /// `Individual Data`
  String get IndividualData {
    return Intl.message(
      'Individual Data',
      name: 'IndividualData',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get fName {
    return Intl.message(
      'First Name',
      name: 'fName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lName {
    return Intl.message(
      'Last Name',
      name: 'lName',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Add Individual`
  String get Add_individual {
    return Intl.message(
      'Add Individual',
      name: 'Add_individual',
      desc: '',
      args: [],
    );
  }

  /// `Submission`
  String get Submission {
    return Intl.message(
      'Submission',
      name: 'Submission',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get back_to_home {
    return Intl.message(
      'Back to Home',
      name: 'back_to_home',
      desc: '',
      args: [],
    );
  }

  /// `Please go to this link and make payment :`
  String get pay_link {
    return Intl.message(
      'Please go to this link and make payment :',
      name: 'pay_link',
      desc: '',
      args: [],
    );
  }

  /// `Payment code : `
  String get pay_code {
    return Intl.message(
      'Payment code : ',
      name: 'pay_code',
      desc: '',
      args: [],
    );
  }

  /// `Choose payment method : `
  String get pay_way {
    return Intl.message(
      'Choose payment method : ',
      name: 'pay_way',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get message_details {
    return Intl.message(
      'Details',
      name: 'message_details',
      desc: '',
      args: [],
    );
  }

  /// `you should log in now`
  String get dialog {
    return Intl.message(
      'you should log in now',
      name: 'dialog',
      desc: '',
      args: [],
    );
  }

  /// `Search for a doctor, hospital, or medical services`
  String get Welcome_to_react {
    return Intl.message(
      'Search for a doctor, hospital, or medical services',
      name: 'Welcome_to_react',
      desc: '',
      args: [],
    );
  }

  /// `Add the profile picture.`
  String get photo {
    return Intl.message(
      'Add the profile picture.',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `style-en.css`
  String get cssFile {
    return Intl.message(
      'style-en.css',
      name: 'cssFile',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
