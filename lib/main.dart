import 'package:flutter/material.dart';
import 'package:todo_app/layout_sections.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              // Header bölümü
              getHeaderWidget(context),
              // Body bölümü (scroll edilebilir liste)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      16, 0, 16, 0), // Sağdan ve soldan 16 piksel boşluk
                  child: Card(
                    margin: EdgeInsets.all(0), // Card kenar boşluğunu kaldır
                    child: ListView.separated(
                      itemCount: 50, // Listede görüntülenen öğelerin sayısı
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 1, // Divider yüksekliği
                          color: Colors.grey,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Öğe $index'),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Footer bölümü
              ElevatedButton(
                onPressed: () {},
                child: Text("Deneme"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              // Container(
              //   height: 50.0,
              //   color: Colors.green,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text("Deneme"),
              //     style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10))),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
