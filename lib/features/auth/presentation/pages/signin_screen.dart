import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/auth/presentation/widgets/auth_form_widgets.dart';
import 'package:optilife_app/features/auth/presentation/widgets/auth_input_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Image.asset("assets/images/logo.png", scale: 2), // fake logo
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'OptiLife',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome back 👋',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: AppColors.navy,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in to continue your personalized wellness plan.',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.muted,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              authFieldLabel('Email address'),
              AuthInputField(
                controller: _emailController,
                hint: 'you@example.com',
                icon: Icons.mail_outline_rounded,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              authFieldLabel('Password'),
              AuthInputField(
                controller: _passwordController,
                hint: 'Password',
                icon: Icons.lock_outline_rounded,
                obscure: _obscurePassword,
                trailing: IconButton(
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  color: const Color(0xFF718071),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    activeColor: AppColors.primaryGreen,
                    onChanged: (v) => setState(() => _rememberMe = v ?? false),
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: AppColors.primaryTeal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'Forgot password?',
                  //     style: TextStyle(
                  //       color: AppColors.primaryTeal,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 20),
              AuthPrimaryButton(
                label: 'Log In',
                onPressed: () => context.go(AppRouter.home),
              ),
              const SizedBox(height: 20),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Divider(color: AppColors.bgLight, thickness: 1),
              //     ),
              //     // Padding(
              //     //   padding: const EdgeInsets.symmetric(horizontal: 12),
              //     //   child: Text(
              //     //     'OR CONTINUE WITH',
              //     //     style: TextStyle(
              //     //       color: AppColors.muted,
              //     //       fontSize: 12,
              //     //       fontWeight: FontWeight.w600,
              //     //       letterSpacing: 0.5,
              //     //     ),
              //     //   ),
              //     // ),
              //     // Expanded(
              //     //   child: Divider(color: AppColors.bgLight, thickness: ),
              //     // ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     SizedBox(
              //       width: double.infinity,
              //       height: 54,
              //       child: DecoratedBox(
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(16),
              //           border: Border.all(color: AppColors.bgLight),
              //           boxShadow: const [
              //             BoxShadow(
              //               color: Color(0x0F000000),
              //               blurRadius: 10,
              //               offset: Offset(0, 4),
              //             ),
              //           ],
              //         ),
              //         child: ElevatedButton(
              //           onPressed: _signInWithGoogle,
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.white,
              //             shadowColor: Colors.transparent,
              //             elevation: 0,
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(16),
              //             ),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: const [
              //               Icon(Icons.login, color: AppColors.navy, size: 20),
              //               SizedBox(width: 8),
              //               Text(
              //                 'Continue with Google',
              //                 style: TextStyle(
              //                   color: AppColors.navy,
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: AppColors.muted, fontSize: 17),
                  ),
                  TextButton(
                    onPressed: () => context.go(AppRouter.signup),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: AppColors.primaryTeal,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
