class Review{
  String id;
  String vendor_id;
  String author_id;
  String author_name;
  String author_email;
  String review_title;
  String review_description;
  String review_rating;
  String approved;
  String created;
  String author_image;

 Review({
   this.vendor_id,
   this.author_id,
   this.author_name,
   this.author_email,
   this.review_title,
   this.review_description,
   this.review_rating,
   this.approved,
   this.created,
   this.author_image
      });

  Review.fromJSON(Map<String, dynamic> json){
    vendor_id = json['venor_id'];
    author_id = json['author_id'];
    author_name = json['author_name'];
    review_title = json['review_title'];
    review_description = json['review_description'];
    review_rating = json['review_rating'];
    approved = json['approved'];
    created = json['created'];
    author_image = json['author_image'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['vendor_id'] = this.vendor_id;
    json['author_id'] = this.author_id;
    json['author_name'] = this.author_name;
    json['review_title'] = this.review_title;
    json['review_description'] = this.review_description;
    json['review_rating'] = this.review_rating;
    json['approved'] = this.approved;
    json['created'] = this.created;
    json['author_image'] = this.author_image;

   
    return json;
  }


 

}