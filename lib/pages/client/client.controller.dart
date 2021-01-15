class ClientController {
  List search = [];

  List<Map> clients = [
    {
      "id": 1,
      "title": "Office Code",
      "image": "assets/images/home/build.png",
    },
    {
      "id": 2,
      "title": "Belt Bag",
      "image": "assets/images/home/repair.png",
    },
    {
      "id": 3,
      "title": "Belt Bag",
      "image": "assets/images/home/maintenance.png",
    },
    {
      "id": 4,
      "title": "Belt Bag",
      "image": "assets/images/home/build.png",
    },
    {
      "id": 5,
      "title": "Office Code",
      "image": "assets/images/home/build.png",
    },
    {
      "id": 6,
      "title": "Belt Bag",
      "image": "assets/images/home/repair.png",
    },
    {
      "id": 7,
      "title": "Belt Bag",
      "image": "assets/images/home/maintenance.png",
    },
    {
      "id": 8,
      "title": "Belt Bag",
      "image": "assets/images/home/build.png",
    }
  ];

  searchTitle(value) {
    this.search =
        clients.where((element) => (element["title"].contains(value))).toList();
    //countDataSearch = dataSearch.length;
  }
}
