import 'dart:async';

import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

import '../model/bookmark.dart';

@Injectable()
class BookmarkService {
  BookmarkService() {
    initializeApp(
      apiKey: 'AIzaSyCCdZChD4LpGIBlbgU3w8Tt8XSJe4c2g3w',
      authDomain: 'bookmarks-manager-3ffbc.firebaseapp.com',
      databaseURL: 'https://bookmarks-manager-3ffbc.firebaseio.com',
      projectId: 'bookmarks-manager-3ffbc',
      storageBucket: 'bookmarks-manager-3ffbc.appspot.com',
    );

    _db = database();
    _ref = _db.ref('bookmarks').ref;
  }

  Database _db;
  DatabaseReference _ref;

  Future<List<Bookmark>> getBookmarks() async {
    final queryEvent = await _ref.once('value');
    final snapshot = queryEvent.snapshot;
    final bmData = snapshot.val();

    List<Bookmark> bookmarks;
    bookmarks = [];
    bmData?.forEach((key, value) {
      var details = value as Map<String, dynamic>;
      details['id'] = key;
      bookmarks.add(Bookmark.fromMap(details));
    });

    return bookmarks;
  }

  Future addBookmark(Bookmark bm) async {
    var res = await _ref.push(bm.asMap());
    return res.key;
  }

  Future updateBookmark(Bookmark bm) async {
    return await _ref.child(bm.id).set(bm.asMap());
  }

  Future removeBookmark(Bookmark bm) async {
    return await _ref.child(bm.id).remove();
  }
}
