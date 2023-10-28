class Notes {
  int? _id;
  String? _title;
  String? _description;
  String? _createdAt;
  bool? _done;

  Notes(
      {int? id,
      String? title,
      String? description,
      String? createdAt,
      bool? done}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (done != null) {
      this._done = done;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  bool? get done => _done;
  set done(bool? done) => _done = done;

  Notes.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _createdAt = json['createdAt'];
    _done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['createdAt'] = this._createdAt;
    data['done'] = this._done;
    return data;
  }
}
