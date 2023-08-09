import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/scroll_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

late FocusNode _agentNode;
late FocusNode _retailerNode;

class MembershipUtamaListPage extends StatelessWidget {
  const MembershipUtamaListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MembershipUtamaListState(),
      child: _Body(),
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
    super.initState();
    final state = context.read<MembershipUtamaListState>();
    state.getRetailer('');
    state.getMembership('');
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _TabBarAdmin());
  }
}

class _TabBarAdmin extends StatelessWidget {
  const _TabBarAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollNavigation(
      bodyStyle: NavigationBodyStyle(
        background: Colors.white,
      ),
      barStyle: NavigationBarStyle(
        position: NavigationPosition.top,
        background: Colors.white,
        elevation: 0.5,
      ),
      pages: [
        _Stokis(),
        _Agent(),
      ],
      items: [
        ScrollNavigationItem(
            icon: TextManrope(
          text: 'Retailer',
          fontWeight: FontWeight.bold,
        )),
        ScrollNavigationItem(
            icon: TextManrope(
          text: 'Membership',
          fontWeight: FontWeight.bold,
        )),
      ],
    );
  }
}

class _Stokis extends StatefulWidget {
  const _Stokis({Key? key}) : super(key: key);

  @override
  State<_Stokis> createState() => _StokisState();
}

class _StokisState extends State<_Stokis> {
  @override
  void initState() {
    super.initState();
    _retailerNode = FocusNode();
  }

  @override
  void dispose() {
    _retailerNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MembershipUtamaListState>(
      builder: (_, state, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: AppTextFieldWithLabel(
                  focusNode: _retailerNode,
                  hint: "search name...",
                  keyboardType: TextInputType.text,
                  onChange: (v) => state.searchRetailer = v,
                  onSubmitted: (v) => state.searchRetailer = v,
                ),
              ),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.retailerList == null
                      ? Center(
                          child: TextManrope(
                            text: 'sorry, no search result...',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...List.generate(
                                  state.retailerList!.length,
                                  (i) => _MembershipCard(
                                        name: state.retailerList![i].namaPenuh,
                                        image: state.retailerList![i].image,
                                        level:
                                            state.retailerList![i].pilihanLabel,
                                        phone: state.retailerList![i].noTel,
                                      ))
                            ],
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}

class _Agent extends StatefulWidget {
  const _Agent({Key? key}) : super(key: key);

  @override
  State<_Agent> createState() => _AgentState();
}

class _AgentState extends State<_Agent> {
  @override
  void initState() {
    super.initState();
    _agentNode = FocusNode();
  }

  @override
  void dispose() {
    _agentNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MembershipUtamaListState>(
      builder: (_, state, __) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: AppTextFieldWithLabel(
                  focusNode: _agentNode,
                  hint: "search name...",
                  keyboardType: TextInputType.text,
                  onChange: (v) => state.searchAgent = v,
                  onSubmitted: (v) => state.searchAgent = v,
                ),
              ),
              state.isLoading
                  ? AppLoadingOverlay()
                  : state.membershipList == null
                      ? Center(
                          child: TextManrope(
                            text: 'sorry, no search result...',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ...List.generate(
                                  state.membershipList!.length,
                                  (i) => _MembershipCard(
                                        name:
                                            state.membershipList![i].namaPenuh,
                                        image: state.membershipList![i].image,
                                        level: state
                                            .membershipList![i].pilihanLabel,
                                        phone: state.membershipList![i].noTel,
                                      ))
                            ],
                          ),
                        ),
            ],
          ),
        );
      },
    );
  }
}

class _MembershipCard extends StatelessWidget {
  final String? name;
  final String? phone;
  final String? image;
  final String? level;

  const _MembershipCard(
      {this.name, this.phone, this.image, this.level, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Container(
                    width: AppSize.widthScreen(context) * 0.3,
                    height: AppSize.heightScreen(context) * 0.4,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage('${imageURl + image!}'))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Column(
                    crossAxisAlignment: AppSize.crossStart,
                    children: [
                      SizedBox(
                        width: AppSize.widthScreen(context) * 0.62,
                        child: TextManrope(
                          text: name!.capitalizeFirstofEach,
                          maxLines: 4,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextManrope(
                        text: level!.capitalizeFirstofEach,
                        fontStyle: FontStyle.italic,
                      ),
                      TextManrope(text: phone!),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () async {
                      launchUrl(Uri.parse('tel://$phone'));
                    },
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                        ))),
              ],
            ),
          ),
        ),
        SizedBox(
          height: AppSize.heightScreen(context) * 0.01,
        )
      ],
    );
  }
}

// code untuk table

// child: Table(
//   columnWidths: {0: FractionColumnWidth(0.11)},
//   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//   border: TableBorder.all(color: Colors.black.withOpacity(0.3)),
//   children: [
//     TableRow(children: [
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Bil.',
//             color: Colors.white,
//           )),
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Nama',
//             color: Colors.white,
//           )),
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Produk',
//             color: Colors.white,
//           )),
//       Container(
//           color: primaryColor,
//           child: TextManrope(
//             text: 'Status',
//             color: Colors.white,
//           )),
//     ]),
//     ...List.generate(
//       12,
//       (index) => TableRow(children: [
//         TextManrope(text: '${index + 1}.'),
//         TextManrope(
//           text: 'AHMAD OMAR DAN HANA',
//           maxLines: 10,
//         ),
//         TextManrope(
//           text: 'Produk',
//           maxLines: 10,
//         ),
//         InkWell(
//           onTap: () {
//             print('tekan sini ${index + 1}');
//           },
//           child: Center(
//             child: TextManrope(
//               text: 'Status',
//               maxLines: 10,
//             ),
//           ),
//         ),
//       ]),
//     )
//   ],
// ),
