import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constants/app_sizes.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/constants/task_types.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/tasks/task.dart';
import 'package:todo_app/tasks/task_widgets.dart';

List<Task> todos = [
  Task(
    title: "Flutter",
    description: "flutter çalışmalarım",
    isCompleted: false,
    type: TaskType.note,
  ),
  Task(
    title: "Rust-Lang",
    description: "rust-lang çalışmalarım",
    isCompleted: false,
    type: TaskType.calender,
  ),
  Task(
    title: "Javascript",
    description: "javascript çalışmalarım",
    isCompleted: true,
    type: TaskType.contest,
  ),
  Task(
    title: "Algoritmalar",
    description: "algoritmalar çalışmalarım",
    isCompleted: false,
    type: TaskType.note,
  ),
  Task(
    title: "Veri Yapıları - Graf Teorisi",
    description:
        "özellikle graf teorisi üzerine ayrıntılı çalışmalar gerekiyor",
    isCompleted: false,
    type: TaskType.note,
  ),
  Task(
    title: "İleri seviye SQL",
    description:
        "ileri seviye SQL için indexleme üzerine detaylı çalışma yapmalıyız.",
    isCompleted: false,
    type: TaskType.contest,
  ),
  Task(
    title: "Tasarım Sistemi - UI/UX",
    description: "Tasarım Sistemi - UI/UX çalışmalarım",
    isCompleted: false,
    type: TaskType.calender,
  ),
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

Positioned prepareBodyWidget(List<Task> todos) => Positioned(
      top: 160,
      left: 16,
      right: 16,
      child: SizedBox(
        height: bodyHeightCalculate(todos.length),
        child: TaskList(
          todos: todos,
        ),
      ),
    );
