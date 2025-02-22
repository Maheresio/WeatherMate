import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/styled_snackbar.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/app_styles.dart';
import '../../../../../../core/widgets/styled_circular_progress_indicator.dart';
import '../../../controller/auth_cubit.dart';
import '../../components/auth_button.dart';
import '../../components/social_auth_section.dart';
import 'login_fields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
          Text(
            AppStrings.login,
            style: AppStyles.textStyleBold55(context),
          ),
          LoginFields(
            emailController: emailController,
            passwordController: passwordController,
          ),
          Text(
            AppStrings.forgotPassword,
            style: AppStyles.textStyleNormal20(context),
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showStyledSnackBar(context, state.message);
              }

              if (state is AuthSuccess) {}
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const StyledCircularProgressIndicator();
              }
              if (state is AuthSuccess) {
                return Center(
                  child: Text(
                    'Success',
                    style: AppStyles.textStyleBold55(context),
                  ),
                );
              }
              return AuthButton(
                buttonText: AppStrings.login,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().loginWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
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
