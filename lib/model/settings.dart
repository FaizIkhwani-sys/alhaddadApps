class Setting {
  String? id;
  String? catSetting;
  String? tooltip;
  String? label;
  String? parameter;
  String? value;
  String? value2;
  String? value3;
  String? valType;
  String? maxlevel;
  String? typeInput;
  String? readOnly;
  String? hideSetting;

  Setting(
      {this.id,
        this.catSetting,
        this.tooltip,
        this.label,
        this.parameter,
        this.value,
        this.value2,
        this.value3,
        this.valType,
        this.maxlevel,
        this.typeInput,
        this.readOnly,
        this.hideSetting});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catSetting = json['catSetting'];
    tooltip = json['tooltip'];
    label = json['label'];
    parameter = json['parameter'];
    value = json['value'];
    value2 = json['value2'];
    value3 = json['value3'];
    valType = json['valType'];
    maxlevel = json['maxlevel'];
    typeInput = json['typeInput'];
    readOnly = json['readOnly'];
    hideSetting = json['hideSetting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catSetting'] = this.catSetting;
    data['tooltip'] = this.tooltip;
    data['label'] = this.label;
    data['parameter'] = this.parameter;
    data['value'] = this.value;
    data['value2'] = this.value2;
    data['value3'] = this.value3;
    data['valType'] = this.valType;
    data['maxlevel'] = this.maxlevel;
    data['typeInput'] = this.typeInput;
    data['readOnly'] = this.readOnly;
    data['hideSetting'] = this.hideSetting;
    return data;
  }
}