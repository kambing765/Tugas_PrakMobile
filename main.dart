import 'package:flutter/material.dart';

void main() {
  runApp(const Apkgw());
}

class Apkgw extends StatelessWidget {
  const Apkgw({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Log-In',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Login Tugas'),
      ),
      body: Padding(


      
      
      


        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('images/nauval_doge.jpg', height: 100, width: 100),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                  labelText: 'Username', hintText: 'Masukkan username disini'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: 'Password', hintText: 'Masukkan password disini'),
              obscureText:
                  true, // Tambahkan ini untuk menyembunyikan input password
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              onPressed: () {
                if (usernameController.text == 'Nauval Ghaina' &&
                    passwordController.text == '124220069') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Username/Password Salah!')),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Menu Utama'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.push(context, _createRoute(JumlahKurang()));
            },
            child: const Text("Penjumlahan Pengurangan"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.push(context, _createRoute(GanjilGenap()));
            },
            child: const Text("Ganjil Genap"),
          ),
        ],
      ),
    );
  }
}

//
Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(2.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}


class JumlahKurang extends StatefulWidget {
  @override
  _JumlahKurangState createState() => _JumlahKurangState();
}

class _JumlahKurangState extends State<JumlahKurang> {
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  double _result = 0;
  bool _sudahHitung = false;

  void _hitung(String operation) {
    double number1 = double.tryParse(_number1Controller.text) ?? 0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0;

    setState(() {
      switch (operation) {
        case 'Tambah':
          _result = number1 + number2;
          break;
        case 'Kurang':
          _result = number1 - number2;
          break;
        case 'Kali':
          _result = number1 * number2;
          break;
        case 'Bagi':
          _result = number2 != 0 ? number1 / number2 : double.infinity;
          break;
        default:
          break;
      }
      _sudahHitung = true;
    });
  }

  String _cekGanjilGenap(double number) {
    if (!_sudahHitung) {
      return 'Operasi belum dilakukan';
    } else if (number % 2 == 0) {
      return 'Hasil Genap';
    } else {
      return 'Hasil Ganjil';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Perhitungan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _number1Controller,
              decoration: const InputDecoration(labelText: 'Angka Pertama'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _number2Controller,
              decoration: const InputDecoration(labelText: 'Angka Kedua'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('Tambah'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('Kurang'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('Kali'),
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('Bagi'),
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Hasil: $_result',
              style: const TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(_cekGanjilGenap(_result)),
          ],
        ),
      ),
    );
  }
}

class GanjilGenap extends StatefulWidget {
  @override
  _GanjilGenapState createState() => _GanjilGenapState();
}

class _GanjilGenapState extends State<GanjilGenap> {
  final TextEditingController _numberOnlyController = TextEditingController();
  String _textHasil = 'Masukkan angka untuk mengecek';
  String _cekGanjilGenap() {
    double numberOnly = double.tryParse(_numberOnlyController.text) ?? 0;

    if (_numberOnlyController.text.isEmpty) {
      return 'Masukkan angka terlebih dahulu';
    } else if (numberOnly % 2 == 0) {
      return '$numberOnly adalah bilangan Genap';
    } else {
      return '$numberOnly adalah bilangan Ganjil';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Ganjil Genap'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberOnlyController,
              decoration: const InputDecoration(labelText: 'Masukkan angka'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _textHasil = _cekGanjilGenap();
                    });
                  },
                  child: const Text('Cek'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_textHasil),
          ],
        ),
      ),
    );
  }
}
