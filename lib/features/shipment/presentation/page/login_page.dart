import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_shipment_tracker_day9/features/shipment/presentation/controller/auth_controller.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = Get.find<AuthController>();
  bool obscure = true;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1D2671), Color(0xffC33764)],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: Card(
                  elevation: 10,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(25),

                    child: Form(
                      key: formKey,

                      child: Column(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          const Icon(Icons.local_shipping, size: 70),

                          const SizedBox(height: 15),

                          const Text(
                            "Shipment Tracker",

                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Welcome Back",

                            style: TextStyle(color: Colors.grey),
                          ),

                          const SizedBox(height: 30),

                          TextFormField(
                            controller: emailController,

                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "Enter email";
                              }

                              return null;
                            },

                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.email),

                              hintText: "Email",

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          TextFormField(
                            controller: passwordController,

                            obscureText: obscure,

                            validator: (v) {
                              if (v == null || v.length < 4) {
                                return "Enter password";
                              }

                              return null;
                            },

                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),

                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },

                                icon: Icon(
                                  obscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),

                              hintText: "Password",

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,

                            height: 55,

                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),

                              onPressed: () async {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }

                                setState(() {
                                  loading = true;
                                });

                                await Future.delayed(
                                  const Duration(seconds: 1),
                                );

                                auth.login();

                                setState(() {
                                  loading = false;
                                });

                                Get.off(() => HomePage());
                              },

                              child: loading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Login",
                                      style: TextStyle(fontSize: 18),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          TextButton(
                            onPressed: () {},

                            child: const Text("Forgot Password?"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
