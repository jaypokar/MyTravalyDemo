import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytravaly/presentation/basicWidget/custom_button.dart';
import 'package:mytravaly/presentation/basicWidget/loading_widget.dart';
import 'package:mytravaly/presentation/basicWidget/textWidgets/text_bold_widget.dart';
import 'package:mytravaly/resources/app_router.dart';
import 'package:mytravaly/resources/image_resources.dart';
import 'package:mytravaly/resources/string_resources.dart';

import '../../../base/base_stateful_widget.dart';
import '../../../injection_container.dart';
import '../../../resources/value_key_resources.dart';
import '../../../util/common_functions.dart';
import '../../../util/validators.dart';
import '../../basicWidget/textWidgets/text_semibold_widget.dart';
import '../../bloc/authBloc/auth_bloc.dart';

@RoutePage()
class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends BaseStatefulWidgetState<AuthenticationPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, AuthState state) {
        if (state is AuthErrorState) {
          showValidationMessage(state.message);
          if (state.errorCode == ValueKeyResources.noInternetErrorCode ||
              state.errorCode == ValueKeyResources.connectionTimedOutErrorCode) {
            handleErrorCodes(errorCode: state.errorCode);
          }
        } else if (state is AuthenticatedState) {
          pushReplacement(const HomeRoute());
          showSuccessMessage('Login Successful!');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: sl<CommonFunctions>().pageEdgeToEdgePadding(
                top: MediaQuery.of(context).viewPadding.top,
                bottom: MediaQuery.of(context).viewPadding.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  Image.asset(
                    ImageResources.appIcon,
                    height: 80,
                  ),
                  const SizedBox(height: 24),
                  const TextBoldWidget(
                    data: StringResources.welcome,
                    fontSize: 26,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const TextSemiBoldWidget(
                    data: StringResources.signinToContinue,
                    fontSize: 22,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                    decoration: const InputDecoration(
                      labelText: StringResources.email,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    validator: Validators.password,
                    decoration: InputDecoration(
                      labelText: StringResources.password,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const LoadingWidget();
                      }
                      return ButtonWidget(
                        padding: 0,
                        textSize: 16,
                        buttonText: StringResources.signIn,
                        onPressButton: _loginWithEmail,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('OR'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton.icon(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white10),
                    ),
                    onPressed: () => context.read<AuthBloc>().add(const OnSignInWithGoogleEvent()),
                    icon: Image.asset(ImageResources.googleIcon, height: 20),
                    label: const TextBoldWidget(
                      data: StringResources.signInWithGoogle,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      TextButton(
                        onPressed: () => push(const SignupRoute()),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginWithEmail() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            OnSignInWithEmailPassEvent(
              email: _emailController.text.trim(),
              pass: _passwordController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
