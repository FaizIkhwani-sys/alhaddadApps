import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

class StatisticData extends StatelessWidget {
  const StatisticData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StatisticDataState(),
      child: SingleChildScrollView(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopContainer(),
        _TitleAndSeeAllText(
          label: "Statistic Category",
        ),
        _SelectionCard(),
        _TitleAndSeeAllText(
          label: "Latest Statistics",
        ),
        _DetailsCard(),
        // _SelectionCircleCard(),
      ],
    );
  }
}

class _TopContainer extends StatelessWidget {
  const _TopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.heightScreen(context) * 0.15,
      width: AppSize.widthScreen(context),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryColor,
              primaryColor.withOpacity(0.5),
              // Colors.white.withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Statistic",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Manrope",
                // color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
                // letterSpacing: 0.96,
              ),
              children: [
                TextSpan(
                  text: " Data",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Muli",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 0.96,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectionCard extends StatelessWidget {
  const _SelectionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticDataState>(
      builder: (context, state, child) {
        return Container(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: state.namaMenu.length,
            itemBuilder: (BuildContext context, int index) {
              return AppsHomeMenuCard(
                menuName: "${state.namaMenu[index]}",
                icons: state.iconMenuHomeAdmin[index],
                colors: Colors.primaries[
                            state.random.nextInt(Colors.primaries.length)]
                        [state.random.nextInt(9) * 100] ??
                    primaryColor,
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.0,
            ),
            padding: const EdgeInsets.all(10),
          ),
        );
      },
    );
  }
}

class _SelectionCircleCard extends StatelessWidget {
  const _SelectionCircleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticDataState>(
      builder: (context, state, child) {
        return Container(
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: state.namaMenu.length,
            itemBuilder: (BuildContext context, int index) {
              return AppCircleMenu(
                onTap: () {},
                title: "${state.namaMenu[index]}",
                icon: state.iconMenuHomeAdmin[index],
                color: Colors.primaries[
                            state.random.nextInt(Colors.primaries.length)]
                        [state.random.nextInt(9) * 100] ??
                    primaryColor,
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1.0,
            ),
            padding: const EdgeInsets.all(10),
          ),
        );
      },
    );
  }
}

class _TitleAndSeeAllText extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _TitleAndSeeAllText({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Color(0xff192434),
              fontWeight: FontWeight.w600,
              fontFamily: 'Manrope',
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StatisticDataState>(
      builder: (context, state, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...List.generate(
              state.titleContoh.length,
              (index) => AppMenuCard(
                colors: Colors.primaries[
                            state.random.nextInt(Colors.primaries.length)]
                        [state.random.nextInt(9) * 100] ??
                    primaryColor,
                title: "${state.titleContoh[index]}",
                onTap: () {},
                subtitle: '10 May - 17 May',
              ),
            )
          ],
        );
      },
    );
  }
}
