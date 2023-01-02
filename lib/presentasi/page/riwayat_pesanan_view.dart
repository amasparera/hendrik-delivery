import 'package:e_kantin_delivery/presentasi/page/riwayat_selesai_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../widget/card_order.dart';

class RiwayatPesananView extends StatelessWidget {
  const RiwayatPesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
            "Riwayat pesanan",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: fontBlack,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, -6),
              child: const TabBar(
                dragStartBehavior: DragStartBehavior.start,
                isScrollable: true,
                // labelPadding: EdgeInsets.only(right: 8),
                padding: EdgeInsets.zero,
                labelColor: fontBlack, physics: ScrollPhysics(),
                indicatorColor: purple,

                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Color(0xffBDBDBD),
                // labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.all(0), indicatorWeight: 0,
                labelStyle: TextStyle(
                    color: fontBlack,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: Color(0xffAB47BC)),
                    insets: EdgeInsets.only(left: 0, right: 20, bottom: 0)),

                tabs: [
                  Tab(text: "Dalam proses"),
                  Tab(text: "Sudah selesai"),
                  Tab(text: "Terjadwal"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            "Hari ini",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        CardOrder(
                          home: false,
                          statusPesanan: StatusPesanan.dalamProses,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            "Hari ini",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        CardOrder(
                          onTap: () {
                            toPageCupertino(
                                context, const RIwayatSelesaiView());
                          },
                          home: false,
                          statusPesanan: StatusPesanan.sudahSelesai,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            "Hari ini",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        CardOrder(
                          home: false,
                          statusPesanan: StatusPesanan.terjadwal,
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
