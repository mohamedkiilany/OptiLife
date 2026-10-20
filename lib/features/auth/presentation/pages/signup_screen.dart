import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optilife_app/core/router/app_router.dart';
import 'package:optilife_app/core/theme/app_colors.dart';
import 'package:optilife_app/features/auth/presentation/widgets/auth_form_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;

  bool _acceptedTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final password = _passwordController.text;
    final strength =
        password.length >= 8 &&
            RegExp(r'\d').hasMatch(password) &&
            RegExp(r'[^A-Za-z0-9]').hasMatch(password)
        ? 4
        : password.length >= 8
        ? 2
        : password.isEmpty
        ? 0
        : 1;

    return Scaffold(
      backgroundColor: AppColors.bgLight,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 26),
                const Text(
                  'Create your account',
                  style: TextStyle(
                    fontSize: 40,
                    height: 1.1,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: AppColors.navy,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Join OptiLife and tailor fitness & nutrition to your real life constraints.',
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      authBadge(
                        '◷  15-min routines',
                        const Color(0xFFD4F5F2),
                        AppColors.primaryTeal,
                      ),
                      const SizedBox(width: 10),
                      authBadge(
                        '♧  Budget-first meals',
                        const Color(0xFFE2E8FF),
                        const Color(0xFF43516A),
                      ),
                      const SizedBox(width: 10),
                      authBadge(
                        '⌂  No gear',
                        const Color(0xFFE2E8FF),
                        AppColors.primaryTeal,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                authFieldLabel('Full Name'),
                authInputField(
                  controller: _nameController,
                  hint: 'Your full name',
                  icon: Icons.person_outline_rounded,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Enter your name'
                      : null,
                ),
                const SizedBox(height: 15),
                authFieldLabel('Email address'),
                authInputField(
                  controller: _emailController,
                  hint: 'you@example.com',
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => (v == null || !v.contains('@'))
                      ? 'Enter a valid email address'
                      : null,
                ),
                const SizedBox(height: 15),
                authFieldLabel(
                  'Create Password',
                  strength == 4 ? 'Strong' : '',
                ),
                authInputField(
                  controller: _passwordController,
                  hint: 'At least 8 characters',
                  icon: Icons.lock_outline_rounded,
                  obscure: _obscurePassword,
                  onChanged: (_) => setState(() {}),
                  validator: (v) => (v == null || v.length < 8)
                      ? 'Use at least 8 characters'
                      : null,
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
                const SizedBox(height: 10),
                Row(
                  children: List.generate(
                    4,
                    (i) => Expanded(
                      child: Container(
                        height: 8,
                        margin: EdgeInsets.only(right: i == 3 ? 0 : 8),
                        decoration: BoxDecoration(
                          color: i < strength
                              ? AppColors.primaryGreen
                              : const Color(0xFFD9E0DC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Must be at least 8 characters with numbers & symbols.',
                  style: TextStyle(
                    color: Color(0xFF4B584D),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      activeColor: AppColors.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onChanged: (v) =>
                          setState(() => _acceptedTerms = v ?? false),
                    ),
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'I agree to the '),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                color: AppColors.primaryTeal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: ' & '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: AppColors.primaryTeal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: '.'),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF4B584D),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //     color: const Color(0xFFF0F2FF),
                //     borderRadius: BorderRadius.circular(18),
                //   ),
                //   child: const Row(
                //     children: [
                //       Icon(
                //         Icons.verified_user_outlined,
                //         color: Color(0xFF00834A),
                //       ),
                //       SizedBox(width: 12),
                //       Expanded(
                //         child: Text(
                //           'We respect your limits: zero rigid calorie counting or guilt trips.',
                //           style: TextStyle(
                //             fontSize: 16,
                //             height: 1.4,
                //             color: AppColors.navy,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 15),
                AuthPrimaryButton(
                  label: 'Create Account',
                  onPressed: () {
                    if (!_acceptedTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please accept the terms to continue.'),
                        ),
                      );
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      context.go(AppRouter.home);
                    }
                  },
                ),
                const SizedBox(height: 15),
                // Row(
                //   children: [
                //     const Expanded(child: Divider(color: Color(0xFFDDE3FF))),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 14),
                //       child: Text(
                //         'Or Register With',
                //         style: TextStyle(
                //           color: const Color(0xFF718071),
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ),
                //     const Expanded(child: Divider(color: Color(0xFFDDE3FF))),
                //   ],
                // ),

                // SizedBox(
                //   width: double.infinity,
                //   height: 68,
                //   child: OutlinedButton(
                //     onPressed: () {},
                //     style: OutlinedButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       foregroundColor: AppColors.navy,
                //       side: BorderSide.none,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(17),
                //       ),
                //     ),
                //     child: const Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //           'G',
                //           style: TextStyle(
                //             fontSize: 26,
                //             fontWeight: FontWeight.w800,
                //             color: Color(0xFF4285F4),
                //           ),
                //         ),
                //         SizedBox(width: 12),
                //         Text(
                //           'Sign up with Google',
                //           style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 17, color: AppColors.muted),
                      ),
                      TextButton(
                        onPressed: () => context.go(AppRouter.signin),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTeal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
