import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/common/data_type/dashboard_list_screen.dart';
import 'package:yope_yourpet_social_networking/modules/auth/pages/auth_dashboard_page.dart';
import 'package:yope_yourpet_social_networking/modules/home/pages/home_dashboard_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/page/widget_store_page.dart';
import 'package:yope_yourpet_social_networking/modules/widget_store/widgets/statefull_widget/card_screen.dart';
// import 'package:social_network_newsfeed/common/data_type/list_screen.dart';
// import 'package:social_network_newsfeed/modules/auth/pages/login_page.dart';
// import 'package:social_network_newsfeed/modules/posts/pages/list_posts_page.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final paddingSafeAreaSize = MediaQuery.of(context).padding.top +
    MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Screen'),
      ),
      body: Container(
          // height: size.height,
          color: Colors.black,
          // child: ListView.builder(
          //     itemCount: 4,
          //     itemBuilder: (context, index) {
          //       return CardScreen(title: listScreen[index]);
          //     }),
          child: ListView(
            children: [
              CardScreen(
                title: listDashBoardScreen[0],
                pageWidget: const DashBoardAuthPage(),
              ),
              CardScreen(
                title: listDashBoardScreen[1],
                pageWidget: const DashBoardHomePage(),
              ),
              const CardScreen(
                title: 'WidgetStorePage',
                pageWidget: WidgetStorePage(),
              ),
              // CardScreen(
              //   title: listScreen[3],
              //   pageWidget: const ListPostsPage(),
              // ),
              // const CardScreen(
              //   title: 'Login Page',
              //   pageWidget: LoginPage(),
              // )
            ],
          )),
    );
  }
}
