import 'package:flutter/material.dart';
import 'package:apps_al_haddad/al_haddad.dart';

late FocusNode _nameNode;
late FocusNode _usernameNode;
late FocusNode _phoneNode;
late FocusNode _emailNode;

class ProfileSettingPage extends StatelessWidget {
  const ProfileSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileSettingState(),
      child: AppSecondaryBar(
        title: 'Profile Setting',
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: _Body(),
        )),
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

    state.getAll();

    _nameNode = FocusNode();
    _usernameNode = FocusNode();
    _phoneNode = FocusNode();
    _emailNode = FocusNode();
  }

  @override
  void dispose() {
    _nameNode.dispose();
    _usernameNode.dispose();
    _phoneNode.dispose();
    _emailNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        return state.isLoading
            ? AppLoadingOverlay()
            : Column(
                children: [
                  _NameForm(),
                  _UserNameForm(),
                  // _GenderDropdown(),
                  _DOBForm(),
                  _PhoneForm(),
                  _EmailForm(),
                  _SubmitButton(),
                ],
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
    final state = context.read<ProfileSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.profileList![0].namaPenuh!;
      state.name = state.profileList![0].namaPenuh!;

      print(state.profileList![0].namaPenuh!);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.name;
        }
        return AppTextField(
          label: 'Name',
          controller: _controller,
          focusNode: _nameNode,
          hint: 'eg: NUR IZZATI BINTI AKMA',
          keyboardType: TextInputType.text,
          errorText: state.nameHasError ? state.nameError : null,
          onChange: (v) => state.name = v,
          onSubmitted: (v) => state.name = v,
        );
      },
    );
  }
}

class _UserNameForm extends StatefulWidget {
  const _UserNameForm({Key? key}) : super(key: key);

  @override
  State<_UserNameForm> createState() => _UserNameFormState();
}

class _UserNameFormState extends State<_UserNameForm> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<ProfileSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.usersList![0].username!;
      state.userName = state.usersList![0].username!;
      print(state.userName);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.userName!;
        }
        return AppTextField(
          label: 'Username',
          controller: _controller,
          focusNode: _usernameNode,
          hint: 'eg: izzatie',
          keyboardType: TextInputType.text,
          errorText: state.userNameHasError ? state.userNameError : null,
          onChange: (v) => state.userName = v,
          onSubmitted: (v) => state.userName = v,
        );
      },
    );
  }
}

class _GenderDropdown extends StatelessWidget {
  const _GenderDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        return AppSelectField(
          width: AppSize.widthScreen(context),
          value: state.gender,
          label: 'Gender',
          hint: 'Gender...',
          items: _mapItems(state),
          onChange: (v) => state.gender = v,
          errorText: state.genderHasError ? state.genderError : null,
        );
      },
    );
  }

  _mapItems(state) {
    List list = state.genderList;
    return list
        .map((item) => appDropDownMenuItem(item.pilihanLabel, item))
        .toList();
  }
}

class _DOBForm extends StatelessWidget {
  const _DOBForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        return Column(
          children: [
            DOB(
              onTap: () {
                state.pickDOB(context);
              },
              birthDate: state.profileList![0].tarikhLahir! != ''
                  ? state.birthDate != ''
                      ? state.birthDate
                      : state.profileList![0].tarikhLahir!
                  : 'Please Choose',
            ),
            if (state.birthDateHasError)
              TextManrope(
                text: '     ${state.birthDateError}',
                fontSize: 12,
                color: dangerColor,
              )
          ],
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
    final state = context.read<ProfileSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.profileList![0].noTel!;
      state.phone = state.profileList![0].noTel!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.phone;
        }
        return AppTextField(
          label: 'Phone Number',
          controller: _controller,
          focusNode: _phoneNode,
          hint: 'eg: 0123456780',
          keyboardType: TextInputType.phone,
          errorText: state.phoneHasError ? state.phoneError : null,
          onChange: (v) => state.phone = v,
          onSubmitted: (v) => state.phone = v,
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
    final state = context.read<ProfileSettingState>();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.text = state.usersList![0].email!;
      state.email = state.usersList![0].email!;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileSettingState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.email;
        }
        return AppTextField(
          label: 'Email',
          controller: _controller,
          focusNode: _emailNode,
          hint: 'eg: izzati@gmail.com',
          keyboardType: TextInputType.emailAddress,
          errorText: state.emailHasError ? state.emailError : null,
          onChange: (v) => state.email = v,
          onSubmitted: (v) => state.email = v,
        );
      },
    );
  }
}

class DOB extends StatelessWidget {
  final Function() onTap;
  final String birthDate;

  const DOB({required this.onTap, required this.birthDate, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.widthScreen(context),
      child: Column(
        crossAxisAlignment: AppSize.crossCenter,
        children: [
          InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TextManrope(
                  text: 'Date of Birth',
                  color: labelTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: AppSize.spaceX8),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: lightColor,
                  ),
                  child: SizedBox(
                    width: AppSize.widthScreen(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 16.0,
                      ),
                      child: TextManrope(
                        text: birthDate,
                        textAlign: TextAlign.left,
                        fontSize: 14,
                        color: labelTextColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize.spaceX16),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSubmitButton(
        onTap: () {
          _onSubmitted(context);
        },
        title: 'UPDATE');
  }

  _onSubmitted(BuildContext context) async {
    final state = context.read<ProfileSettingState>();

    state.validateAll();

    if (state.nameHasError) {
      _nameNode.requestFocus();
      return;
    }
    if (state.userNameHasError) {
      _usernameNode.requestFocus();
      return;
    }
    if (state.birthDateHasError) {
      return;
    }
    if (state.phoneHasError) {
      _phoneNode.requestFocus();
      return;
    }
    if (state.emailHasError) {
      _emailNode.requestFocus();
      return;
    }

    state.updateProfile(context);
  }
}
