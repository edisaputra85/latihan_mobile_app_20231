import 'package:flutter/material.dart';
import 'package:mdc_101/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Image(image: AssetImage("assets/diamond.png")),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "SHRINE",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      //filled: true,
                      labelText: "Username",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      //filled: true,
                      labelText: "Password",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OverflowBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _usernameController.clear();
                        _passwordController.clear();
                      },
                      child: const Text("CANCEL"),
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_usernameController.text == "admin" &&
                              _passwordController.text == "admin") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Login Sukses"),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.pushNamed(context, '/home');
                            /*
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                            */
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Login gagal"),
                              backgroundColor: Colors.red,
                            ));
                            _usernameController.clear();
                            _passwordController.clear();
                          }
                        },
                        child: const Text("NEXT")),
                  ],
                ),
              ),
            ],
          ),
        ),

        /*
              
              TextField(),
              TextField(),
              TextButton(onPressed: onPressed, child: child),
              ElevatedButton(onPressed: onPressed, child: child),
              */
      ),
    );
  }
}
