import '../../domain/entities/result_item_entity.dart';

class ResultItemModel extends ResultItemEntity {
  ResultItemModel({
    int? id,
    String? login,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
    int? score,
  }) : super(
          id: id,
          login: login,
          nodeId: nodeId,
          avatarUrl: avatarUrl,
          gravatarId: gravatarId,
          url: url,
          htmlUrl: htmlUrl,
          followersUrl: followersUrl,
          followingUrl: followingUrl,
          gistsUrl: gistsUrl,
          starredUrl: starredUrl,
          subscriptionsUrl: subscriptionsUrl,
          organizationsUrl: organizationsUrl,
          reposUrl: reposUrl,
          eventsUrl: eventsUrl,
          receivedEventsUrl: receivedEventsUrl,
          type: type,
          siteAdmin: siteAdmin,
          score: score,
        );
}
