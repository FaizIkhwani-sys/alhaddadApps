import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class AppModal {
  static showConfirmation(
    BuildContext context,
    String title,
    String subtitle,
    String btnTitle,
    String tidak,
    Function onTapFunction,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: SizedBox(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.spaceX16,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: lightColor,
                      ),
                    ),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.spaceX8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.spaceX16),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: labelTextColor,
                      fontSize: AppSize.fontMedium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: AppSize.spaceX16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppRoute.pop(context);
                      },
                      child: Container(
                        height: 52,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: lightColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            tidak,
                            style: const TextStyle(
                              color: labelTextColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppRoute.pop(context);
                        onTapFunction();
                      },
                      child: Container(
                        height: 52,
                        width: 120,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            btnTitle,
                            style: const TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  // static showConfirmationDaftar(
  //     BuildContext context,
  //     String title,
  //     String subtitle,
  //     Function onTapFunction,
  //     ) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Material(
  //         child: Dialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(6.0),
  //           ),
  //           child: SizedBox(
  //             height: 200.0,
  //             width: MediaQuery.of(context).size.width,
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   width: MediaQuery.of(context).size.width,
  //                   padding: EdgeInsets.symmetric(
  //                     vertical: AppSize.spaceX16,
  //                   ),
  //                   decoration: const BoxDecoration(
  //                     border: Border(
  //                       bottom: BorderSide(
  //                         width: 1,
  //                         color: lightColor,
  //                       ),
  //                     ),
  //                   ),
  //                   child: Text(
  //                     title ,
  //                     textAlign: TextAlign.center,
  //                     style: const TextStyle(
  //                       fontWeight: FontWeight.w700,
  //                       fontSize: 20,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: AppSize.spaceX8),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: AppSize.spaceX16),
  //                   child: Text(
  //                     subtitle ,
  //                     style: TextStyle(
  //                       color: labelTextColor,
  //                       fontSize: AppSize.fontMedium,
  //                     ),
  //                     textAlign: TextAlign.center,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: AppSize.spaceX16,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     GestureDetector(
  //                       onTap: () {
  //                         AppRoute.pop(context);
  //                         AppRoute.pushReplacement(context, const LoginPage());
  //                       },
  //                       child: Container(
  //                         height: 52,
  //                         width: 120,
  //                         decoration: BoxDecoration(
  //                           border: Border.all(
  //                             width: 1,
  //                             color: lightColor,
  //                           ),
  //                           borderRadius: BorderRadius.circular(8),
  //                         ),
  //                         child: const Center(
  //                           child: Text(
  //                             'TIDAK',
  //                             style: TextStyle(
  //                               color: labelTextColor,
  //                               fontWeight: FontWeight.w800,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     GestureDetector(
  //                       onTap: () {
  //                         AppRoute.pop(context);
  //                         onTapFunction();
  //                       },
  //                       child: Container(
  //                         height: 52,
  //                         width: 120,
  //                         decoration: BoxDecoration(
  //                           color: primaryColor,
  //                           borderRadius: BorderRadius.circular(8),
  //                         ),
  //                         child: const Center(
  //                           child: Text(
  //                             'YA',
  //                             style: TextStyle(
  //                               color: whiteColor,
  //                               fontWeight: FontWeight.w800,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  static showExitError(
    BuildContext context,
    String title,
    String subtitle,
    Function onTapFunction,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: SizedBox(
            height: 175.0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.spaceX16,
                  ),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: lightColor,
                      ),
                    ),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.spaceX8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.spaceX16),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: labelTextColor,
                      fontSize: AppSize.fontMedium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: AppSize.spaceX16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //AppRoute.pushReplacement(context, HomeScreen());
                      },
                      child: Container(
                        height: 52,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: lightColor,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Halaman Utama',
                            style: TextStyle(
                              color: labelTextColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppRoute.pop(context);
                        onTapFunction();
                      },
                      child: Container(
                        height: 52,
                        width: 120,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Log Masuk',
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static showInformation(
    BuildContext context,
    String title,
    String subtitle, {
    String btnTitle = 'Kembali',
    required VoidCallback onTap,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Container(
            padding: const EdgeInsets.only(
              bottom: 16.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSize.spaceX16,
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.spaceX8),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.spaceX16,
                  ),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: labelTextColor,
                      fontSize: AppSize.fontMedium,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppSize.spaceX16),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    height: 52,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Text(
                        btnTitle,
                        style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // static showDetails(
  //     BuildContext context,
  //     String title,
  //     String subtitle, {
  //       required Function onTap,
  //     }) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(6.0),
  //         ),
  //         child: Container(
  //           padding: const EdgeInsets.only(
  //             bottom: 16.0,
  //             left: 8.0,
  //             right: 8.0,
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               Align(
  //                 alignment: Alignment.topRight,
  //                 child: IconButton(
  //                   onPressed: () => AppRoute.pop(context),
  //                   icon: const Icon(EvaIcons.close),
  //                 ),
  //               ),
  //               SizedBox(height: AppSize.spaceX6),
  //               Image.asset('assets/logo/MDN.png'),
  //               Container(
  //                 padding: EdgeInsets.symmetric(vertical: AppSize.spaceX16),
  //                 child: Text(
  //                   title ,
  //                   textAlign: TextAlign.center,
  //                   style: textStyles.defaultTextStyle.copyWith(
  //                     color: primaryColor,
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: AppSize.spaceX8),
  //               Container(
  //                 decoration: BoxDecoration(
  //                   color: primaryColor,
  //                   borderRadius: BorderRadius.circular(16.0),
  //                 ),
  //                 padding: EdgeInsets.all(AppSize.spaceX16),
  //                 child: Text(
  //                   subtitle,
  //                   style: textStyles.mediumTextStyle.copyWith(
  //                     color: Colors.white,
  //                   ),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //               SizedBox(height: AppSize.spaceX16),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // static showDetailsWithImage(
  //     BuildContext context,
  //     String title, {
  //       required Function onTap,
  //     }) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(6.0),
  //         ),
  //         child: Container(
  //           padding: EdgeInsets.only(
  //             bottom: 16.0,
  //             left: 8.0,
  //             right: 8.0,
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               Align(
  //                 alignment: Alignment.topRight,
  //                 child: IconButton(
  //                   onPressed: () => AppRoute.pop(context),
  //                   icon: Icon(EvaIcons.close),
  //                 ),
  //               ),
  //               SizedBox(height: AppSize.spaceX6),
  //               Image.asset('assets/icons/masjid_pro_penang.png'),
  //               Container(
  //                 padding: EdgeInsets.symmetric(vertical: AppSize.spaceX16),
  //                 child: Text(
  //                   title ?? '',
  //                   textAlign: TextAlign.center,
  //                   style: textStyles.defaultTextStyle.copyWith(
  //                     color: primaryColor,
  //                   ),
  //                 ),
  //               ),
  //               Image.asset(
  //                 'assets/images/logoMySejahtera.png',
  //                 height: 150.0,
  //               ),
  //               AppBadge(
  //                 title: 'tiket mysejahtera',
  //                 color: grayColor,
  //                 onTap: onTap,
  //               ),
  //               SizedBox(height: AppSize.spaceX16),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // static showExitModal(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text("Keluar aplikasi?"),
  //       actions: <Widget>[
  //         FlatButton(
  //           child: Text("Yes"),
  //           onPressed: () => AppRoute.pop(context),
  //         ),
  //         FlatButton(
  //           child: Text("No"),
  //           onPressed: () => Get.toNamed('/HPnew'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
