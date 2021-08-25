class DemoModel {
  List<int> list1 = [];
  int value1 = 0;
  String value2 = "loi roi";

  DemoModel();

  // DemoModel.name({required this.value2});

  DemoModel.fromJson(Map<String, dynamic> json) {
    value2 = json['title'] as String;
    value1 = 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list1'] = this.list1;
    data['value1'] = this.value1;
    data['value2'] = this.value2;
    return data;
  }
}
