import 'dart:convert';

class ApiApp {
//
  static String baseUrl = "https://ekantin.amazeglam.id/api";

// login
  static String basicAuth =
      'Basic ${base64.encode(utf8.encode('e-kantin:e-kantin2023'))}';
  static String login = "$baseUrl/courier/login/auth";
  static String lupaPassword = "$baseUrl/courier/login/reset_password";
  static String verifikasi = "$baseUrl/courier/login/code_verification";
  static String regiter = "$baseUrl/courier/login/register";
  static String updatePassword =
      "$baseUrl/courier/login/update_password?token_user=";

// profile
  static String profile = "$baseUrl/courier/my_courier?token_user=";
  static String updateProfile = "$baseUrl/courier/update?token_user=";
  static String getFavorite = "$baseUrl/courier/menu/favorite_menu?token_user=";
  static String addFavorite = "$baseUrl/courier/menu/set_favorite?token_user=";

// work
  static String setWork = "$baseUrl/courier/start_working?token_user=";
}
