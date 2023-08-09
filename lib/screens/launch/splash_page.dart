import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashPageState(),
      child: const Scaffold(
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<SplashPageState>().locationPermission();
    context.read<SplashPageState>().getLocation();
    context.read<SplashPageState>().initApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashPageState>(
      builder: (context, state, child) {
        return Center(
          child: AnimatedSplashScreen(
            splashIconSize: 250,
            splash: Center(
              child: Container(
                height: 250,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/logo_alhaddad.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            nextScreen: state.bearerToken == null
                ? LogInPage()
                : state.userName!.contains("admin")
                    ? AdminHomePage(
                        userId: state.userName,
                      )
                    : AdminHomePage(),
            splashTransition: SplashTransition.scaleTransition,
          ),
        );
      },
    );
  }
}
