import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:intl/intl.dart';

class AppNotificationCard extends StatelessWidget {
  final String title;
  final String? description;
  final String date;
  final String? image;
  final VoidCallback? onTap;
  final Function()? onDelete;
  final Color? color;
  final String? readAt;

  const AppNotificationCard({
    required this.title,
    this.description,
    required this.date,
    this.image,
    this.onTap,
    this.onDelete,
    this.color,
    this.readAt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.widthScreen(context),
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Icon(
              //   EvaIcons.bellOutline,
              //   size: 32.0,
              //   color: grayColor,
              // ),
              // const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TitleAndDateSection(
                      title: title,
                      date: date,
                      readAt: readAt!,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: AppSize.mainSpaceBetween,
                      children: [
                        _Description(description: description),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 8, 0),
                          child: InkWell(
                              onTap: onDelete,
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    image == ''
                        ? Container()
                        : _AttachmentPill(
                            image: image,
                          ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleAndDateSection extends StatelessWidget {
  final String title;
  final String date;
  final String readAt;

  const _TitleAndDateSection({
    required this.title,
    required this.date,
    required this.readAt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Title(
            title: title,
            readAt: readAt,
          ),
          _Date(date: date),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String readAt;

  const _Title({
    required this.title,
    required this.readAt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: AppSize.crossStart,
      children: [
        Container(
          width: AppSize.widthScreen(context) * 0.6,
          child: TextManrope(
            text: title,
            color: darkColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            maxLines: 5,
            textAlign: TextAlign.left,
          ),
        ),
        readAt == ''
            ? Container()
            : TextManrope(
                text:
                    ' [read at: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.parse(readAt))}]',
                fontSize: 10,
              ),
      ],
    );
  }
}

class _Date extends StatelessWidget {
  final String date;

  const _Date({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: const TextStyle(
        color: grayColor,
        fontSize: 12.0,
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String? description;

  const _Description({this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.widthScreen(context) * 0.75,
      child: Text(
        description?.capitalizeFirstofEach ?? '',
        style: const TextStyle(
          color: grayColor,
        ),
        softWrap: true,
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _AttachmentPill extends StatelessWidget {
  final String? image;

  const _AttachmentPill({this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(color: grayColor),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        children: [
          Icon(
            EvaIcons.file,
            color: primaryColor,
            size: 20.0,
          ),
          SizedBox(width: 4.0),
          // Flexible(child: Image.network(imageURl + image!))
          Flexible(
            child: Text(
              'Image',
              style: TextStyle(
                fontSize: 14.0,
                color: darkColor,
              ),
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
