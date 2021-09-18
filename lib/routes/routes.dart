import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/users_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> appRoutes = {
  "users": (_) => const UsersPage(),
  "chat": (_) => const ChatPage(),
  "login": (_) => const LoginPage(),
  "register": (_) => const RegisterPage(),
  "loading": (_) => const LoadingPage()
};
