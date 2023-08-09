import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _addressNode;
late FocusNode _address2Node;
late FocusNode _address3Node;
late FocusNode _bandarNode;
late FocusNode _postcodeNode;

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AddressSettingState(),
      child: AppSecondaryBar(
        title: 'Edit Address',
        body: SingleChildScrollView(child: _Body()),
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
    context.read<AddressSettingState>().getEdit();
    _addressNode = FocusNode();
    _address2Node = FocusNode();
    _address3Node = FocusNode();
    _bandarNode = FocusNode();
    _postcodeNode = FocusNode();
  }

  @override
  void dispose() {
    _addressNode.dispose();
    _address2Node.dispose();
    _address3Node.dispose();
    _bandarNode.dispose();
    _postcodeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    _Address1Form(),
                    _Address2Form(),
                    _Address3Form(),
                    _PostcodeForm(),
                    _BandarForm(),
                    _NegeriDropdown(),
                    _DaerahDropdown(),
                    _Button(),
                  ],
                ),
              );
      },
    );
  }
}

class _Address1Form extends StatefulWidget {
  const _Address1Form({Key? key}) : super(key: key);

  @override
  State<_Address1Form> createState() => _Address1FormState();
}

class _Address1FormState extends State<_Address1Form> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AddressSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.order![0].alamat!;
      state.address = state.order![0].alamat!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _addressNode,
          label: 'Address',
          hint: 'eg: 6, LORONG MAKMUR, 11/7 TAMAN MAKMUR',
          keyboardType: TextInputType.text,
          errorText: state.addressHasError ? state.addressError : null,
          onChange: (v) => state.address = v,
          onSubmitted: (v) => state.address = v,
        );
      },
    );
  }
}

class _Address2Form extends StatefulWidget {
  const _Address2Form({Key? key}) : super(key: key);

  @override
  State<_Address2Form> createState() => _Address2FormState();
}

class _Address2FormState extends State<_Address2Form> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AddressSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.order![0].alamat2!;
      state.address2 = state.order![0].alamat2!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address2;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _address2Node,
          keyboardType: TextInputType.text,
          onChange: (v) => state.address2 = v,
          onSubmitted: (v) => state.address2 = v,
        );
      },
    );
  }
}

class _Address3Form extends StatefulWidget {
  const _Address3Form({Key? key}) : super(key: key);

  @override
  State<_Address3Form> createState() => _Address3FormState();
}

class _Address3FormState extends State<_Address3Form> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AddressSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.order![0].alamat3!;
      state.address3 = state.order![0].alamat3!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.address3;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _address3Node,
          keyboardType: TextInputType.text,
          onChange: (v) => state.address3 = v,
          onSubmitted: (v) => state.address3 = v,
        );
      },
    );
  }
}

class _PostcodeForm extends StatefulWidget {
  const _PostcodeForm({Key? key}) : super(key: key);

  @override
  State<_PostcodeForm> createState() => _PostcodeFormState();
}

class _PostcodeFormState extends State<_PostcodeForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AddressSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.order![0].poskod!;
      state.postcode = state.order![0].poskod!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.postcode;
        }
        return AppTextField(
          label: 'Postcode',
          controller: _controller,
          focusNode: _postcodeNode,
          hint: 'eg: 12345',
          keyboardType: TextInputType.text,
          errorText: state.postcodeHasError ? state.postcodeError : null,
          onChange: (v) => state.postcode = v,
          onSubmitted: (v) => state.postcode = v,
        );
      },
    );
  }
}

class _BandarForm extends StatefulWidget {
  const _BandarForm({Key? key}) : super(key: key);

  @override
  State<_BandarForm> createState() => _BandarFormState();
}

class _BandarFormState extends State<_BandarForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AddressSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.order![0].bandar!;
      state.bandar = state.order![0].bandar!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.bandar;
        }
        return AppTextField(
          label: 'City',
          controller: _controller,
          focusNode: _bandarNode,
          hint: 'eg: KEPALA BATAS',
          keyboardType: TextInputType.text,
          errorText: state.bandarHasError ? state.bandarError : null,
          onChange: (v) => state.bandar = v,
          onSubmitted: (v) => state.bandar = v,
        );
      },
    );
  }
}

class _NegeriDropdown extends StatelessWidget {
  const _NegeriDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        return AppSelectField(
          width: AppSize.widthScreen(context),
          label: 'State',
          hint: state.order![0].negeri! != ''
              ? state.currentNegeri![0].pilihanLabel!
              : 'Choose state...',
          items: _mapItems(state),
          onChange: (v) => state.negeri = v,
          errorText: state.negeriHasError ? state.negeriError : null,
        );
      },
    );
  }

  _mapItems(state) {
    List list = state.negeriList;
    return list
        .map((item) => appDropDownMenuItem(item.pilihanLabel, item))
        .toList();
  }
}

class _DaerahDropdown extends StatelessWidget {
  const _DaerahDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressSettingState>(
      builder: (_, state, __) {
        return state.daerahList == null
            ? Container()
            : AppSelectField(
                width: AppSize.widthScreen(context),
                label: 'District',
                hint: state.order![0].daerah! != ''
                    ? state.currentDaerah![0].pilihanLabel!
                    : 'Choose state...',
                items: _mapItems(state),
                onChange: (v) => state.daerah = v,
                errorText: state.daerahHasError ? state.daerahError : null,
              );
      },
    );
  }

  _mapItems(state) {
    List list = state.daerahList;
    return list
        .map((item) => appDropDownMenuItem(item.pilihanLabel, item))
        .toList();
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 10, 26, 10),
      child: AppSubmitButton(
          onTap: () {
            _onSubmitted(context);
          },
          title: 'SAVE'),
    );
  }

  _onSubmitted(BuildContext context) async {
    final state = context.read<AddressSettingState>();

    state.validateAll();

    if (state.addressHasError) {
      _addressNode.requestFocus();
      return;
    }
    if (state.postcodeHasError) {
      _postcodeNode.requestFocus();
      return;
    }
    if (state.bandarHasError) {
      _bandarNode.requestFocus();
      return;
    }

    state.updateOrderAddress(context);
  }
}
