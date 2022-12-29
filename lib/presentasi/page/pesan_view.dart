import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../dummi.dart';

class PesanView extends StatefulWidget {
  const PesanView({super.key});

  @override
  State<PesanView> createState() => _PesanViewState();
}

class _PesanViewState extends State<PesanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0xffBFBFBF),
        elevation: 1,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: fontBlack,
            size: 20,
          ),
          onPressed: () => closePage(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(person),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Jade Filtrer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: fontBlack),
                ),
                Text(
                  "office boy",
                  style: TextStyle(fontSize: 11, color: fontBlack),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: Image.asset(
                "assets/icon/Stroke 5.png",
                scale: 4,
              )),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            padding:
                const EdgeInsets.symmetric(horizontal: padding, vertical: 12),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: padding),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xffEEEEEE)),
                    child: const Text(
                        "Halo, untuk pengantarannya sudah sesuai ya, kak?"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 12),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icon/readed.png",
                          scale: 4,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "10:14 am",
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff818181)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: padding),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xffEEEEEE)),
                    child: const Text("Sudah, kak. Nanti taruh atas aja kak"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "10:14 am",
                          style:
                              TextStyle(fontSize: 10, color: Color(0xff818181)),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          "assets/icon/unread.png",
                          scale: 4,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
          Container(
            padding: const EdgeInsets.only(left: padding, bottom: 12, top: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      minLines: 1,
                      maxLines: 4,
                      scribbleEnabled: false,
                      style: TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                        hintStyle:
                            TextStyle(color: Color(0xff767475), fontSize: 13),
                        hintText: "Ketik pesan",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                    style: IconButton.styleFrom(
                        minimumSize: const Size(10, 10),
                        padding: const EdgeInsets.all(0)),
                    splashRadius: 20,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xff20191B),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
