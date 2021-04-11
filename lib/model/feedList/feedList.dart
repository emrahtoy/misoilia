// To parse this JSON data, do
//
//     final feedList = feedListFromJson(jsonString);

import 'dart:convert';

import 'feed.dart';


class FeedList {
	FeedList({
		this.feeds,
	});

	List<Feed> feeds;

	factory FeedList.fromJson(String str) => FeedList(
		feeds: List<Feed>.from(jsonDecode(str).map((x) =>
				Feed.fromJson(x)
		)),
	);

	String toJson(List<Feed> feedList) => jsonEncode(List<dynamic>.from(feedList.map((x) => x.toJson())));
}


