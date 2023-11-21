import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_quilt/Components/CommonAppBar.dart';
import 'package:rate_my_quilt/Components/CommonText.dart';
import 'package:rate_my_quilt/Components/CustomNavBar.dart';
import 'package:rate_my_quilt/Controller/Search_Controller.dart';
import 'package:rate_my_quilt/Utils/Colors.dart';
import 'package:rate_my_quilt/Utils/SizedBox.dart';
import 'package:rate_my_quilt/View/DashBoard/Home/UserTimeLineSearch.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchcontroller =
        Provider.of<Search_Controller>(context, listen: false);
    return Scaffold(
            bottomNavigationBar: CustomBottomNavBar(
                      index: 0,
                    ),
        backgroundColor: pageBackgroundColor,
        appBar: PreferredSize(
            child: CommonAppBar(
              title: "Search",
              subtitle: "Screen",
            ),
            preferredSize: Size(width(context), 60)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              20.sh,
              Container(
                height: 50,
                width: width(context),
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: greycolor.withOpacity(.1)),
                child: Center(
                  child: TextFormField(
                    controller: searchcontroller.search,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              if (searchcontroller.search.text.isEmpty) {
                               searchcontroller.searchValidator(true);
                              }else{
                                searchcontroller.searchValidator(false);
                                searchcontroller.Hitsearch(context);
                              }
                            },
                            child: Icon(Icons.search)),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        enabledBorder: InputBorder.none,
                        hintText: "Search here ..."),
                  ),
                ),
              ),
              10.sh,
              Consumer<Search_Controller>(
                builder: (context, controller, child) {
                  if (controller.havesearchtext==true) {
                  return CommonTextmeri(text: "Please Type Something To Search",talign: TextAlign.start, fontweight: FontWeight.w400, fontsize: 15, color: primaryColor);
                  }
                  return Text("");
                },
              ),
              10.sh,
              Consumer<Search_Controller>(
                builder: (context, controller, child) {
                  if (controller.isloading) {
                    return CircularProgressIndicator();
                  } else {
                    if (controller.getpostmodel==null) {
                      return Container();
                    }
                    if (controller.getpostmodel!.data.isEmpty) {
                      return CommonTextmeri(text: "No Search Results Found", fontweight: FontWeight.w500, fontsize: 15, color: primaryColor);
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GridView.builder(
                        itemCount: controller.getpostmodel!.data.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: .75,
                            crossAxisSpacing: 4.24,
                            mainAxisSpacing: 4,
                            mainAxisExtent: 160),
                        itemBuilder: (BuildContext context, int index) {
                          print("abcdf");
                          return InkWell(
                            onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    duration: Duration(milliseconds: 300),
                                    child: UserTimeLineSearch(
                                        getPostsModel:
                                            controller.getpostmodel!,initindex: index,)));
                          },
                            child: Image.network(
                                controller.getpostmodel!.data[index].image
                                //"https://ratemyquilts.com/storage/profile_pictures/1678967139_107e5d1d8a9917ff9ccb.jpg"
                                ),
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ));
  }
}
