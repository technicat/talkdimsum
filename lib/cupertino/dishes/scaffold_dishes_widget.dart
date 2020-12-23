/* Technicat LLC */

import 'package:flutter/cupertino.dart';
//import 'package:url_launcher/url_launcher.dart';

//import 'categories_widget.dart';
//import '../search/search_word_widget.dart';
/*
class ScaffoldDishesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Talk Dim Sum'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchWordWidget()),
            );
          },
        ),
      ]),
      body: CategoriesWidget(), // AllDishesWidget(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:
                  //Image.asset('assets/images/icon/if_dim_sum_353267_512.png'),
                  Image.asset('assets/images/icon/catgraphic.png'),
              //Text('Talk Dim Sum'),
              /* decoration: BoxDecoration(
                color: Colors.blue,
              ), */
            ),
            ListTile(
              title: Text('Technicat'),
              onTap: () {
                launch('http://technicat.com');
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Pinterest'),
              onTap: () {
                launch('https://www.pinterest.com/technicat/dim-sum/');
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Talk Dim Sum'),
              onTap: () {
                launch('http://talkdimsum.com/');
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/

class ScaffoldDishesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Dishes'),
              ),
              child: Center(
                            )
                          );
                        }
          }