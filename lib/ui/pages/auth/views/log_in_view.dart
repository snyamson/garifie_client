import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/auth.dart';
import 'package:garifie_client/core/services/auth_service.dart';
import 'package:garifie_client/ui/pages/auth/widgets/app_text_button.dart';
import 'package:garifie_client/ui/pages/auth/widgets/round_button.dart';
import 'package:garifie_client/ui/shared/widgets/app_text_input.dart';
import 'package:garifie_client/utils/theme/dimensions.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

enum Status {
  login,
  register,
}

Status type = Status.login;

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _isLoading = false;

  void _loading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _switchType() {
    if (type == Status.register) {
      setState(() {
        type = Status.login;
      });
    } else {
      setState(() {
        type = Status.register;
      });
    }
  }

  late final AuthService auth = ref.watch(authProvider);

  Future<void> _onPressedFunction(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _loading();

    try {
      if (type == Status.login) {
        await auth.loginUser(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          ref: ref,
          context: context,
          onSuccess: () {
            context.pop();
          },
        );
        if (!mounted) return;
      } else {
        await auth.registerUser(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            username: _usernameController.text.trim(),
            context: context,
            ref: ref,
            onSuccess: () {
              context.pop();
            });
        if (!mounted) return;
      }

      _loading(); // Stop Loader
    } on Exception {
      _loading();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Image(
          image: AssetImage('assets/images/app_logo.png'),
          height: 30,
          width: 30,
          color: Colors.black,
          fit: BoxFit.cover,
        ),
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: context.iconColor,
            size: Dimensions.iconSize20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32, width: 16),
              Text(
                type == Status.login ? "Sign In" : "Register",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: boldTextStyle(),
              ),
              const SizedBox(height: 8),
              Text(
                type == Status.login
                    ? "Please sign in continue app"
                    : "Create your new account",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: primaryTextStyle(),
              ),
              const SizedBox(height: 32),
              if (type == Status.register)
                AppTextInput(
                  name: 'Username',
                  icon: Icons.person,
                  controller: _usernameController,
                ),
              const SizedBox(height: 16),
              AppTextInput(
                name: 'Email address',
                icon: Icons.email,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              AppTextInput(
                name: 'Password',
                icon: Icons.lock,
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              if (type == Status.login)
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    title: 'Forgot Password?',
                    onTap: () {},
                  ),
                ),
              if (type == Status.login) const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: RoundButton(
                  isLoading: _isLoading,
                  onTap: () async {
                    await _onPressedFunction(context);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                type == Status.login
                    ? "Don't have an account?"
                    : "Already have an account?",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: primaryTextStyle(),
              ),
              const SizedBox(height: 16),
              AppTextButton(
                title: type == Status.login ? 'Register' : 'Sign In',
                onTap: () {
                  _switchType();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
