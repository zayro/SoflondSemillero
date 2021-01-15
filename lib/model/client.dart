class ClientModel {
  final String avatar, name, description;
  final int id;

  ClientModel({
    this.id,
    this.avatar,
    this.name,
    this.description,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json["id"],
      name: json["name"],
      avatar: json["avatar"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'avatar': this.avatar,
        'name': this.name,
        'description': this.description,
      };
}

List<Map> clients = [
  {
    "id": 1,
    "name": "Office Code",
    "avatar": "assets/avatars/home/build.png",
  },
  {
    "id": 2,
    "name": "Belt Bag",
    "avatar": "assets/avatars/home/repair.png",
  },
  {
    "id": 3,
    "name": "df Bag",
    "avatar": "assets/avatars/home/maintenance.png",
  },
  {
    "id": 4,
    "name": "ggg Bag",
    "avatar": "assets/avatars/home/build.png",
  },
  {
    "id": 5,
    "name": "aaa Code",
    "avatar": "assets/avatars/home/build.png",
  },
  {
    "id": 6,
    "name": "yuy Bag",
    "avatar": "assets/avatars/home/repair.png",
  },
  {
    "id": 7,
    "name": "ddf Bag",
    "avatar": "assets/avatars/home/maintenance.png",
  },
  {
    "id": 8,
    "name": "gggrr Bag",
    "avatar": "assets/avatars/home/build.png",
  },
];

List<ClientModel> clientExample = [
  ClientModel(
    id: 1,
    name: "Office Code",
    avatar: "assets/avatars/home/build.png",
  ),
  ClientModel(
    id: 2,
    name: "Belt Bag",
    avatar: "assets/avatars/home/repair.png",
  ),
  ClientModel(
    id: 2,
    name: "Belt Bag",
    avatar: "assets/avatars/home/maintenance.png",
  ),
  ClientModel(
    id: 2,
    name: "Belt Bag",
    avatar: "assets/avatars/home/build.png",
  )
];
