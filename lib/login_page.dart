import 'package:flutter/material.dart';
import 'package:pertemuan3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namacontroller, placeholder, isPassword){
    return TextField(
      controller: namacontroller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.2,
          ),
        ),
      ),
    );
  }

  _showDialog(pesan, alamat){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(pesan),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => alamat,
                    ),
                  );
                },
              )
            ],
          );
        }
    );
  }

  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        backgroundColor: Colors.black26,
      ),
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.network(
                'https://images.unsplash.com/photo-1725714835781-5bd067b81a8c?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ),
            ),
          ),
          // Container with TextField in the center
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0), // Padding for the Container
              width: 300, // Set width of the container
              height: 250, // Set height of the container
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),

              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _showInput(_usernameController, 'Masukkan Username', false),
                  const SizedBox(height: 16),
                  _showInput(_passwordController, 'Masukkan Password', true),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue.shade500),
                    ),
                    child: const Text('Login', style: TextStyle(color: Colors.white)),
                    onPressed: (){
                      if(_usernameController.text == 'admin' && _passwordController.text == 'admin'){
                        _saveUsername();
                        _showDialog('Anda Berhasil Login', const HomePage());
                      } else {
                        _showDialog('Username dan Password salah', const LoginPage());
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}