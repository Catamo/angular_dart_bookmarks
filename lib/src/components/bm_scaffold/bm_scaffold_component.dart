import 'package:angular/angular.dart';

import '../../model/bookmark.dart';
import '../bm_form/bm_form_component.dart';
import '../../services/bookmark_service.dart';

@Component(
  selector: 'bm-scaffold',
  templateUrl: 'bm_scaffold_component.html',
  directives: [
    coreDirectives,
    BookmarkFormComponent,
  ],
  providers: [
    ClassProvider(BookmarkService),
  ],
)
class BookmarkScaffoldComponent implements OnInit {
  BookmarkScaffoldComponent(this._bookmarkService);

  final BookmarkService _bookmarkService;
  List bookmarks = [];
  bool isLoading = true;

  Bookmark editedBookmark;

  @override
  Future<Null> ngOnInit() async {
    bookmarks = await _bookmarkService.getBookmarks();
    isLoading = false;
  }

  void addBookmark() {
    bookmarks.add(Bookmark());
  }

  void editBookmark(int index) {
    bookmarks[index].edit = true;
  }

  void removeBookmark(int index) async {
    var bm = bookmarks[index];
    await _bookmarkService.removeBookmark(bm);
    bookmarks.removeAt(index);
  }

  void updateBookmark(int index) async {
    var bm = bookmarks[index];

    if (bm.id == null) {
      var resId = await _bookmarkService.addBookmark(bm);
      bm.id = resId;
    } else {
      await _bookmarkService.updateBookmark(bm);
    }
  }
}
