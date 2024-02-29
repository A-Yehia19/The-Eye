import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_eye/Constants/Colors.dart';

import '../Data/variables.dart';

class UploadsList extends StatelessWidget {
  const UploadsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 529,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CupertinoColors.white,
          boxShadow: [
            BoxShadow(color: CupertinoColors.systemGrey4, spreadRadius: 3),
          ],
        ),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: uploads.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
                    child: Container(
                      height: 95,
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                              color: CupertinoColors.systemGrey4,
                              spreadRadius: 2),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(uploads[index].thumbnail),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 95,
                    width: 165,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Align(
                            alignment: Alignment.topRight,
                              child: Text(
                            uploads[index].status,
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(uploads[index].caption,
                                style:
                                    TextStyle(color: Colors.black87, fontSize: 13)),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              uploads[index].views.toString(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            Text(
                              " views",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              uploads[index].interactions.toString(),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            Text(
                              " interactions",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(thickness: 1, color: CupertinoColors.systemGrey4,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
