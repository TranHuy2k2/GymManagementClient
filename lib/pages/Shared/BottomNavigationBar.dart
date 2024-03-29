import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/pages/Stats/Stats.Page.dart';

import '../Home/MyHomepage.dart';
import '../Invoices/InvoicesPage.dart';
import '../Users/UsersPage.dart';
class AppBarShared extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      backgroundColor: Colors.indigo,
      title: const Text("Trần Huy Gym"),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class BottomNavigationShared extends StatelessWidget {
   BottomNavigationShared({super.key, this.currentIndex});
  int? currentIndex;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (
        BottomNavigationBar(
          backgroundColor: Colors.indigo,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'Phiếu Lập',
              backgroundColor: Colors.indigo,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Phòng Tập',
              backgroundColor: Colors.indigo,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Thống Kê',
              backgroundColor: Colors.indigo,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Quản Trị',
              backgroundColor: Colors.indigo,
            ),
          ],
          currentIndex: currentIndex ?? 0,
          selectedItemColor: Colors.white,
          onTap: (int currentIdx){
            switch(currentIdx) {
              case 0:
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => InvoicesPage()),
                    ModalRoute.withName('/invoices'));
                break;
              case 1:
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => MyHomePage(title: "Trần Huy Gym")),
                    ModalRoute.withName('/home'));
                break;
              case 2:
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) => StatsPage(title: "Trần Huy Gym")),
                    ModalRoute.withName('/invoices'));
                break;
              case 3:
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) => UsersPage(),
                ), ModalRoute.withName('/invoices')
                );
                break;
            }
          },
        )
    );
  }

}