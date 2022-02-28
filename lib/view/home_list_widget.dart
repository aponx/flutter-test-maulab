import 'package:ajobthing/model/home.dart';
import 'package:ajobthing/view/blog.dart';
import 'package:ajobthing/view/candidate.dart';
import 'package:ajobthing/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeListWidget extends StatefulWidget {
  final List<Home> _homeList;
  final Function _function;

  HomeListWidget(this._homeList, this._function);

  @override
  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  Widget _buildContentItem(Home home) {
    return GestureDetector(
      onTap: (){
        if(home.type == "candidate"){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Candidate(home: home)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Blog(home: home)));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 75,
                height: 75,
                child: Image.network(home.photo ?? ''),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      home.name ?? '',
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      home.type == 'candidate' ? (home.gender ?? '') : (home.author ?? ''),
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      home.type == 'candidate' ? DateFormat("dd MMMM yyyy").format(DateTime.fromMillisecondsSinceEpoch(home.birthday!)) : (home.subtitle ?? ''),
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget._homeList.length,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            Home data = widget._homeList[index];
            return InkWell(
              onTap: () {
                if (null != data.name) {
                  widget._function(data);
                }
              },
              child: _buildContentItem(data),
            );
          },
        ),
      ]),
    );
  }
}
