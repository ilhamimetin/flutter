import 'package:flutter/material.dart';
import 'package:listeler/models/elemanlar_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ElemanlarModel> elemanlar = [
    ElemanlarModel("Başlık 1", "Alt Başlık 1"),
    ElemanlarModel("Başlık 2", "Alt Başlık 2"),
    ElemanlarModel("Başlık 3", "Alt Başlık 3"),
    ElemanlarModel("Başlık 4", "Alt Başlık 4"),
    ElemanlarModel("Başlık 5", "Alt Başlık 5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: elemanlar.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(elemanlar[index].title),
          subtitle: Text("Eleman ${index + 1}"),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.arrow_forward_ios),
          tileColor: Colors.amber.shade100,
          onTap: () {
            print(elemanlar[index].subTitle);
          },
        ),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, color: Colors.grey),
      ), //8.yöntem
    );
  }
}


/*
class _HomeScreenState extends State<HomeScreen> {
  List isimler = [
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: isimler.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(isimler[index]),
          subtitle: Text("Eleman ${index + 1}"),
          leading: Icon(Icons.person),
          trailing: Icon(Icons.arrow_forward_ios),
          tileColor: Colors.amber.shade100,
          onTap: () {
            print(isimler[index]);
          },
        ),
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, color: Colors.grey),
      ), //8.yöntem
    );
  }
}
*/


/*
class _HomeScreenState extends State<HomeScreen> {
  List isimler = [
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli",
    "ilhami",
    "metin",
    "ali",
    "veli"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     title: Text('Listeler'),
      //   ),
      body: SingleChildScrollView(
        child: Column(
          // children: isimler.map((isim) => Text(isim)).toList(), // 1. Yöntem

          /*children: [for (var isim in isimler) Text(isim),],*/ // 2. Yöntem

          /*children: isimler
              .map(
                (isim) => Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  color: Colors.blue,
                  child: Text(isim),
                ),
              )
              .toList(),*/ // 3. Yöntem

        //   children: List.generate(
        //     isimler.length,
        //     (index) => Container(
        //       padding: EdgeInsets.all(20),
        //       margin: EdgeInsets.all(20),
        //       color: Colors.yellow,
        //       child: Text(isimler[index]),
        //     ),
        //   ), // 4. Yöntem
        ),
      ),
    );
  }
}


*/

// 
//   ListView(
        //     children: List.generate(
        //       isimler.length,
        //       (isim) => Container(
        //         padding: EdgeInsets.all(20),
        //         margin: EdgeInsets.all(20),
        //         color: Colors.lightBlue,
        //         child: Text(isimler[isim]),
        //       ),
        //     ),
        //   ), //5. Yöntem
//    ListView.builder(
        //   itemCount: isimler.length,
        //   itemBuilder: (context, index) => Container(
        //     padding: EdgeInsets.all(10),
        //     margin: EdgeInsets.all(10),
        //     color: Colors.lightBlue,
        //     child: Text(
        //       isimler[index],
        //     ),
        //   ), // 6. Yöntem

        


// ListView.builder(
//         itemCount: isimler.length,
//         itemBuilder: (context, index) => Column(
//           children: [
//             ListTile(
//               title: Text(isimler[index]),
//               leading: Icon(Icons.person),
//               trailing: Icon(Icons.arrow_forward_ios),
//               tileColor: Colors.amber.shade100,
//               onTap: () {
//                 print(isimler[index]);
//               },
//             ),
//             Divider(
//               height: 1,
//               color: Colors.black,
//             )
//           ],
//         ),
//       ),
//     ); // 7. Yöntem
//   }
