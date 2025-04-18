import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helpers/styled_snackbar.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/widgets/styled_circular_progress_indicator.dart';
import '../../../controller/auth_cubit.dart';
import '../../components/auth_button.dart';
import '../../components/social_auth_section.dart';
import 'register_fields.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            AppStrings.registration,
            style: AppStyles.textStyleBold55(context),
          ),
          RegisterFields(
            emailController: emailController,
            passwordController: passwordController,
            usernameController: usernameController,
          ),
          const SizedBox(
            height: 5,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showStyledSnackBar(context, state.message);
              }

              if (state is RegisterSuccess) {
                GoRouter.of(context).go(AppRouter.kLogin);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const StyledLoading();
              }

              return AuthButton(
                buttonText: AppStrings.register,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().registerWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text,
                        );
                  }
                },
              );
            },
          ),
          const SocialAuthSection(),
        ],
      ),
    );
  }
}
