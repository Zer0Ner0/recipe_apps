import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'signin_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          children: [
            const SizedBox(height: 20),
            const Text(
              'Create an account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Let's help you set up your account, it won't take long.",
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'Poppins',
                color: Color(0xFF121212),
              ),
            ),
            const SizedBox(height: 30),

            _buildTextField(label: 'Name', hint: 'Enter Name'),
            const SizedBox(height: 20),
            _buildTextField(label: 'Email', hint: 'Enter Email'),
            const SizedBox(height: 20),
            _buildTextField(label: 'Password', hint: 'Enter Password', obscure: true),
            const SizedBox(height: 20),
            _buildTextField(label: 'Confirm Password', hint: 'Retype Password', obscure: true),
            const SizedBox(height: 20),

            Row(
              children: [
                Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: const Color(0xFFFF9B00)),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Accept terms & Condition',
                  style: TextStyle(
                    color: Color(0xFFFF9B00),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF119475),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {},
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 30),

            const Row(
              children: [
                Expanded(child: Divider(color: Color(0xFFD9D9D9))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or Sign in With',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Color(0xFFD9D9D9))),
              ],
            ),
            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIcon(path: 'images/icons_google.png'),
                SizedBox(width: 30),
                _SocialIcon(path: 'images/fb.png'),
              ],
            ),
            const SizedBox(height: 30),

            Center(
              child: Text.rich(
                TextSpan(
                  text: 'Already a member? ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontFamily: 'Poppins',
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: const TextStyle(
                        color: Color(0xFFFF9B00),
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const SignIn()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF121212),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscure,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 11,
              color: Color(0xFFD9D9D9),
              fontFamily: 'Poppins',
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color(0xFFD9D9D9), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final String path;

  const _SocialIcon({required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(path)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19696969),
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
      ),
    );
  }
}
