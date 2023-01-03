import 'package:dotted_line/dotted_line.dart';
import 'package:e_kantin_delivery/presentasi/widget/main_button.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../dummi.dart';
import 'list_harga.dart';

class DetailOrderAktif extends StatefulWidget {
  const DetailOrderAktif({super.key});

  @override
  State<DetailOrderAktif> createState() => _DetailOrderAktifState();
}

class _DetailOrderAktifState extends State<DetailOrderAktif> {
  late DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    _draggableScrollableController = DraggableScrollableController();
    _draggableScrollableController.addListener(() {
      if (_draggableScrollableController.pixels < 341.00) {
        setState(() {
          open = true;
        });
      } else {
        setState(() {
          open = false;
        });
      }
      print(_draggableScrollableController.pixels.toStringAsFixed(0));
    });
    super.initState();
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    super.dispose();
  }

  bool open = true;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        controller: _draggableScrollableController,
        minChildSize: .36,
        maxChildSize: .89,
        initialChildSize: .46,
        // snap: true,
        // expand: true,
        builder: (contex, controller) => Container(
              decoration: BoxDecoration(
                  color: open ? const Color(0xffF5F5F5) : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: ListView(
                padding: const EdgeInsets.only(
                    left: padding, right: padding, top: 12),
                controller: controller,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: padding,
                      height: 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffbdbdbd)),
                    ),
                  ),
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
                  if (open)
                    MainButton(
                      symetry: 0,
                      onPress: () {},
                      text: "Antar Pesanan",
                    ),
                  if (open == false)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        const Text(
                          "Pesanan",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        const ListHarga(
                          quantity: "1",
                          text: "Nasi Rendang Daging",
                        ),
                        const ListHarga(
                          quantity: "2",
                          text: "Nasi Empati Hati",
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Detail pembayaran",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(height: 10),
                        const ListHarga(
                          quantity: "Rp15.000",
                          text: "Harga",
                        ),
                        const ListHarga(
                          quantity: "Rp2.000",
                          text: "Ongkir",
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: DottedLine(
                            dashColor: Color(0xffEEEEEE),
                          ),
                        ),
                        const ListHarga(
                          quantity: "Rp20.000",
                          text: "Total",
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: DottedLine(
                            dashColor: Color(0xffEEEEEE),
                          ),
                        ),
                        const ListHarga(
                          quantity: "Rp20.000",
                          text: "Bayar dengan tunai",
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        const Text(
                          "Catatan pembeli",
                          style: TextStyle(
                              color: Color(0xffF44336),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "titip ke satpan PT. viscode.id ya mas",
                          style: TextStyle(fontSize: 11),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Center(
                            child: Text(
                              "No. Pesanan #12345",
                              style: TextStyle(
                                  color: Color(0xffBDBDBD), fontSize: 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: const Color(0xffFFEBEE)),
                              onPressed: () {},
                              child: const Text(
                                "Batalkan Pesanan",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Color(0xffF44336)),
                              )),
                        ),
                        const SizedBox(height: padding),
                      ],
                    )
                ],
              ),
            ));
  }
}
