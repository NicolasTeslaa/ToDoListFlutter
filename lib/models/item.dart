class Item {
  String title = '';
  bool done = false;

  Item({required this.title, required this.done});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
    done = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['done'] = done;
    return data;
  }
}
