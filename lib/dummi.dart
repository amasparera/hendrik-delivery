const String rendang =
    "https://images.unsplash.com/photo-1606143704849-eb181ba1543a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80";
const String mie =
    "https://images.unsplash.com/photo-1663861622943-d21bb13f414f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=976&q=80";
const String person =
    "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";

class Menu {
  final String title, image;
  final double price;

  Menu({required this.title, required this.image, required this.price});
}

class CategoryMenu {
  final String category;
  final List<Menu> items;

  CategoryMenu({required this.category, required this.items});
}

final List<CategoryMenu> demoCategoryMenus = [
  CategoryMenu(
    category: "Menu Utama",
    items: [
      Menu(
        price: 7.4,
        image: "assets/images/f_0.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        price: 9.0,
        image: "assets/images/f_1.png",
        title: "Chow Fun",
      ),
      Menu(
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Cookie Sandwich",
      ),
    ],
  ),
  CategoryMenu(
    category: "Snack",
    items: [
      Menu(
        price: 7.4,
        image: "assets/images/f_4.png",
        title: "Combo Burger",
      ),
      Menu(
        price: 9.0,
        image: "assets/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Menu(
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Oyster Dish",
      ),
    ],
  ),
  CategoryMenu(
    category: "Minuman",
    items: [
      Menu(
        price: 7.4,
        image: "assets/images/f_6.png",
        title: "Oyster Dish",
      ),
      Menu(
        price: 9.0,
        image: "assets/images/f_7.png",
        title: "Oyster On Ice",
      ),
      Menu(
        price: 8.5,
        image: "assets/images/f_8.png",
        title: "Fried Rice on Pot",
      ),
    ],
  ),
  CategoryMenu(
    category: "Tambahan",
    items: [
      Menu(
        price: 8.5,
        image: "assets/images/f_2.png",
        title: "Dim SUm",
      ),
      Menu(
        price: 7.4,
        image: "assets/images/f_0.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        price: 9.0,
        image: "assets/images/f_5.png",
        title: "Combo Sandwich",
      ),
      Menu(
        price: 12.4,
        image: "assets/images/f_3.png",
        title: "Cookie Sandwich",
      ),
      Menu(
        price: 9.0,
        image: "assets/images/f_1.png",
        title: "Chow Fun",
      ),
    ],
  ),
];
