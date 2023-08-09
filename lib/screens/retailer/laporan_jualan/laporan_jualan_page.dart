import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class RetailerLaporanJualanPage extends StatelessWidget {
  const RetailerLaporanJualanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LaporanJualanState(),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 4.0,
          right: 4.0,
          bottom: 16.0,
          top: 8.0,
        ),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            1,
            (index) => Column(
                  children: [
                    _JenisPremisCard(
                      title: 'Retailer',
                      onTap: () {
                        AppRoute.push(context, RetailerPage());
                      },
                    ),
                    _JenisPremisCard(
                      title: 'Qahwa',
                      onTap: () {},
                    ),
                    _JenisPremisCard(
                      title: 'E-Commerce',
                      onTap: () {
                        AppRoute.push(context, EcommercePage());
                      },
                    ),
                  ],
                )),
      ],
    );
  }
}

class _JenisPremisCard extends StatelessWidget {
  final String? title;
  final Function()? onTap;

  const _JenisPremisCard({this.title, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            width: AppSize.widthScreen(context),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 8, 16),
              child: TextManrope(
                text: title!,
                fontSize: 18,
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

// class _Body extends StatelessWidget {
//   const _Body({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: AppSize.widthScreen(context),
//           child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               color: primaryColor,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: BarChartWidget(),
//               )),
//         ),
//         TextManrope(
//           text: 'Rekod Jualan',
//           textAlign: TextAlign.center,
//         )
//       ],
//     );
//   }
// }
