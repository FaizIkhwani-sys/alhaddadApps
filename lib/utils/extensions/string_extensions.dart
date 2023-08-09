extension StringExtensions on String? {
  bool get isNullOrWhiteSpace {
    return this == null || this!.trim().isEmpty;
  }
}

extension EmailExtensions on String? {
  bool get isEmail {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(this!);
  }
}

extension IPExtensions on String? {
  bool get isIP {
    final regex = RegExp(
        r"^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$");
    return regex.hasMatch(this!);
  }
}

extension CapExtension on String {
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get capitalizeFirstofEach {
    if (isNullOrWhiteSpace) return '';
    return toLowerCase()
        .replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.inCaps)
        .join(' ');
  }
}

extension PhoneExtensions on String? {
  bool get isPhoneNumber {
    if (this!.length > 9 && this!.length < 12) {
      return true;
    } else {
      return false;
    }
  }
}

extension PortExtensions on String? {
  bool get isPortNumber {
    if (this!.length > 1 && this!.length <= 5) {
      return true;
    } else {
      return false;
    }
  }
}
