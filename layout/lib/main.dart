import 'package:flutter/material.dart';
import 'package:layout/pages/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Computer Knowledge",
      home: HomePage(),
      
    );
  }
}








// class MainPage extends StatefulWidget {
//   //const MainPage({ Key? key }) : super(key: key);

//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {

// int _currentIndex  = 0;
// final taps = [HomePage()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: taps[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.computer), label: "ความรู้ทั่วไป")
          
        
//           ],

//           onTap: (index){
//             setState(() {
//               print(index);
//               _currentIndex = index;
//             });
//           },
//         ),
//       );
//   }
// }


