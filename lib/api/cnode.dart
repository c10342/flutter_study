import 'package:flutter_haokezu/utils/request.dart';

class GetTopicsListRespond {
  bool? success;
  List<GetTopicsListItem>? data;

  GetTopicsListRespond({this.success, this.data});

  GetTopicsListRespond.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <GetTopicsListItem>[];
      json['data'].forEach((v) {
        data!.add(GetTopicsListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetTopicsListItem {
  String? id;
  String? authorId;
  String? tab;
  String? content;
  String? title;
  String? lastReplyAt;
  bool? good;
  bool? top;
  int? replyCount;
  int? visitCount;
  String? createAt;
  GetTopicsListItemAuthor? author;

  GetTopicsListItem(
      {this.id,
      this.authorId,
      this.tab,
      this.content,
      this.title,
      this.lastReplyAt,
      this.good,
      this.top,
      this.replyCount,
      this.visitCount,
      this.createAt,
      this.author});

  GetTopicsListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authorId = json['author_id'];
    tab = json['tab'];
    content = json['content'];
    title = json['title'];
    lastReplyAt = json['last_reply_at'];
    good = json['good'];
    top = json['top'];
    replyCount = json['reply_count'];
    visitCount = json['visit_count'];
    createAt = json['create_at'];
    author = json['author'] != null
        ? GetTopicsListItemAuthor.fromJson(json['author'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['author_id'] = authorId;
    data['tab'] = tab;
    data['content'] = content;
    data['title'] = title;
    data['last_reply_at'] = lastReplyAt;
    data['good'] = good;
    data['top'] = top;
    data['reply_count'] = replyCount;
    data['visit_count'] = visitCount;
    data['create_at'] = createAt;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    return data;
  }
}

class GetTopicsListItemAuthor {
  String? loginname;
  String? avatarUrl;

  GetTopicsListItemAuthor({this.loginname, this.avatarUrl});

  GetTopicsListItemAuthor.fromJson(Map<String, dynamic> json) {
    loginname = json['loginname'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['loginname'] = loginname;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}

class Cnode {
  static Future<GetTopicsListRespond> getTopicsList(
      {required int page, String? tab, required int limit}) async {
    var json = await request.get('/topics', {
      "page": page,
      "tab": tab,
      "limit": limit,
    });
    return GetTopicsListRespond.fromJson(json);
  }
}
