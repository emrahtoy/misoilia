import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:misoilia/block/feedList/events.dart';
import 'package:misoilia/block/feedList/states.dart';
import 'package:misoilia/model/feedList/feedList.dart';
import 'package:misoilia/repository/feedList/exceptions.dart';
import 'package:misoilia/repository/feedList/repository.dart';

class FeedListBloc extends Bloc<FeedListEvents, FeedListState> {
  final FeedListService feedListService;
  FeedList feedList;

  FeedListBloc({this.feedListService}) : super(FeedListInitial());

  @override
  Stream<FeedListState> mapEventToState(FeedListEvents event) async* {
    var result;
    switch (event) {
      case FeedListEvents.fetchFeeds:
        yield FeedListLoading();
        result = await _fetch();
        yield result;
        break;
      case FeedListEvents.feedsLoading:
      case FeedListEvents.newFeedsExist:
      case FeedListEvents.feedsLoaded:
      case FeedListEvents.hitTheEndOfList:
    }
  }

  _fetch() async {
    try {
      FeedList newFeedList = await feedListService.fetchFeedList();
      feedList = newFeedList;
      return FeedListLoaded(feedList: feedList); // named parameter
    } on SocketException {
      return FeedListError(
          error: NoInternetException("Internet connection failed"));
    } on HttpException {
      return FeedListError(
          error: ServiceNotFoundException(
              "Can not be reached to the service : ${feedListService.endpoint}"));
    } on FormatException {
      return FeedListError(
          error: InvalidJsonFormatException("Json could not be encoded"));
    } catch (exception) {
      return FeedListError(error: UnknownException("Unknown error occured"));
    }
  }
}
