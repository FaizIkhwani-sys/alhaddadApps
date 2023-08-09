import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MembershipListPage extends StatelessWidget {
  final String? bearer;

  const MembershipListPage({this.bearer, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWebViewPage(
      appBarTitle: 'Membership List',
      url: getUrl(),
      hasBackButton: true,
    );
  }

  getUrl() async {
    await getBearer();

    String? url =
        "https://alhaddad-admin.myrichappsproject.tk/stockist_agent_membership_list_sub?noHeader=1&apps=1&bearer=${getBearer()}";

    return url;
  }

  getBearer() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    String? bearer = _prefs.getString('BearerToken');

    return bearer;
  }
}

// class _Body extends StatefulWidget {
//   const _Body({Key? key}) : super(key: key);
//
//   @override
//   State<_Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<_Body> {
//   @override
//   void initState() {
//     super.initState();
//
//     final state = context.read<MembershipListState>();
//     state.getBearer();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MembershipListState>(
//       builder: (_, state, __) {
//         return AppWebViewPage(
//           bearerToken: state.bearer,
//           appBarTitle: 'Membership List',
//           url:
//               "https://alhaddad-admin.myrichappsproject.tk/stockist_agent_membership_list_sub?noHeader=1&apps=1",
//           hasBackButton: true,
//         );
//       },
//     );
//   }
// }

// class _Body extends StatefulWidget {
//   const _Body({Key? key}) : super(key: key);
//
//   @override
//   State<_Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<_Body> {
//   @override
//   void initState() {
//     super.initState();
//     final state = context.read<MembershipListState>();
//     state.getMembershipList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MembershipListState>(
//       builder: (_, state, __) {
//         return state.isLoading ? AppLoadingOverlay() : _MembershipList();
//       },
//     );
//   }
// }
//
// class _MembershipList extends StatelessWidget {
//   const _MembershipList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MembershipListState>(
//       builder: (_, state, __) {
//         return state.membershipList == null
//             ? TextManrope(text: 'Sorry, You have no membership')
//             : Column(
//                 children: [
//                   ...List.generate(
//                       state.membershipList!.length,
//                       (i) => _MembershipListCard(
//                             name: state.membershipList![0].namaPenuh,
//                             membership: state.membershipList![0].pilihanLabel,
//                             image: imageURl + state.membershipList![0].image!,
//                           ))
//                 ],
//               );
//       },
//     );
//   }
// }
//
// class _MembershipListCard extends StatelessWidget {
//   final String? image;
//   final String? name;
//   final String? membership;
//
//   const _MembershipListCard({this.image, this.name, this.membership, Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: AppSize.crossStart,
//       children: [
//         SizedBox(
//             height: AppSize.heightScreen(context) * 0.15,
//             width: AppSize.widthScreen(context) * 0.3,
//             child: Image.network(
//               image!,
//               fit: BoxFit.cover,
//             )),
//         Column(
//           children: [
//             SizedBox(
//               width: AppSize.widthScreen(context) * 0.6,
//               child: TextManrope(
//                 text: '\n${name!.capitalizeFirstofEach}',
//                 maxLines: 3,
//                 textAlign: TextAlign.left,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               width: AppSize.widthScreen(context) * 0.6,
//               child: TextManrope(
//                 text: '${membership!.capitalizeFirstofEach}',
//                 textAlign: TextAlign.left,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
