import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../dummi.dart';

class PopUpPesanan extends StatelessWidget {
  const PopUpPesanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * .42,
        padding: const EdgeInsets.only(left: padding, right: padding, top: 14),
        color: const Color(0xffF5F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
            Row(
              children: [
                Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xffA3A2A3)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Tolak order",
                        style: TextStyle(
                            color: fontBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                ),
                const SizedBox(width: padding),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        backgroundColor: purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text(
                        "Ambil order",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )),
                ),
              ],
            )
          ],
        ));
  }
}
