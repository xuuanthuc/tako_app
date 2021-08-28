class Brand {
  String? key;
  String? brandName;
  String? thumbnail;
  String? closeTime;
  String? openTime;
  List<Branch>? branchs;

  Brand(
      {this.brandName,
      this.thumbnail,
      this.branchs,
      this.key,
      this.closeTime,
      this.openTime});

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
        closeTime: map['closeTime'] ?? '',
        openTime: map['openTime'] ?? '',
        thumbnail: map['thumbnail'] ?? '',
        branchs: branchs);
  }
}

class Branch {
  String? branchName;
  String? address;
  String? district;
  String? key;
  String? id;
  List<MenuItem>? menuItem;

  Branch(
      {this.branchName,
      this.key,
      this.id,
      this.address,
      this.district,
      this.menuItem});

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      id: map['id'],
      branchName: map['branchName'],
      address: map['address'],
      district: map['district'],
    );
  }
}

class MenuItem {
  String? keyRoot;
  String? keyBranch;
  String? item;
  String? price;
  String? id;
  String? image;
  String? branchName;
  String? address;
  String? district;

  MenuItem({
    this.item,
    this.id,
    this.price,
    this.image,
    this.keyBranch,
    this.keyRoot,
    this.branchName,
    this.address,
    this.district,
  });

// factory MenuItem.fromMap(Map<String, dynamic> map) {
//   return MenuItem(
//     id: map['id'],
//     branchName: map['branchName'],
//     address: map['address'],
//     district: map['district'],
//   );
// }
}
