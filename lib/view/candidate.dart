import 'package:ajobthing/model/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Candidate extends StatefulWidget {
  final Home? home;
  const Candidate({Key? key, this.home}) : super(key: key);

  @override
  _CandidateState createState() => _CandidateState(home);
}

class _CandidateState extends State<Candidate> {
  final Home? home;
  _CandidateState(this.home);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Candidate"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Image.network(home?.photo ?? ''),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(home?.name ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Row(
                children: [
                  const Text('Gender : ',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(home?.gender ?? '',
                    style: const TextStyle(
                      fontSize: 12.0
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Row(
                  children: [
                    const Text('Birthday : ',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat("dd MMMM yyyy").format(DateTime.fromMillisecondsSinceEpoch(home?.birthday ?? 0)),
                      style: const TextStyle(
                          fontSize: 12.0
                      ),
                    ),
                  ],
                )
            ),
            const SizedBox(
              height: 3.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Row(
                  children: [
                    const Text('Expired : ',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat("dd MMMM yyyy").format(DateTime.fromMillisecondsSinceEpoch(home?.expired ?? 0)),
                      style: const TextStyle(
                          fontSize: 12.0
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
