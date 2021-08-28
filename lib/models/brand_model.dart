class Brand {
  String? key;
  String? brandName;
  String? thumbnail;
  List<Branch>? branchs;

  Brand({this.brandName, this.thumbnail, this.branchs, this.key});

  factory Brand.fromMap(Map<String, dynamic> map) {
    List<Branch> branchs = [];
    if (map['branchs'] != null) {
      map['branchs'].forEach((v) {
        branchs.add(Branch.fromMap(v));
      });
    }
    return Brand(
        key: map['key'] ?? '',
        brandName: map['brandName'] ?? '',
        thumbnail: map['thumbnail'] ?? '',
        branchs: branchs);
  }
}

class Branch {
  String? branchName;
  String? id;
  Branch({this.branchName, this.id});

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      id: map['id'],
      branchName: map['branchName'],
    );
  }
}
