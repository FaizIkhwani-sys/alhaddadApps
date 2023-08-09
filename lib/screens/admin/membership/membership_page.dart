import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

final _headerStyle = const TextStyle(
    color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
final _contentStyleHeader = const TextStyle(
    color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
final _contentStyle = const TextStyle(
    color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
final _loremIpsum =
    '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

class MembershipPage extends StatelessWidget {
  const MembershipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MembershipState(),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Accordion(
      scrollIntoViewOfItems: ScrollIntoViewOfItems.none,
      maxOpenSections: 2,
      headerBackgroundColorOpened: Colors.black54,
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      children: [
        ...List.generate(
          1,
          (index) => AccordionSection(
            isOpen: true,
            leftIcon: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/membertry8.jpg")),
            header: Text('Naelofar', style: _headerStyle),
            contentBorderColor: const Color(0xffffffff),
            headerBackgroundColorOpened: Colors.amber,
            content: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Accordion(
                maxOpenSections: 1,
                headerBackgroundColorOpened: Colors.black54,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                children: [
                  ...List.generate(
                    5,
                    (index) => AccordionSection(
                      isOpen: false,
                      leftIcon: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              AssetImage("assets/images/membershiptry9.jpg")),
                      headerBackgroundColor: Colors.black38,
                      headerBackgroundColorOpened: Colors.black54,
                      header: Text('Heliza Hilme', style: _headerStyle),
                      content: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Accordion(
                          maxOpenSections: 1,
                          headerBackgroundColorOpened: Colors.black54,
                          headerPadding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          children: [
                            ...List.generate(
                              5,
                              (index) => AccordionSection(
                                isOpen: false,
                                leftIcon: CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: AssetImage(
                                        "assets/images/membership_try10.jpg")),
                                headerBackgroundColor: Colors.black38,
                                headerBackgroundColorOpened: Colors.black54,
                                header:
                                    Text('Uyaina Irshad', style: _headerStyle),
                                content:
                                    Text(_loremIpsum, style: _contentStyle),
                                contentHorizontalPadding: 20,
                                contentBorderColor: Colors.black54,
                              ),
                            )
                            // AccordionSection(
                            //   isOpen: false,
                            //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try8.jpeg")),
                            //   headerBackgroundColor: Colors.black38,
                            //   headerBackgroundColorOpened: Colors.black54,
                            //   header: Text('Nora Ghanish', style: _headerStyle),
                            //   content: Text(_loremIpsum, style: _contentStyle),
                            //   contentHorizontalPadding: 20,
                            //   contentBorderColor: Colors.black54,
                            // ),AccordionSection(
                            //   isOpen: false,
                            //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try2.jpg")),
                            //   headerBackgroundColor: Colors.black38,
                            //   headerBackgroundColorOpened: Colors.black54,
                            //   header: Text('Ramona Zaman', style: _headerStyle),
                            //   content: Text(_loremIpsum, style: _contentStyle),
                            //   contentHorizontalPadding: 20,
                            //   contentBorderColor: Colors.black54,
                            // ),AccordionSection(
                            //   isOpen: false,
                            //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try3.jpg")),
                            //   headerBackgroundColor: Colors.black38,
                            //   headerBackgroundColorOpened: Colors.black54,
                            //   header: Text('Azira Petronas', style: _headerStyle),
                            //   content: Text(_loremIpsum, style: _contentStyle),
                            //   contentHorizontalPadding: 20,
                            //   contentBorderColor: Colors.black54,
                            // ),AccordionSection(
                            //   isOpen: false,
                            //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try5.jpg")),
                            //   headerBackgroundColor: Colors.black38,
                            //   headerBackgroundColorOpened: Colors.black54,
                            //   header: Text('Kila Herry', style: _headerStyle),
                            //   content: Text(_loremIpsum, style: _contentStyle),
                            //   contentHorizontalPadding: 20,
                            //   contentBorderColor: Colors.black54,
                            // ),AccordionSection(
                            //   isOpen: false,
                            //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try6.jpg")),
                            //   headerBackgroundColor: Colors.black38,
                            //   headerBackgroundColorOpened: Colors.black54,
                            //   header: Text('Izara Asiah', style: _headerStyle),
                            //   content: Text(_loremIpsum, style: _contentStyle),
                            //   contentHorizontalPadding: 20,
                            //   contentBorderColor: Colors.black54,
                            // ),AccordionSection(
                            //   isOpen: false,
                            //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try7.jpg")),
                            //   headerBackgroundColor: Colors.black38,
                            //   headerBackgroundColorOpened: Colors.black54,
                            //   header: Text('Amelia Parkson', style: _headerStyle),
                            //   content: Text(_loremIpsum, style: _contentStyle),
                            //   contentHorizontalPadding: 20,
                            //   contentBorderColor: Colors.black54,
                            // ),AccordionSection(
                            //   isOpen: false,
                            //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/BabyShima2.jpg")),
                            //   headerBackgroundColor: Colors.black38,
                            //   headerBackgroundColorOpened: Colors.black54,
                            //   header: Text('Baby Shimal', style: _headerStyle),
                            //   content: Text(_loremIpsum, style: _contentStyle),
                            //   contentHorizontalPadding: 20,
                            //   contentBorderColor: Colors.black54,
                            // ),
                          ],
                        ),
                      ),
                      contentHorizontalPadding: 20,
                      contentBorderColor: Colors.black54,
                    ),
                  )
                  // AccordionSection(
                  //   isOpen: false,
                  //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try8.jpeg")),
                  //   headerBackgroundColor: Colors.black38,
                  //   headerBackgroundColorOpened: Colors.black54,
                  //   header: Text('Nora Ghanish', style: _headerStyle),
                  //   content: Text(_loremIpsum, style: _contentStyle),
                  //   contentHorizontalPadding: 20,
                  //   contentBorderColor: Colors.black54,
                  // ),AccordionSection(
                  //   isOpen: false,
                  //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try2.jpg")),
                  //   headerBackgroundColor: Colors.black38,
                  //   headerBackgroundColorOpened: Colors.black54,
                  //   header: Text('Ramona Zaman', style: _headerStyle),
                  //   content: Text(_loremIpsum, style: _contentStyle),
                  //   contentHorizontalPadding: 20,
                  //   contentBorderColor: Colors.black54,
                  // ),AccordionSection(
                  //   isOpen: false,
                  //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try3.jpg")),
                  //   headerBackgroundColor: Colors.black38,
                  //   headerBackgroundColorOpened: Colors.black54,
                  //   header: Text('Azira Petronas', style: _headerStyle),
                  //   content: Text(_loremIpsum, style: _contentStyle),
                  //   contentHorizontalPadding: 20,
                  //   contentBorderColor: Colors.black54,
                  // ),AccordionSection(
                  //   isOpen: false,
                  //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try5.jpg")),
                  //   headerBackgroundColor: Colors.black38,
                  //   headerBackgroundColorOpened: Colors.black54,
                  //   header: Text('Kila Herry', style: _headerStyle),
                  //   content: Text(_loremIpsum, style: _contentStyle),
                  //   contentHorizontalPadding: 20,
                  //   contentBorderColor: Colors.black54,
                  // ),AccordionSection(
                  //   isOpen: false,
                  //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try6.jpg")),
                  //   headerBackgroundColor: Colors.black38,
                  //   headerBackgroundColorOpened: Colors.black54,
                  //   header: Text('Izara Asiah', style: _headerStyle),
                  //   content: Text(_loremIpsum, style: _contentStyle),
                  //   contentHorizontalPadding: 20,
                  //   contentBorderColor: Colors.black54,
                  // ),AccordionSection(
                  //   isOpen: false,
                  //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/membership_try7.jpg")),
                  //   headerBackgroundColor: Colors.black38,
                  //   headerBackgroundColorOpened: Colors.black54,
                  //   header: Text('Amelia Parkson', style: _headerStyle),
                  //   content: Text(_loremIpsum, style: _contentStyle),
                  //   contentHorizontalPadding: 20,
                  //   contentBorderColor: Colors.black54,
                  // ),AccordionSection(
                  //   isOpen: false,
                  //   leftIcon: CircleAvatar(radius:30.0,backgroundColor: Colors.transparent ,backgroundImage:  AssetImage("assets/images/BabyShima2.jpg")),
                  //   headerBackgroundColor: Colors.black38,
                  //   headerBackgroundColorOpened: Colors.black54,
                  //   header: Text('Baby Shimal', style: _headerStyle),
                  //   content: Text(_loremIpsum, style: _contentStyle),
                  //   contentHorizontalPadding: 20,
                  //   contentBorderColor: Colors.black54,
                  // ),
                ],
              ),
            ),
          ),
        )

        // AccordionSection(
        //   isOpen: false,
        //   leftIcon: const Icon(Icons.food_bank, color: Colors.white),
        //   header: Text('Company Info', style: _headerStyle),
        //   content: DataTable(
        //     sortAscending: true,
        //     sortColumnIndex: 1,
        //     dataRowHeight: 40,
        //     showBottomBorder: false,
        //     columns: [
        //       DataColumn(
        //           label: Text('ID', style: _contentStyleHeader),
        //           numeric: true),
        //       DataColumn(
        //           label: Text('Description', style: _contentStyleHeader)),
        //       DataColumn(
        //           label: Text('Price', style: _contentStyleHeader),
        //           numeric: true),
        //     ],
        //     rows: [
        //       DataRow(
        //         cells: [
        //           DataCell(Text('1',
        //               style: _contentStyle, textAlign: TextAlign.right)),
        //           DataCell(Text('Fancy Product', style: _contentStyle)),
        //           DataCell(Text(r'$ 199.99',
        //               style: _contentStyle, textAlign: TextAlign.right))
        //         ],
        //       ),
        //       DataRow(
        //         cells: [
        //           DataCell(Text('2',
        //               style: _contentStyle, textAlign: TextAlign.right)),
        //           DataCell(Text('Another Product', style: _contentStyle)),
        //           DataCell(Text(r'$ 79.00',
        //               style: _contentStyle, textAlign: TextAlign.right))
        //         ],
        //       ),
        //       DataRow(
        //         cells: [
        //           DataCell(Text('3',
        //               style: _contentStyle, textAlign: TextAlign.right)),
        //           DataCell(Text('Really Cool Stuff', style: _contentStyle)),
        //           DataCell(Text(r'$ 9.99',
        //               style: _contentStyle, textAlign: TextAlign.right))
        //         ],
        //       ),
        //       DataRow(
        //         cells: [
        //           DataCell(Text('4',
        //               style: _contentStyle, textAlign: TextAlign.right)),
        //           DataCell(
        //               Text('Last Product goes here', style: _contentStyle)),
        //           DataCell(Text(r'$ 19.99',
        //               style: _contentStyle, textAlign: TextAlign.right))
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // AccordionSection(
        //   isOpen: false,
        //   leftIcon: const Icon(Icons.contact_page, color: Colors.white),
        //   header: Text('Contact', style: _headerStyle),
        //   content: Wrap(
        //     children: List.generate(
        //         30,
        //             (index) => const Icon(Icons.contact_page,
        //             size: 30, color: Color(0xff999999))),
        //   ),
        // ),
        // AccordionSection(
        //   isOpen: false,
        //   leftIcon: const Icon(Icons.computer, color: Colors.white),
        //   header: Text('Jobs', style: _headerStyle),
        //   content: const Icon(Icons.computer,
        //       size: 200, color: Color(0xff999999)),
        // ),
        // AccordionSection(
        //   isOpen: false,
        //   leftIcon: const Icon(Icons.movie, color: Colors.white),
        //   header: Text('Culture', style: _headerStyle),
        //   content:
        //   const Icon(Icons.movie, size: 200, color: Color(0xff999999)),
        // ),
        // AccordionSection(
        //   isOpen: false,
        //   leftIcon: const Icon(Icons.people, color: Colors.white),
        //   header: Text('Community', style: _headerStyle),
        //   content:
        //   const Icon(Icons.people, size: 200, color: Color(0xff999999)),
        // ),
        // AccordionSection(
        //   isOpen: false,
        //   leftIcon: const Icon(Icons.map, color: Colors.white),
        //   header: Text('Map', style: _headerStyle),
        //   content:
        //   const Icon(Icons.map, size: 200, color: Color(0xff999999)),
        // ),
      ],
    );
  }
}

/// Main example page
class AccordionPage extends StatelessWidget //__
{
  const AccordionPage({Key? key}) : super(key: key);

  @override
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        body: Accordion(
          scrollIntoViewOfItems: ScrollIntoViewOfItems.fast,
          maxOpenSections: 2,
          headerBackgroundColorOpened: Colors.black54,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: [
            // AccordionSection(
            //   isOpen: true,
            //   leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
            //   headerBackgroundColor: Colors.black,
            //   headerBackgroundColorOpened: Colors.red,
            //   header: Text('Introduction', style: _headerStyle),
            //   content: Text(_loremIpsum, style: _contentStyle),
            //   contentHorizontalPadding: 20,
            //   contentBorderWidth: 1,
            //   // onOpenSection: () => print('onOpenSection ...'),
            //   // onCloseSection: () => print('onCloseSection ...'),
            // ),
            AccordionSection(
              isOpen: true,
              leftIcon: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/member_Try.jpeg")),
              header: Text('Maria Mariana', style: _headerStyle),
              contentBorderColor: const Color(0xffffffff),
              headerBackgroundColorOpened: Colors.amber,
              content: ListView(
                children: [
                  Accordion(
                    maxOpenSections: 1,
                    headerBackgroundColorOpened: Colors.black54,
                    headerPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    children: [
                      AccordionSection(
                        isOpen: false,
                        leftIcon: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/membership_try8.jpeg")),
                        headerBackgroundColor: Colors.black38,
                        headerBackgroundColorOpened: Colors.black54,
                        header: Text('Nora Ghanish', style: _headerStyle),
                        content: Text(_loremIpsum, style: _contentStyle),
                        contentHorizontalPadding: 20,
                        contentBorderColor: Colors.black54,
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/membership_try2.jpg")),
                        headerBackgroundColor: Colors.black38,
                        headerBackgroundColorOpened: Colors.black54,
                        header: Text('Ramona Zaman', style: _headerStyle),
                        content: Text(_loremIpsum, style: _contentStyle),
                        contentHorizontalPadding: 20,
                        contentBorderColor: Colors.black54,
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/membership_try3.jpg")),
                        headerBackgroundColor: Colors.black38,
                        headerBackgroundColorOpened: Colors.black54,
                        header: Text('Azira Petronas', style: _headerStyle),
                        content: Text(_loremIpsum, style: _contentStyle),
                        contentHorizontalPadding: 20,
                        contentBorderColor: Colors.black54,
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/membership_try5.jpg")),
                        headerBackgroundColor: Colors.black38,
                        headerBackgroundColorOpened: Colors.black54,
                        header: Text('Kila Herry', style: _headerStyle),
                        content: Text(_loremIpsum, style: _contentStyle),
                        contentHorizontalPadding: 20,
                        contentBorderColor: Colors.black54,
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/membership_try6.jpg")),
                        headerBackgroundColor: Colors.black38,
                        headerBackgroundColorOpened: Colors.black54,
                        header: Text('Izara Asiah', style: _headerStyle),
                        content: Text(_loremIpsum, style: _contentStyle),
                        contentHorizontalPadding: 20,
                        contentBorderColor: Colors.black54,
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(
                                "assets/images/membership_try7.jpg")),
                        headerBackgroundColor: Colors.black38,
                        headerBackgroundColorOpened: Colors.black54,
                        header: Text('Amelia Parkson', style: _headerStyle),
                        content: Text(_loremIpsum, style: _contentStyle),
                        contentHorizontalPadding: 20,
                        contentBorderColor: Colors.black54,
                      ),
                      AccordionSection(
                        isOpen: false,
                        leftIcon: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage("assets/images/BabyShima2.jpg")),
                        headerBackgroundColor: Colors.black38,
                        headerBackgroundColorOpened: Colors.black54,
                        header: Text('Baby Shimal', style: _headerStyle),
                        content: Text(_loremIpsum, style: _contentStyle),
                        contentHorizontalPadding: 20,
                        contentBorderColor: Colors.black54,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // AccordionSection(
            //   isOpen: false,
            //   leftIcon: const Icon(Icons.food_bank, color: Colors.white),
            //   header: Text('Company Info', style: _headerStyle),
            //   content: DataTable(
            //     sortAscending: true,
            //     sortColumnIndex: 1,
            //     dataRowHeight: 40,
            //     showBottomBorder: false,
            //     columns: [
            //       DataColumn(
            //           label: Text('ID', style: _contentStyleHeader),
            //           numeric: true),
            //       DataColumn(
            //           label: Text('Description', style: _contentStyleHeader)),
            //       DataColumn(
            //           label: Text('Price', style: _contentStyleHeader),
            //           numeric: true),
            //     ],
            //     rows: [
            //       DataRow(
            //         cells: [
            //           DataCell(Text('1',
            //               style: _contentStyle, textAlign: TextAlign.right)),
            //           DataCell(Text('Fancy Product', style: _contentStyle)),
            //           DataCell(Text(r'$ 199.99',
            //               style: _contentStyle, textAlign: TextAlign.right))
            //         ],
            //       ),
            //       DataRow(
            //         cells: [
            //           DataCell(Text('2',
            //               style: _contentStyle, textAlign: TextAlign.right)),
            //           DataCell(Text('Another Product', style: _contentStyle)),
            //           DataCell(Text(r'$ 79.00',
            //               style: _contentStyle, textAlign: TextAlign.right))
            //         ],
            //       ),
            //       DataRow(
            //         cells: [
            //           DataCell(Text('3',
            //               style: _contentStyle, textAlign: TextAlign.right)),
            //           DataCell(Text('Really Cool Stuff', style: _contentStyle)),
            //           DataCell(Text(r'$ 9.99',
            //               style: _contentStyle, textAlign: TextAlign.right))
            //         ],
            //       ),
            //       DataRow(
            //         cells: [
            //           DataCell(Text('4',
            //               style: _contentStyle, textAlign: TextAlign.right)),
            //           DataCell(
            //               Text('Last Product goes here', style: _contentStyle)),
            //           DataCell(Text(r'$ 19.99',
            //               style: _contentStyle, textAlign: TextAlign.right))
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // AccordionSection(
            //   isOpen: false,
            //   leftIcon: const Icon(Icons.contact_page, color: Colors.white),
            //   header: Text('Contact', style: _headerStyle),
            //   content: Wrap(
            //     children: List.generate(
            //         30,
            //             (index) => const Icon(Icons.contact_page,
            //             size: 30, color: Color(0xff999999))),
            //   ),
            // ),
            // AccordionSection(
            //   isOpen: false,
            //   leftIcon: const Icon(Icons.computer, color: Colors.white),
            //   header: Text('Jobs', style: _headerStyle),
            //   content: const Icon(Icons.computer,
            //       size: 200, color: Color(0xff999999)),
            // ),
            // AccordionSection(
            //   isOpen: false,
            //   leftIcon: const Icon(Icons.movie, color: Colors.white),
            //   header: Text('Culture', style: _headerStyle),
            //   content:
            //   const Icon(Icons.movie, size: 200, color: Color(0xff999999)),
            // ),
            // AccordionSection(
            //   isOpen: false,
            //   leftIcon: const Icon(Icons.people, color: Colors.white),
            //   header: Text('Community', style: _headerStyle),
            //   content:
            //   const Icon(Icons.people, size: 200, color: Color(0xff999999)),
            // ),
            // AccordionSection(
            //   isOpen: false,
            //   leftIcon: const Icon(Icons.map, color: Colors.white),
            //   header: Text('Map', style: _headerStyle),
            //   content:
            //   const Icon(Icons.map, size: 200, color: Color(0xff999999)),
            // ),
          ],
        ),
      );
} //__
