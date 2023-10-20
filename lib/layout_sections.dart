import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/app_sizes.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/custom_widgets/task_list.dart';

Widget getHeaderWidget(BuildContext context) => Container(
      width: getDeviceWidth(
        context,
      ), // bu bana telefonun tüm genişliğini sağlayacak bir ölçü verecek
      height: getDeviceHeight(
            context,
          ) /
          3, // burada da ekranın 1/3 lük kısmını sağlayacak yükseklik değerini verecek
      decoration: BoxDecoration(
        color: HexColor(primaryColor),
        image: const DecorationImage(
            image: AssetImage("lib/assets/images/header.png"),
            fit: BoxFit.cover),
      ),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "Ekim 19, 2023",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              "Yapılacaklar Listem",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );

Positioned getTopColumnWidget(BuildContext context) => Positioned(
      top: 158,
      left: 16,
      right: 16,
      child: Card(
        child: Column(children: [
          ListTile(
            title: Text('Başlık'),
          ),
          Expanded(child: buildTaskList(context))
        ]),
      ),
    );

Padding getComplatedTextWidget() => const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Tamamlananlar",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );

Expanded getBottomColumnWidget(
        {required Function(VoidCallback) setState,
        required Function(bool?)? onChanged,
        required bool isChecked}) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.notes_rounded,
                        size: 50,
                      ),
                      const Text(
                        "Ders çalışmak",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: onChanged,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.notes_rounded,
                        size: 50,
                      ),
                      const Text(
                        "Ders çalışmak",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: onChanged,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.notes_rounded,
                        size: 50,
                      ),
                      const Text(
                        "Ders çalışmak",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: onChanged,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.notes_rounded,
                        size: 50,
                      ),
                      const Text(
                        "Ders çalışmak",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: onChanged,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.notes_rounded,
                        size: 50,
                      ),
                      const Text(
                        "Ders çalışmak",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: onChanged,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.notes_rounded,
                        size: 50,
                      ),
                      const Text(
                        "Ders çalışmak",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: onChanged,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

Container bottomContainer = Container(
  alignment: Alignment.bottomCenter,
  child: ElevatedButton(
    onPressed: () {},
    child: const Text("Yeni Görev Ekle"),
  ),
);
