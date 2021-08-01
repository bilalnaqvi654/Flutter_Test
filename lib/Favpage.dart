import 'package:flutter/material.dart';
import 'package:fluttertask/DatabaseHelper.dart';
import 'package:fluttertask/Models/FavModel.dart';
import 'package:sizer/sizer.dart';

class Favourite extends StatefulWidget {
  // Future<List<FavouriteModel>> favList;
  // Favourite({required this.favList});

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  DBHelper dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: dbHelper.getFavs(),
      // initialData: List(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? new ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return _listItem(snapshot.data?[i]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  _listItem(FavouriteModel favs) {
    return SingleChildScrollView(
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        child: ListTile(
          onTap: () {
            //   print(searchList[index].strAlcoholic);
          },
          isThreeLine: true,
          leading: CircleAvatar(
            backgroundImage: NetworkImage('${favs.imageUrl}'),
          ),
          title: Row(
            children: [
              Row(
                children: [
                  Text(
                    favs.name,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // Flexible(
                  //   child: Container(
                  //     height: 2.h,
                  //     width: 4.w,
                  //     child: CheckboxListTile(
                  //       title: const Text('GeeksforGeeks'),
                  //       autofocus: false,
                  //       activeColor: Colors.green,
                  //       checkColor: Colors.white,
                  //       selected: _value,
                  //       value: _value,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _value = value!;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Checkbox(
                value: (favs.alchohlic == 'Alcoholic') ? true : false,
                onChanged: (newValue) {
                  //   if (searchList[index].strAlcoholic == 'Alcoholic') {
                  //     setState(() {
                  //       _value = true;
                  //       print(_value);
                  //     });
                  //   } else {
                  //     setState(() {
                  //       _value = false;
                  //     });
                  //   }
                  // });
                },
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              )
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  favs.description,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //ListTile(
    //   leading: CircleAvatar(
    //     backgroundImage: NetworkImage('${searchList[index].strDrinkThumb}'),
    //   ),
    //   title: Text('${searchList[index].strDrink} '),
    //   subtitle: Text(
    //     '${searchList[index].strInstructions} ....',
    //     maxLines: 1,
    //   ),
    //   trailing: Container(
    //     width: 1.w,
    //     child: Row(
    //       children: [
    //         Icon(Icons.favorite),
    //       ],
    //     ),
    //   ),
    // );
  }
}
