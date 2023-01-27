import 'package:animate_do/animate_do.dart';
import 'package:e_kantin_delivery/const/main_app.dart';
import 'package:e_kantin_delivery/const/navigasi.dart';
import 'package:e_kantin_delivery/presentasi/controller/home_controller.dart';
import 'package:e_kantin_delivery/presentasi/controller/profile_controller.dart';
import 'package:e_kantin_delivery/presentasi/page/profile_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/request_datate.dart';
import '../widget/card_order.dart';
import '../widget/detail_order_aktif.dart';
import 'riwayat_pesanan_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<ProfileController>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: Container(
                margin: const EdgeInsets.only(
                    left: padding, right: padding, top: 8, bottom: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color(0xffF3E5F5),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          toPageCupertino(context, const Profileview()),
                      child: Hero(
                        tag: "avatar",
                        child: Consumer<ProfileController>(
                            builder: (context, c, _) {
                          return c.reqProfile == RequestState.empty
                              ? CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: c.imageError ||
                                          c.userModel == null
                                      ? null
                                      : NetworkImage(c.userModel!.photoProfile),
                                  onBackgroundImageError:
                                      c.imageError || c.userModel == null
                                          ? null
                                          : (exception, stackTrace) {
                                              if (kDebugMode) {
                                                print(
                                                    "Error loading image! $exception");
                                              }

                                              c.setError();
                                            },
                                  child: c.imageError || c.userModel == null
                                      ? const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      : null)
                              : const CircleAvatar(
                                  backgroundColor: bg,
                                  child: CircularProgressIndicator(
                                    color: purple,
                                  ),
                                );
                        }),
                      ),
                    ),
                    const Spacer(),
                    Consumer<HomeController>(builder: (co, c, _) {
                      return Container(
                        // padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: const Color(0xffE1BEE7),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            Text(
                              c.online ? "Online" : "Offline",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Switch(
                              value: c.online,
                              onChanged: (value) {
                                c.swithOnline(value, co);
                              },
                              activeColor: const Color(0xff6200EE),
                              focusColor: const Color(0xff6200EE),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
                top: 2,
                bottom: 2,
              ),
              child: Text(
                "Ringkasan pendapatan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
                top: 4,
              ),
              child: Text(
                "Rp 1.200.000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
                top: 2,
              ),
              child: Text(
                "Oktober",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Color(0xffA9A9A9)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Consumer<HomeController>(builder: (context, c, _) {
                  return AnimatedSwitcher(
                    duration: const Duration(seconds: 3),
                    switchInCurve: Curves.bounceIn,
                    child: c.online
                        ? Image.asset(
                            "assets/image/Wavy Buddies Order Shipped.png",
                            scale: 4.1,
                          )
                        : Image.asset(
                            "assets/image/Wavy Buddies Track Your Package.png",
                            scale: 4.1,
                          ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .42,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: padding, right: padding),
                    child: Text("Riwayat pesanan",
                        style: mainStyle.copyWith(fontSize: 15)),
                  ),
                  Transform.translate(
                    offset: const Offset(-14, 0),
                    child: Container(
                      margin: const EdgeInsets.only(left: padding),
                      alignment: Alignment.centerLeft,
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
                        indicatorPadding: EdgeInsets.all(0),
                        indicatorWeight: 0,
                        labelStyle: TextStyle(
                            color: fontBlack,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        indicator: UnderlineTabIndicator(
                            borderSide:
                                BorderSide(width: 3, color: Color(0xffAB47BC)),
                            insets:
                                EdgeInsets.only(left: 0, right: 20, bottom: 0)),

                        tabs: [
                          Tab(text: "Sudah selesai"),
                          Tab(text: "Dalam proses"),
                          Tab(text: "Terjadwal"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  "Hari ini",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CardOrder(
                                home: true,
                                statusPesanan: StatusPesanan.sudahSelesai,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  "Hari ini",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Builder(builder: (context) {
                                return CardOrder(
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (cb) =>
                                            const DetailOrderAktif());
                                  },
                                  home: true,
                                  statusPesanan: StatusPesanan.dalamProses,
                                );
                              }),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  "Hari ini",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              CardOrder(
                                home: true,
                                statusPesanan: StatusPesanan.terjadwal,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: padding),
                      child: InkWell(
                        onTap: () {
                          toPageCupertino(context, const RiwayatPesananView());
                        },
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Text(
                            "Lihat detail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffBA68C8),
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
