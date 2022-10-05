import 'package:flutter/material.dart';

class ReclamationCard extends StatefulWidget {
  const ReclamationCard({super.key});

  @override
  _ReclamationCardState createState() => _ReclamationCardState();
}

class _ReclamationCardState extends State<ReclamationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xffeeeeee), //<-- SEE HERE
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.white24,
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.lightbulb,
                      color: Color(0xffffc107),
                    ),
                    Text(
                      "Electricite",
                      style: TextStyle(
                          color: Color(0xffffc107),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Text("Categorie")
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                maxLines: 2,
                "longTextFr",
                textAlign: TextAlign.left,
                style: TextStyle(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Divider(
              color: Color(0xffebe9ea),
              thickness: 1,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  decoration: BoxDecoration(
                      color: const Color(0xffe3e5f2),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: const Text(
                    "20/05/2022",
                    style: TextStyle(
                      color: Color(0xff0e0f49),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                        color: const Color(0xfffff8e7),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.timelapse_outlined,
                          color: Color(0xffecae52),
                        ),
                        Text(
                          "En Cours",
                          style: TextStyle(
                            color: Color(0xffecae52),
                          ),
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
