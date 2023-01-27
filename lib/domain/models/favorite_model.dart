class FavoriteModel {
  final String? canteen;
  final String? menu;
  final String? name;
  final String? price;
  final String? categoryNemu;
  final String? desc;
  final String? statusMenu;
  final String? menuPhoto;
  final String? isFavorite;

  FavoriteModel(
      {this.canteen,
      this.menu,
      this.name,
      this.price,
      this.categoryNemu,
      this.desc,
      this.statusMenu,
      this.menuPhoto,
      this.isFavorite});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
        canteen: json['canteen'],
        categoryNemu: json["category_menu"],
        desc: json["description"],
        isFavorite: json["is_favorite"],
        menu: json["menu"],
        menuPhoto: json["menu_photo"],
        name: json["name"],
        price: json["price"],
        statusMenu: json["status_menu"]);
  }
}



//  "canteen": "5415592a79dcfeb5e5578e54f21fc3e5db24a7a5d8e454d03af3950eca693ecf6a1fb848cb66a557c8a6225cbad973749a99057344cfd965a8ebddc43f77ccf3CvXtUxuJs8ZEkgQMb1%2BNBbxMMu99MtymM5spUI9b14k%3D",
//       "menu": "292ec01bca90a5aa50843ae7440e349254f0ff3b54b5dfa977dfbd572f223523dd947d3c7e9ab3bdb5ac70b1c68f51faf63602398c6ee8a36cae73453b833a54cJYRa9YMgkTNHAz63yuY7Sh4eXC66Bof2EKQFMT8peE%3D",
//       "name": "Nasi Goreng",
//       "price": "10000",
//       "category_menu": "1",
//       "description": "Masakan oalah rumahan pasti enak dijamin oleh para pembeli yang kelaparan",
//       "status_menu": "1",
//       "menu_photo": "http://192.168.43.74/e-kantin/upload/menu/Nasi_Goreng.jpg",
//       "is_favorite": "1"