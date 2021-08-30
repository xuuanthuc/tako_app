class Brand {
  String? brandId;
  String? brandName;
  String? thumbnail;
  String? closeTime;
  String? openTime;
  List<Branch>? branchs;

  Brand(
      {this.brandName,
      this.thumbnail,
      this.branchs,
      this.brandId,
      this.closeTime,
      this.openTime});

// factory Brand.fromMap(Map<String, dynamic> map) {
//   List<Branch> branchs = [];
//   if (map['branchs'] != null) {
//     map['branchs'].forEach((v) {
//       branchs.add(Branch.fromMap(v));
//     });
//   }
//   return Brand(
//       brandId: map['key'] ?? '',
//       brandName: map['brandName'] ?? '',
//       closeTime: map['closeTime'] ?? '',
//       openTime: map['openTime'] ?? '',
//       thumbnail: map['thumbnail'] ?? '',
//       branchs: branchs);
// }
}

class Branch {
  String? branchName;
  String? address;
  String? district;
  String? brandId;
  String? branchId;
  List<MenuItem>? menuItem;

  Branch(
      {this.branchName,
      this.branchId,
      this.brandId,
      this.address,
      this.district,
      this.menuItem});

// factory Branch.fromMap(Map<String, dynamic> map) {
//   return Branch(
//     id: map['id'],
//     branchName: map['branchName'],
//     address: map['address'],
//     district: map['district'],
//   );
// }
}

class MenuItem {
  String? brandId;
  String? branchId;
  String? item;
  String? price;
  String? menuId;
  String? image;
  String? branchName;
  String? address;
  String? district;
  String? type;

  MenuItem(
      {this.item,
      this.menuId,
      this.price,
      this.image,
      this.branchId,
      this.brandId,
      this.branchName,
      this.address,
      this.district,
      this.type});

// factory MenuItem.fromMap(Map<String, dynamic> map) {
//   return MenuItem(
//     id: map['id'],
//     branchName: map['branchName'],
//     address: map['address'],
//     district: map['district'],
//   );
// }
}
