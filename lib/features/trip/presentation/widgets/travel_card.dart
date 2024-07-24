import 'package:flutter/material.dart';

class TravelCard extends StatelessWidget {
  const TravelCard({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.desc,
    required this.date,
    required this.location,
    required this.onDelete,
    this.maxWidth = 400,
  });

  final String imgUrl;
  final String title;
  final String desc;
  final String date;
  final String location;
  final VoidCallback onDelete;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: width > 700 ? 20 : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            date,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              location,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: IconButton(
                              onPressed: onDelete,
                              icon: const Icon(
                                Icons.delete_rounded,
                                size: 32,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: width > 500 ? 22 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                style: TextStyle(fontSize: width > 500 ? 18 : 14),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 800,
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Text(desc),
              ],
            ),
          ),
        );
      },
    );
  }
}
