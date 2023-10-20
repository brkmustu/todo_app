import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/app_sizes.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/custom_widgets/task_list.dart';
import 'package:todo_app/screens/add_new_task.dart';

List<TaskModel> todos = [
  TaskModel("Flutter", false),
  TaskModel("Rust-Lang", false),
  TaskModel("Javascript", true),
  TaskModel("Algoritmalar", false),
  TaskModel("Veri Yapıları", false),
  TaskModel("Agile Metodoloji", false),
  TaskModel("Tasarım Sistemi", false),
  TaskModel("SQL", true)
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Stack(
            // fit: StackFit.loose,
            children: [
              // Header
              prepareHeaderWidget(context),
              // Body
              prepareBodyWidget(todos),
              // Footer
              // footerWidget
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: SizedBox(
                    height: 56,
                    width: getDeviceWidth(context),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddNewTaskScreen(),
                        ));
                      },
                      child: const Text("Yeni Görev Ekle"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          HexColor(primaryColor),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget prepareHeaderWidget(BuildContext context) => Container(
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

double bodyHeightCalculate(int adet) {
  if (adet > 0 && adet < 7) {
    return adet * 85;
  } else if (adet >= 7) {
    return 6 * 85;
  } else {
    return 85;
  }
}

Positioned prepareBodyWidget(List<TaskModel> todos) => Positioned(
      top: 160,
      left: 16,
      right: 16,
      child: SizedBox(
        height: bodyHeightCalculate(todos.length),
        child: TaskList(
          name: "Yapılacaklar",
          todos: todos,
        ),
      ),
    );
