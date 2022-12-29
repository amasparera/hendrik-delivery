import 'package:animate_do/animate_do.dart';
import 'package:e_kantin_delivery/const/main_app.dart';
import 'package:e_kantin_delivery/const/navigasi.dart';
import 'package:e_kantin_delivery/dummi.dart';
import 'package:e_kantin_delivery/presentasi/page/edit_profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                delay: const Duration(milliseconds: 500),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: const Color(0xffF3E5F5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          toPage(context, const EditProfile());
                        },
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(person),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        // padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: const Color(0xffE1BEE7),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            const Text(
                              "Offline",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Switch(
                              value: true,
                              onChanged: (value) {},
                              activeColor: const Color(0xff6200EE),
                              focusColor: const Color(0xff6200EE),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                "Ringkasan pendapatan",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "Rp 1.200.000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              const Text(
                "Oktober",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color(0xffA9A9A9)),
              ),
              Center(
                child: Image.asset(
                  "assets/image/Wavy Buddies Track Your Package.png",
                  scale: 4,
                ),
              ),
              Text("Riwayat pesanan", style: mainStyle.copyWith(fontSize: 15)),
              Transform.translate(
                offset: const Offset(-14, 0),
                child: Container(
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
                    indicatorPadding: EdgeInsets.all(0), indicatorWeight: 0,
                    labelStyle: TextStyle(
                        color: fontBlack,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(width: 3, color: Color(0xffAB47BC)),
                        insets: EdgeInsets.only(left: 0, right: 20, bottom: 0)),

                    tabs: [
                      Tab(text: "Sudah selesai"),
                      Tab(text: "Dalam proses"),
                      Tab(text: "Terjadwal"),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                Column(
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
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1, color: const Color(0xffBDBDBD))),
                      child: Column(
                        children: [Row()],
                      ),
                    ),
                  ],
                ),
                const Text("2"),
                const Text("3"),
              ]))
            ],
          ),
        )),
      ),
    );
  }
}
