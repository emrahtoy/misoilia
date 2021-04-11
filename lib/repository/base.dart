abstract class AbstractBaseRepository<T> {
  Future<T> fetchFeedList();
}

class BaseRepository<T> extends AbstractBaseRepository<T>{
  String baseUri='607348b1e4e0160017ddf739.mockapi.io'; // https will come from Uri.https method
  String endpoint;


  BaseRepository(this.endpoint);

  @override
  Future<T> fetchFeedList() {
    // TODO: implement fetchFeedList
    throw UnimplementedError();
  }
}