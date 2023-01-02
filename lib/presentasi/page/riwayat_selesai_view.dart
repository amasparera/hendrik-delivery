import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../dummi.dart';
import '../widget/list_harga.dart';

class RIwayatSelesaiView extends StatelessWidget {
  const RIwayatSelesaiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: fontBlack,
            size: 20,
          ),
          onPressed: () => closePage(context),
        ),
        title: const Text(
          "No. Pesanan #12345",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: fontBlack,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: padding, right: padding),
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.only(right: 12, top: 4, bottom: 4),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.network(
                  person,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "John Doe",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: fontBlack),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Rp20.000",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Divider(
              thickness: 2,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            // color: Colors.red,
            // height: 40,
            width: double.infinity,
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
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff9E9E9E)),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "RM. Restu Bundo Payakumbuoh",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: DottedLine(
              direction: Axis.vertical, dashColor: Color(0xff9E9E9E),
              lineLength: 12,
              lineThickness: .5,
              // dashGapLength: .5,
            ),
          ),
          SizedBox(
            // color: Colors.red,
            // height: 40,
            width: double.infinity,
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
                        "Lokasi Kantor",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff9E9E9E)),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Tower Sudirman,Lantai 5",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              thickness: 2,
            ),
          ),
          const Text(
            "Pesanan",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 10),
          ...List.generate(
              3,
              (index) => Row(
                    children: const [
                      Expanded(
                          child: Text(
                        "Nasi Rendang Daging",
                        style: TextStyle(fontSize: 12),
                      )),
                      Text(
                        "1",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  )),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              thickness: 2,
            ),
          ),
          const Text(
            "Detail pembayaran",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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
          const SizedBox(height: padding),
          const Center(
              child: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Text(
              "Rating dari pelanggan",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )),
          Center(
            child: RatingBarIndicator(
              rating: 4,
              // initialRating: 3,
              // minRating: 1,
              direction: Axis.horizontal,
              // allowHalfRating: true,
              itemCount: 5,
              // glow: false,
              unratedColor: Colors.grey.shade200,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star_purple500_sharp,
                color: Colors.amber,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Text(
              "Kritik dan saran:  Lorem ipsum dolorsit ame",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
