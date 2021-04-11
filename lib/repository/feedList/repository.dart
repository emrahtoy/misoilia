import 'package:http/http.dart' as Http;
import 'package:misoilia/model/feedList/feedList.dart';
import 'package:misoilia/repository/base.dart';


class FeedListService extends BaseRepository<FeedList> {
  FeedList _feedList;

  @override
  Future<FeedList> fetchFeedList() async {
      var uri = new Uri.https(baseUri, endpoint);
      Http.Response response = await Http.get(uri);
      _feedList = FeedList.fromJson(response.body);
    return _feedList;
  }

  FeedListService() : super('/api/posts');
}

