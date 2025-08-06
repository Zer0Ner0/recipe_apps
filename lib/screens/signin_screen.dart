import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            const SizedBox(height: 60),
            const Text(
              'Hello,',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                color: Color(0xFF121212),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),

            // Email Field
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF121212),
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              style: const TextStyle(color: Colors.black), // ✅ Black input text
              decoration: InputDecoration(
                hintText: 'Enter Email',
                hintStyle: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFFD9D9D9),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Password Field
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF121212),
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.black), // ✅ Black input text
              decoration: InputDecoration(
                hintText: 'Enter Password',
                hintStyle: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFFD9D9D9),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFD9D9D9),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.orange.shade600,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Sign In Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF119475),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text(
                'SIGN IN',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 40),

            // OR Divider
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or Sign in With',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFFD9D9D9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Social Icons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIcon(path: 'images/icons_google.png'),
                SizedBox(width: 30),
                _SocialIcon(path: 'images/fb.png'),
              ],
            ),
            const SizedBox(height: 30),

            // Sign Up Link
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign up',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFFFF9B00),
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const SignUp()),
                          );
                        },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
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
