import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _bankAccountNode;

class BankSettingPage extends StatelessWidget {
  const BankSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileSettingState(),
      child: AppSecondaryBar(
        title: 'Bank Setting',
        body: SingleChildScrollView(child: _Body()),
        bottomNavigationBar: _BottomNavigationBar(),
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
    super.initState();

    final state = context.read<ProfileSettingState>();

    state.getAllBankSettingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    _BankNameDropdown(),
                    _BankAccountForm(),
                  ],
                ),
              );
      },
    );
  }
}

class _BankNameDropdown extends StatelessWidget {
  const _BankNameDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        return AppSelectField(
          width: AppSize.widthScreen(context),
          label: 'Bank Name',
          // hint: state.profileList![0].pilihanDaerah! != ''
          //     ? state.currentDaerah![0].pilihanLabel!
          //     : 'Choose state...',
          hint: state.profileList![0].namaBank! != ''
              ? state.currentBank![0].pilihanLabel!
              : 'Choose bank...', // sementara
          items: _mapItems(state),
          onChange: (v) => state.bank = v,
          errorText: state.bankHasError ? state.bankError : null,
        );
      },
    );
  }

  _mapItems(state) {
    List list = state.bankList;
    return list
        .map((item) => appDropDownMenuItem(item.pilihanLabel, item))
        .toList();
  }
}

class _BankAccountForm extends StatefulWidget {
  const _BankAccountForm({Key? key}) : super(key: key);

  @override
  State<_BankAccountForm> createState() => _BankAccountFormState();
}

class _BankAccountFormState extends State<_BankAccountForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _bankAccountNode = FocusNode();

    final state = context.read<ProfileSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.profileList![0].bankAccount!;
      state.bankAccount = state.profileList![0].bankAccount!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _bankAccountNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.bankAccount;
        }
        return AppTextField(
          label: 'Bank Account No.',
          controller: _controller,
          focusNode: _bankAccountNode,
          hint: 'eg: 7854232568',
          keyboardType: TextInputType.text,
          errorText: state.bankAccountHasError ? state.bankAccountError : null,
          onChange: (v) => state.bankAccount = v,
          onSubmitted: (v) => state.bankAccount = v,
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppSubmitButton(
          title: 'UPDATE',
          onTap: () => _onSubmitted(context),
        ));
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = context.read<ProfileSettingState>();

    state.validateBankAll();

    if (state.bankHasError) {
      return;
    }
    if (state.bankAccountHasError) {
      _bankAccountNode.requestFocus();
      return;
    }

    state.updateBankDetails(context);

    // if(state.bank == null){
    //
    // }
  }
}
