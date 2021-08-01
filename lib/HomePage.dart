import 'dart:convert';
import 'dart:async';
import 'dart:io' as Io;
import 'package:image/image.dart';

import 'package:flutter/material.dart';
import 'package:fluttertask/DatabaseHelper.dart';
import 'package:fluttertask/Models/FavModel.dart';
import 'package:fluttertask/Models/SearchModel.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Drinks> searchList = [];
  TextEditingController mycontroller = new TextEditingController();
  bool isLoading = false;

  var _groupValue = -1;

  int value = 0;
  int value2 = 1;

  double width = 0.0;
  double height = 0.0;
  DBHelper dbHelper = DBHelper();
  bool _value = true;
  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    width = queryData.size.width;
    height = queryData.size.height;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: RadioListTile(
                  value: value,
                  groupValue: _groupValue,
                  onChanged: (_) {
                    setState(() {
                      _groupValue = value;
                      print(_groupValue);
                    });
                  },
                  title: Text("By name"),
                ),
              ),
              Flexible(
                child: RadioListTile(
                  value: value2,
                  groupValue: _groupValue,
                  onChanged: (_) {
                    setState(() {
                      _groupValue = value2;
                      print(_groupValue);
                    });
                  },
                  title: Text("By first AlphaBet"),
                ),
                // child: _myRadioButton(
                //   title: "By first AlphaBet ",
                //   value: 1,
                //   onChanged: (newValue) {
                //     setState(() {
                //       _groupValue = newValue;
                //       print(_groupValue);
                //     });
                //   },
                // ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12.0),
                  hintText: 'Search',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                controller: mycontroller,
                onChanged: (text) {
                  if (_groupValue == 0) {
                    if (text.isEmpty) {
                      setState(() {
                        searchList.clear();
                      });
                    } else {
                      getDrinksbyName();
                    }
                  } else {
                    if (text.isEmpty) {
                      setState(() {
                        searchList.clear();
                      });
                    } else {
                      getDrinksByFirstAlphaBet();
                    }
                  }
                },
              ),
            ),
          ),
          Container(
            height: 100.h,
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return _listItem(index);
                },
                // controller: controller,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getDrinksbyName() async {
    setState(() {
      isLoading = true;
    });
    // print(Home.token);
    final response = await http.get(
      Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=${mycontroller.text}",
      ),
      headers: {
        "content-type": "application/json",
      },
    );
    setState(() {
      isLoading = false;
    });

    print(response.request.toString());
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        searchList = List<Drinks>.from(
            data['drinks'].map((model) => Drinks.fromJson(model)));
        // if (data['nextPage'] > nextPageNumber) {
        //   nextPageNumber = data['nextPage'];
        // }
        print(searchList.length);
      });
    } else if (response.statusCode == 401) {}
  }

  Future<void> getDrinksByFirstAlphaBet() async {
    setState(() {
      isLoading = true;
    });
    // print(Home.token);
    final response = await http.get(
      Uri.parse(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=${mycontroller.text}",
      ),
      headers: {
        "content-type": "application/json",
      },
    );
    setState(() {
      isLoading = false;
    });

    print(response.request.toString());
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        searchList = List<Drinks>.from(
            data['drinks'].map((model) => Drinks.fromJson(model)));
        // if (data['nextPage'] > nextPageNumber) {
        //   nextPageNumber = data['nextPage'];
        // }
        print(searchList.length);
      });
    } else if (response.statusCode == 401) {}
  }

  _listItem(index) {
    return Card(
      color: Colors.white,
      elevation: 1.0,
      child: ListTile(
        onTap: () {
          print(searchList[index].strAlcoholic);
        },
        isThreeLine: true,
        leading: CircleAvatar(
          backgroundImage: NetworkImage('${searchList[index].strDrinkThumb}'),
        ),
        title: Row(
          children: [
            Row(
              children: [
                Text(
                  '${searchList[index].strDrink}',
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
              value: (searchList[index].strAlcoholic == 'Alcoholic')
                  ? true
                  : false,
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
            InkWell(
              onTap: () async {
                if (searchList[index].isFav) {
                  setState(() async {
                    searchList[index].isFav = false;
                    //remove from favs
                  });
                } else {
                  setState(() {
                    searchList[index].isFav = true;

                    FavouriteModel fav = FavouriteModel(
                      searchList[index].strDrink,
                      searchList[index].strInstructions,
                      searchList[index].strDrinkThumb,
                      searchList[index].strAlcoholic,
                      index,
                    );

                    dbHelper.add(fav);
                    print(fav);
                    // here to implement add
                  });
                }
              },
              child: (searchList[index].isFav)
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite_outline,
                      color: Colors.red,
                    ), // icon-2
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
                '${searchList[index].strInstructions}',
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
