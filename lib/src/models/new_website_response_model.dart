class NewWebsiteResponseModel {
  String sId;
  String publishedAt;
  int checkingTime;
  String websiteURL;
  String websiteName;
  String createdAt;
  String updatedAt;
  int iV;
  String id;
  String userId;

  NewWebsiteResponseModel(
      {this.sId,
      this.publishedAt,
      this.checkingTime,
      this.websiteURL,
      this.websiteName,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.id,
      this.userId});

  NewWebsiteResponseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    publishedAt = json['published_at'];
    checkingTime = json['checkingTime'];
    websiteURL = json['websiteURL'];
    websiteName = json['websiteName'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    id = json['id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['published_at'] = this.publishedAt;
    data['checkingTime'] = this.checkingTime;
    data['websiteURL'] = this.websiteURL;
    data['websiteName'] = this.websiteName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    return data;
  }
}
