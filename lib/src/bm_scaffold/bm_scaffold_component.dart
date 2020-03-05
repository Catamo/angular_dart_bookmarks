import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../model/bookmark.dart';
import '../bm_form/bm_form_component.dart';

@Component(
    selector: 'bm-scaffold',
    templateUrl: 'bm_scaffold_component.html',
    directives: [coreDirectives, formDirectives, BookmarkFormComponent])
class BookmarkScaffoldComponent {
  final List bookmarks = [
    Bookmark(
        title: 'Creative Bracket',
        description:
            'Go-to Dart blog containing dart resources for beginners and beyond',
        url: 'https://creativebracket.com',
        edit: false),
    Bookmark(
        title: 'Dartlang Home',
        description: 'Documentation website for the Dart language and tools',
        url: 'https://dartlang.org',
        edit: false),
    Bookmark(
        title: 'Flutter',
        description: 'Build native mobile apps with the Flutter SDK',
        url: 'https://flutter.io',
        edit: false)
  ];

  Bookmark editedBookmark;

  addBookmark() {
    bookmarks.add(Bookmark());
  }

  editBookmark(int index) {
    bookmarks[index].edit = true;
  }

  removeBookmark(int index) {
    bookmarks.removeAt(index);
  }
}
