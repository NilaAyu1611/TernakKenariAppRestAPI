import 'package:flutter/cupertino.dart';

class RegisterSreen extends StatefulWidget {
  const RegisterSreen({super.key});

  @override
  State<RegisterSreen> createState() => _RegisterSreenState();
}

class _RegisterSreenState extends State<RegisterSreen> {
  late final TextEditingController namaController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> _key;
  bool isShowPassword = false;

  @override
  void initState() {
    namaController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _key = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    namaController.dispose();
    _key.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}