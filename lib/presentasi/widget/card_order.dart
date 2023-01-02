import 'package:dotted_line/dotted_line.dart';
import 'package:e_kantin_delivery/const/main_app.dart';
import 'package:flutter/material.dart';

import '../../dummi.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    Key? key,
    required this.home,
    required this.statusPesanan,
    this.onTap,
  }) : super(key: key);

  final bool home;
  final StatusPesanan statusPesanan;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14)))),
      onPressed: onTap,
      child: Container(
        decoration: home == false && statusPesanan != StatusPesanan.dalamProses
            ? const BoxDecoration(
                color: Color(0xffE1BEE7),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)))
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (home == false && statusPesanan == StatusPesanan.sudahSelesai)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Text(
                  "No. Pesanan #12345",
                  style: TextStyle(fontSize: 11, color: fontBlack),
                ),
              ),
            if (home == false && statusPesanan == StatusPesanan.terjadwal)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Text(
                  "Terjadwal untuk 12.30 - 12.45",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: fontBlack),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: const Color(0xffBDBDBD))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            SizedBox(height: 8),
                            Text(
                              "RM. Restu Bundo Payakumbuoh",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: fontBlack),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (statusPesanan == StatusPesanan.sudahSelesai)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Tarif",
                              style: TextStyle(fontSize: 10, color: fontBlack),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Rp17.000",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: fontBlack),
                            ),
                          ],
                        ),
                      if (statusPesanan != StatusPesanan.sudahSelesai)
                        Image.asset(
                          "assets/icon/Group 46.png",
                          scale: 4,
                        ),
                      const SizedBox(width: 8),
                      if (statusPesanan == StatusPesanan.sudahSelesai)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Pesan Antar",
                              style: TextStyle(fontSize: 10, color: fontBlack),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "20 menit",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: fontBlack),
                            ),
                          ],
                        ),
                      if (statusPesanan != StatusPesanan.sudahSelesai)
                        Image.asset(
                          "assets/icon/Group 47.png",
                          scale: 4,
                        ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffEEEEEE),
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
                        const Expanded(
                          child: Text(
                            "RM. Restu Bundo Payakumbuoh",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: fontBlack),
                          ),
                        ),
                        const Text(
                          "10.40",
                          style: TextStyle(
                            color: Color(0xff9E9E9E),
                            fontSize: 12,
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
                      lineLength: 12,
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
                        const Expanded(
                          child: Text(
                            "Tower Sudirman, Lantai 5",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: fontBlack),
                          ),
                        ),
                        const Text(
                          "9.40",
                          style:
                              TextStyle(color: Color(0xff9E9E9E), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum StatusPesanan { dalamProses, sudahSelesai, terjadwal }
