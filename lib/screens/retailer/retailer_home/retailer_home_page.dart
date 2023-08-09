import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetailerHomePage extends StatelessWidget {
  final String? userId;
  const RetailerHomePage({this.userId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageState(),
      child: _Body(
        userId: userId,
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final String? userId;
  const _Body({this.userId, Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final state = context.read<HomePageState>();

      state.userId = _prefs.getString('idJenisAkses');
      print(state.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return AppMainBar(
            backgroundColor: backgroundColor,
            title: pageAdmin[state.selectedIndex]['title'],
            bottomNavigationBar: _BottomNavigationBarAdmin(),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          AppRoute.push(context, SendNotificationPage());
                          print(state.userId);
                        },
                        icon: Icon(
                          Icons.notifications_active,
                          color: Colors.black,
                        )),
                    SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              )
            ],
            body: _ContentAdmin());
      },
    );
  }
}

class _BottomNavigationBarAdmin extends StatelessWidget {
  const _BottomNavigationBarAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.homeOutline),
              label: "Utama",
            ),
            BottomNavigationBarItem(
              icon: Icon(EvaIcons.people),
              label: "Membership",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              label: "Sales Management",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          currentIndex: state.selectedIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedFontSize: 12.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: grayColor,
          selectedItemColor: primaryColor,
          onTap: (index) => state.selectedIndex = index,
        );
      },
    );
  }
}

class _ContentAdmin extends StatelessWidget {
  const _ContentAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageState>(
      builder: (_, state, __) {
        return pageAdmin[state.selectedIndex]['page'];
      },
    );
  }
}
