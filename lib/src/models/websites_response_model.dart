class WebsitesResponseModel {
  String sId;
  String websiteName;
  String websiteURL;
  String publishedAt;
  String createdAt;
  String updatedAt;
  int iV;
  bool status;
  String id;

  WebsitesResponseModel(
      {this.sId,
        this.websiteName,
        this.websiteURL,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.status,
        this.id});

  WebsitesResponseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    websiteName = json['websiteName'];
    websiteURL = json['websiteURL'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['websiteName'] = this.websiteName;
    data['websiteURL'] = this.websiteURL;
    data['published_at'] = this.publishedAt;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}
