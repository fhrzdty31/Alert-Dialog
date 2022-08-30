import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data = "Belum ada konfirmasi";

  // ignore: non_constant_identifier_names
  Icon ic_con = const Icon(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert Dialog"),
        actions: [
          ic_con,
          Container(
            width: 20,
          )
        ],
      ),
      body: Center(
          child: Text(
        data,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.confirmation_number),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Confirmation"),
                  content: const Text("Apakah anda ingin mengkonfirmasi?"),
                  actions: [
                    FlatButton(
                      child: const Text("Yes"),
                      onPressed: () {
                        setState(() {
                          data = "Telah Terkonfirmasi";
                        });
                        Navigator.of(context).pop(true);
                      },
                    ),
                    FlatButton(
                      child: const Text("No"),
                      onPressed: () {
                        setState(() {
                          data = "Konfirmasi Ditolak";
                        });
                        Navigator.of(context).pop(false);
                      },
                    )
                  ],
                );
              }).then((value) {
            if (value) {
              setState(() {
                ic_con = const Icon(Icons.done_outline_outlined);
              });
            } else {
              setState(() {
                ic_con = const Icon(null);
              });
            }
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
