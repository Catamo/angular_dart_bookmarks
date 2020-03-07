class Bookmark {
  Bookmark({
    this.id,
    this.title = '',
    this.description = '',
    this.url = '',
    this.edit = true,
  });

  Bookmark.fromMap(Map bm)
      : this(
          id: bm['id'],
          title: bm['title'],
          description: bm['description'],
          edit: bm['edit'] ?? false,
          url: bm['url'],
        );

  Map asMap() => {'title': title, 'description': description, 'url': url};

  void update(Bookmark bm) {
    title = bm.title;
    description = bm.description;
    url = bm.url;
    edit = bm.edit;
  }

  String id;
  String title;
  String description;
  String url;
  bool edit;
}
