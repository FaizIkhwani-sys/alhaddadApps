import 'package:flutter/material.dart';

import 'package:apps_al_haddad/al_haddad.dart';

class AppProgramCard extends StatelessWidget {
  final String day;
  final String month;
  final String programTitle;
  final String? time;

  const AppProgramCard({
    Key? key,
    required this.day,
    required this.month,
    required this.programTitle,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context, programTitle, time),
      child: Container(
        height: 100.0,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  month,
                  style: const TextStyle(
                    color: primaryColor,
                  ),
                )
              ],
            ),
            const SizedBox(width: 16.0),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      programTitle,
                      style: const TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    time ?? '',
                    style: const TextStyle(
                      color: grayColor,
                      fontSize: 12.0,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _onTap(
  BuildContext context,
  String programTitle,
  String? time,
) async {
  var description = 'Tarikh : 12 MEI 2021 \n'
      'Masa : $time \n'
      'Tempat : Dewan Politeknik Seberang Perai \n'
      'Link Program : www.facebook.com/konvo';

  await showDialog(
    context: context,
    builder: (_) {
      return AppAlertDialog(
        alertDialogType: AlertDialogType.info,
        title: programTitle,
        subtitle: '',
        description: description,
        actionButtons: [
          ActionButton(
            label: 'Kembali',
            color: secondaryColor,
            onTap: () => AppRoute.pop(context),
          ),
        ],
      );
    },
  );
}
