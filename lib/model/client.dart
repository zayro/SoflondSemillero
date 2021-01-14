class ClientModel {
  final String image, title, description;
  final int id;

  ClientModel({
    this.id,
    this.image,
    this.title,
    this.description,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'image': this.image,
        'title': this.title,
        'description': this.description,
      };
}

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
    "id": 2,
    "title": "Belt Bag",
    "image": "assets/images/home/maintenance.png",
  },
  {
    "id": 2,
    "title": "Belt Bag",
    "image": "assets/images/home/build.png",
  }
];

List<ClientModel> clientExample = [
  ClientModel(
    id: 1,
    title: "Office Code",
    image: "assets/images/home/build.png",
  ),
  ClientModel(
    id: 2,
    title: "Belt Bag",
    image: "assets/images/home/repair.png",
  ),
  ClientModel(
    id: 2,
    title: "Belt Bag",
    image: "assets/images/home/maintenance.png",
  ),
  ClientModel(
    id: 2,
    title: "Belt Bag",
    image: "assets/images/home/build.png",
  )
];
