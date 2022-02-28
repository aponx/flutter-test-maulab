import 'package:ajobthing/model/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Blog extends StatefulWidget {
  final Home? home;

  const Blog({Key? key, this.home}) : super(key: key);

  @override
  _BlogState createState() => _BlogState(home);
}

class _BlogState extends State<Blog> {
  final Home? home;
  _BlogState(this.home);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
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
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Text(home?.subtitle ?? '',
                  style: const TextStyle(
                      fontSize: 12.0
                  )
                ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Text(home?.content ?? '',
                  style: const TextStyle(
                      fontSize: 12.0
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
                    const Text('Author : ',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(home?.author ?? '',
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
                    const Text('Created At : ',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(DateFormat("dd MMMM yyyy").format(DateTime.fromMillisecondsSinceEpoch(home?.createAt ?? 0)),
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
                    const Text('Tag : ',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(home?.tag ?? '',
                      style: const TextStyle(
                          fontSize: 12.0
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
