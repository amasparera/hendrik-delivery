import 'package:flutter/material.dart';

import '../../const/main_app.dart';
import '../../const/navigasi.dart';
import '../../dummi.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          "Profilku",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: fontBlack,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Simpan",
              style: TextStyle(
                  color: Color(0xff4CAF50), fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 13)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Center(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(person),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          "assets/icon/Edit Square.png",
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: const [
                Text(
                  "Informasi Pribadi",
                  style:
                      TextStyle(color: fontBlack, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "*Wajib disini",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, bottom: 13),
              child: Text(
                "Nama Lengkap*",
                style: TextStyle(fontSize: 13),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                border: Border.all(width: 1, color: const Color(0xff9E9E9E)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                style: TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  hintStyle: TextStyle(color: Color(0xff767475), fontSize: 10),
                  hintText: "Nama lengkap",
                  border: InputBorder.none,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 13, bottom: 13),
              child: Text(
                "Alamat*",
                style: TextStyle(fontSize: 13),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                border: Border.all(width: 1, color: const Color(0xff9E9E9E)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                maxLines: 4,
                minLines: 4,
                style: TextStyle(fontSize: 13),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 6),
                  hintStyle: TextStyle(color: Color(0xff767475), fontSize: 10),
                  hintText: "Alamat",
                  border: InputBorder.none,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 13, bottom: 13),
              child: Text(
                "Nomor Telepon*",
                style: TextStyle(fontSize: 13),
              ),
            ),
            Row(
              children: [
                const Text("+62"),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 13),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      border:
                          Border.all(width: 1, color: const Color(0xff9E9E9E)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const TextField(
                      style: TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                        hintStyle:
                            TextStyle(color: Color(0xff767475), fontSize: 10),
                        hintText: "85xxxxx",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
