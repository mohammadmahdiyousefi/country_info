import 'package:country_new/view_model/country_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class infoscreen extends StatefulWidget {
  infoscreen({super.key, this.info, this.index});
  viewmodel? info;
  int? index;
  @override
  State<infoscreen> createState() => _infoscreenState();
}

class _infoscreenState extends State<infoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              bottom: PreferredSize(
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(17),
                      topRight: Radius.circular(17),
                    ),
                  ),
                ),
                preferredSize: Size.fromHeight(10),
              ),
              backgroundColor: Colors.white,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  image: NetworkImage(
                      '${widget.info!.countrilist[widget.index!].flags}'),
                  fit: BoxFit.cover,
                ),
              ),
              leading: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      minimumSize: Size(20, 20),
                      side: BorderSide(color: Colors.transparent, width: 3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(child: Icon(Icons.arrow_back))),
              iconTheme: IconThemeData(
                size: 25,
              ),
            ),
          ];
        }),
        body: Container(
          child: SingleChildScrollView(
            // controller: controller,
            child: Column(
              children: [
                Text('Country Name : ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.info!.countrilist[widget.index!].common}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'SH',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                getdivider(),
                Text('Country Religion : ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.info!.countrilist[widget.index!].official}',
                  style: TextStyle(
                    fontFamily: 'SH',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getdivider(),
                Text('ccn3 : ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.info!.countrilist[widget.index!].ccn3}',
                  style: TextStyle(
                    fontFamily: 'SH',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getdivider(),
                Text('region : ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.info!.countrilist[widget.index!].region}',
                  style: TextStyle(
                    fontFamily: 'SH',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getdivider(),
                Text('capital : ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.info!.countrilist[widget.index!].capital}',
                  style: TextStyle(
                    fontFamily: 'SH',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getdivider(),
                Text('languages : ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${widget.info!.countrilist[widget.index!].languages}',
                  style: TextStyle(
                    fontFamily: 'SH',
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                getdivider(),
                Text('coatOfArms : ',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 20,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: Image(
                      image: NetworkImage(
                          '${widget.info!.countrilist[widget.index!].svg}')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getdivider() {
    return Divider(
      height: 25,
      thickness: 1,
      color: Colors.grey.shade500,
      indent: 50,
      endIndent: 50,
    );
  }
}
