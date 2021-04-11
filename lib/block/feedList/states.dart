import 'package:equatable/equatable.dart';
import 'package:misoilia/model/feedList/feedList.dart';

abstract class FeedListState extends Equatable {
  @override
  List<Object> get props => [];
}

class FeedListInitial extends FeedListState {}

class FeedListLoading extends FeedListState {}

class FeedListLoaded extends FeedListState {
  final FeedList feedList;
  FeedListLoaded({this.feedList});
}

class FeedListError extends FeedListState {
  final error;
  FeedListError({this.error});
}