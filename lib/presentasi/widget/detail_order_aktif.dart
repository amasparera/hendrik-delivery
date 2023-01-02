import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../dummi.dart';

class DetailOrderAktif extends StatelessWidget {
  const DetailOrderAktif({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        minChildSize: .3,
        maxChildSize: .97,
        initialChildSize: .46,
        builder: (contex, controller) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: ListView(
                padding: const EdgeInsets.only(
                    left: padding, right: padding, top: 12),
                controller: controller,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(person),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "John Doe",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: fontBlack),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Rp17.000",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: fontBlack),
                            ),
                            SizedBox(height: 1),
                            Text(
                              "Pesan antar makanan",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                  color: fontBlack),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        "assets/icon/Group 46.png",
                        scale: 4,
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        "assets/icon/Group 47.png",
                        scale: 4,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: Divider(
                      thickness: 2,
                      color: Color(0xffEEEEEE),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/lokasi.png",
                          width: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Lokasi kantin",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Color(0xff9E9E9E)),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "RM. Restu Bundo Payakumbuoh",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: fontBlack),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: DottedLine(
                      direction: Axis.vertical,
                      dashColor: Color(0xff9E9E9E),
                      lineLength: padding,
                      lineThickness: .5,
                      // dashGapLength: .5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icon/posisi.png",
                          width: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Lokasi kantor",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Color(0xff9E9E9E)),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Tower Sudirman, Lantai 5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: fontBlack),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: padding),
                ],
              ),
            ));
  }
}
