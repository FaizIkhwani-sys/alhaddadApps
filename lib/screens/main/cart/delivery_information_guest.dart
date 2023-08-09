import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';
import 'package:shared_preferences/shared_preferences.dart';

late FocusNode _addressNode;
late FocusNode _address2Node;
late FocusNode _address3Node;
late FocusNode _bandarNode;
late FocusNode _postcodeNode;
late FocusNode _nameNode;
late FocusNode _emailNode;
late FocusNode _noPhoneNode;

class DeliveryInformationGuestPage extends StatelessWidget {
  const DeliveryInformationGuestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CartState(),
      child: AppSecondaryBar(
        title: 'Delivery Information',
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
    final state = context.read<CartState>();
    state.getAllGuestDeliveryInformation();
    _addressNode = FocusNode();
    _address2Node = FocusNode();
    _address3Node = FocusNode();
    _bandarNode = FocusNode();
    _postcodeNode = FocusNode();
    _nameNode = FocusNode();
    _emailNode = FocusNode();
    _noPhoneNode = FocusNode();
  }

  @override
  void dispose() {
    _addressNode.dispose();
    _address2Node.dispose();
    _address3Node.dispose();
    _bandarNode.dispose();
    _postcodeNode.dispose();
    _nameNode.dispose();
    _emailNode.dispose();
    _noPhoneNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _NameForm(),
              _EmailForm(),
              _PhoneForm(),
              _AddressForm(),
              _PostCodeForm(),
              _BandarForm(),
              _NegeriDropdown(),
              _DaerahDropdown()
            ],
          ),
        );
      },
    );
  }
}

class _NameForm extends StatefulWidget {
  const _NameForm({Key? key}) : super(key: key);

  @override
  State<_NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<_NameForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<CartState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('guestName')!;
      state.guestName = _prefs.getString('guestName')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.guestName;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _nameNode,
          label: 'Name',
          hint: 'eg: MUHAMAD ABDUH BIN SALAH',
          keyboardType: TextInputType.text,
          errorText: state.guestNameHasError ? state.guestNameError : null,
          onChange: (v) => state.guestName = v,
          onSubmitted: (v) => state.guestName = v,
        );
      },
    );
  }
}

class _EmailForm extends StatefulWidget {
  const _EmailForm({Key? key}) : super(key: key);

  @override
  State<_EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<_EmailForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<CartState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('guestEmail')!;
      state.guestEmail = _prefs.getString('guestEmail')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.guestEmail;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _emailNode,
          label: 'Email',
          hint: 'eg: abduhsalah@gmail.com',
          keyboardType: TextInputType.emailAddress,
          errorText: state.guestEmailHasError ? state.guestEmailError : null,
          onChange: (v) => state.guestEmail = v,
          onSubmitted: (v) => state.guestEmail = v,
        );
      },
    );
  }
}

class _PhoneForm extends StatefulWidget {
  const _PhoneForm({Key? key}) : super(key: key);

  @override
  State<_PhoneForm> createState() => _PhoneFormState();
}

class _PhoneFormState extends State<_PhoneForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<CartState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('guestNoPhone')!;
      state.guestNoPhone = _prefs.getString('guestNoPhone')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.guestNoPhone;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _noPhoneNode,
          label: 'Number Phone',
          hint: 'eg: 0123456789',
          keyboardType: TextInputType.phone,
          errorText:
              state.guestNoPhoneHasError ? state.guestNoPhoneError : null,
          onChange: (v) => state.guestNoPhone = v,
          onSubmitted: (v) => state.guestNoPhone = v,
        );
      },
    );
  }
}

class _AddressForm extends StatefulWidget {
  const _AddressForm({Key? key}) : super(key: key);

  @override
  State<_AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<_AddressForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<CartState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('guestAddress')!;
      state.guestAddress = _prefs.getString('guestAddress')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.guestAddress;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _addressNode,
          label: 'Address',
          hint: 'eg: 16, JALAN DAGANGAN 10, TAMAN BUKIT BINTANG',
          keyboardType: TextInputType.text,
          errorText:
              state.guestAddressHasError ? state.guestAddressError : null,
          onChange: (v) => state.guestAddress = v,
          onSubmitted: (v) => state.guestAddress = v,
        );
      },
    );
  }
}

class _PostCodeForm extends StatefulWidget {
  const _PostCodeForm({Key? key}) : super(key: key);

  @override
  State<_PostCodeForm> createState() => _PostCodeFormState();
}

class _PostCodeFormState extends State<_PostCodeForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<CartState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('guestPostcode')!;
      state.guestPostcode = _prefs.getString('guestPostcode')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.guestPostcode;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _postcodeNode,
          label: 'Postal Code',
          hint: 'eg: 12345',
          keyboardType: TextInputType.phone,
          errorText:
              state.guestPostcodeHasError ? state.guestPostcodeError : null,
          onChange: (v) => state.guestPostcode = v,
          onSubmitted: (v) => state.guestPostcode = v,
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
    final state = context.read<CartState>();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences _prefs = await SharedPreferences.getInstance();

      _controller.text = _prefs.getString('guestBandar')!;
      state.guestBandar = _prefs.getString('guestBandar')!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.guestBandar;
        }
        return AppTextField(
          controller: _controller,
          focusNode: _bandarNode,
          label: 'Town',
          hint: 'eg: Bertam',
          keyboardType: TextInputType.text,
          errorText: state.guestBandarHasError ? state.guestBandarError : null,
          onChange: (v) => state.guestBandar = v,
          onSubmitted: (v) => state.guestBandar = v,
        );
      },
    );
  }
}

class _NegeriDropdown extends StatelessWidget {
  const _NegeriDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (_, state, __) {
        return state.isLoading
            ? Container()
            : AppSelectField(
                width: AppSize.widthScreen(context),
                label: 'State',
                hint: state.idNegeriGuest != ''
                    ? state.currentNegeri![0].pilihanLabel!
                    : 'Choose state...',
                items: _mapItems(state),
                onChange: (v) => state.negeriGuest = v,
                errorText:
                    state.guestNegeriHasError ? state.guestNegeriError : null,
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
    return Consumer<CartState>(
      builder: (_, state, __) {
        return state.daerahList == null
            ? Container()
            : AppSelectField(
                width: AppSize.widthScreen(context),
                label: 'District',
                hint: state.idDaerahGuest != ''
                    ? state.currentDaerah![0].pilihanLabel!
                    : 'Choose district...',
                items: _mapItems(state),
                onChange: (v) => state.daerahGuest = v,
                errorText:
                    state.guestDaerahHasError ? state.guestDaerahError : null,
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

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppSubmitButton(
          title: 'SUBMIT',
          onTap: () => _onSubmitted(context),
        ));
  }

  Future<void> _onSubmitted(BuildContext context) async {
    final state = context.read<CartState>();

    state.validateAllGuestDeliveryInformation();

    if (state.guestNameHasError) {
      _nameNode.requestFocus();
      return;
    }
    if (state.guestEmailHasError) {
      _emailNode.requestFocus();
      return;
    }
    if (state.guestNoPhoneHasError) {
      _noPhoneNode.requestFocus();
      return;
    }
    if (state.guestAddressHasError) {
      _addressNode.requestFocus();
      return;
    }
    if (state.guestPostcodeHasError) {
      _postcodeNode.requestFocus();
      return;
    }
    if (state.guestBandarHasError) {
      _bandarNode.requestFocus();
      return;
    }

    await state.saveGuestInformation(context);
  }
}
