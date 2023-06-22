import 'package:country_new/view/countryinfo_screen.dart';
import 'package:country_new/view_model/country_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class countrylistscreen extends StatefulWidget {
  const countrylistscreen({super.key});

  @override
  State<countrylistscreen> createState() => _countrylistscreenState();
}

class _countrylistscreenState extends State<countrylistscreen> {
  var _countryview = viewmodel();
  Widget? appbar;
  var setsearch = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryview.loaddata();
    setState(() {
      appbar = appbarview();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => _countryview),
      child: Consumer<viewmodel>(
        builder: (context, viewmodel, child) {
          return getview(viewmodel);
        },
      ),
    );
  }

  Widget getview(viewmodel countryinfo) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: appbar,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: countryinfo.countrilist.length,
        itemBuilder: ((context, index) {
          return Visibility(
            visible: countryinfo.countrilist[index].common
                .toString()
                .toLowerCase()
                .contains(setsearch.text.toLowerCase()),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) {
                      return infoscreen(
                        info: countryinfo,
                        index: index,
                      );
                    })));
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          child: CachedNetworkImage(
                            height: 100,
                            width: 120,
                            fit: BoxFit.cover,
                            fadeInDuration: Duration(milliseconds: 200),
                            imageUrl: '${countryinfo.countrilist[index].flags}',
                            placeholder: ((context, url) =>
                                CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            countryinfo.countrilist[index].common.toString(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            countryinfo.countrilist[index].official
                                        .toString()
                                        .length <
                                    30
                                ? countryinfo.countrilist[index].official
                                    .toString()
                                : countryinfo.countrilist[index].official
                                        .toString()
                                        .substring(0, 30) +
                                    '...',
                          )
                        ],
                      ),
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }

  Widget appbarview() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.menu,
          color: Colors.blue.shade800,
          size: 35,
        ),
        Text(
          'Countries',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          alignment: Alignment.bottomRight,
          splashRadius: 27,
          iconSize: 35,
          onPressed: () {
            setState(() {
              appbar = searchappbar();
            });
          },
          icon: Icon(
            Icons.search,
            color: Colors.blue.shade800,
          ),
        )
      ],
    );
  }

  Widget searchappbar() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: TextField(
                onChanged: ((value) {
                  setState(() {});
                }),
                controller: setsearch,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontFamily: 'GM',
                    fontSize: 20,
                    color: Colors.red,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    borderSide: BorderSide(color: Colors.red, width: 3),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Center(
                child: IconButton(
                  onPressed: (() {
                    setState(() {
                      appbar = appbarview();
                      setsearch.text = '';
                    });
                  }),
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red.shade800,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
