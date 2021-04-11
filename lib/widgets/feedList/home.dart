import 'package:flutter/material.dart';
import 'package:misoilia/block/feedList/bloc.dart';
import 'package:misoilia/block/feedList/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:misoilia/block/feedList/states.dart';
import 'package:misoilia/model/feedList/feed.dart';

class FeedListWidget extends StatefulWidget {
  final String title;

  FeedListWidget({Key key, this.title}) : super(key: key);

  @override
  _FeedListWidgetState createState() => _FeedListWidgetState();
}

class _FeedListWidgetState extends State<FeedListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: _body(),
        ));
  }

  Widget _body() {
    return Column(children: [
      BlocBuilder<FeedListBloc, FeedListState>(
        builder: (BuildContext context, FeedListState state) {
          if (state is FeedListLoaded) {
            return _list(state.feedList.feeds);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    ]);
  }

  Widget _list(List<Feed> feeds) {
    return Expanded(
        child: ListView.builder(
            itemCount: feeds.length,
            itemBuilder: (_, index) {
              if (index == feeds.length-1) {
               // context.read<FeedListBloc>().add(FeedListEvents.feedsLoading);
              }
              return Text(feeds[index].owner);
            }));
  }

  @override
  void initState() {
    super.initState();
    _loadFeedList();
  }

  _loadFeedList() async {
    //context.bloc<FeedListBlock>().add(FeedListEvents.fetchFeeds);
    context.read<FeedListBloc>().add(FeedListEvents.fetchFeeds);
  }
}
