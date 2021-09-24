import 'dart:convert';

List<Product> productFromJson(String x) =>
    List<Product>.from(jsonDecode(x).map((e) => Product.fromJson(e))).toList();

class Product {
  int? id;
  int? maximumOrder;
  List<CategoryList?>? categoryList;
  String? productName;
  String? sku;
  String? slug;
  String? buisnessName;
  int? sellerId;
  String? sellerSlug;
  bool? willShowEmi;
  Brand? brand;
  String? note;
  int? stock;
  bool? preOrder;
  int? bookingPrice;
  int? productPrice;
  dynamic discountCharge;
  String? image;
  List<String>? detailsImages;
  bool? isEvent;
  dynamic eventId;
  bool? highlight;
  dynamic highlightId;
  bool? groupping;
  dynamic grouppingId;
  dynamic campaignSectionId;
  bool? campaignSection;
  dynamic message;
  bool? seo;
  String? metaKeyword;
  String? metaDescription;
  dynamic variation;
  String? bannerImage;
  String? bannerImageLink;
  dynamic attributeValue;
  dynamic iconSpecification;
  int? productReviewAvg;

  Product(
      {this.id,
      this.maximumOrder,
      this.categoryList,
      this.productName,
      this.sku,
      this.slug,
      this.buisnessName,
      this.sellerId,
      this.sellerSlug,
      this.willShowEmi,
      this.brand,
      this.note,
      this.stock,
      this.preOrder,
      this.bookingPrice,
      this.productPrice,
      this.discountCharge,
      this.image,
      this.detailsImages,
      this.isEvent,
      this.eventId,
      this.highlight,
      this.highlightId,
      this.groupping,
      this.grouppingId,
      this.campaignSectionId,
      this.campaignSection,
      this.message,
      this.seo,
      this.metaKeyword,
      this.metaDescription,
      this.variation,
      this.bannerImage,
      this.bannerImageLink,
      this.attributeValue,
      this.iconSpecification,
      this.productReviewAvg});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maximumOrder = json['maximum_order'];
    if (json['category_list'] != null) {
      categoryList = List<CategoryList>.empty();
      json['category_list'].map((e) => CategoryList.fromJson(e));
    }
    productName = json['product_name'];
    sku = json['sku'];
    slug = json['slug'];
    buisnessName = json['buisness_name'];
    sellerId = json['seller_id'];
    sellerSlug = json['seller_slug'];
    willShowEmi = json['will_show_emi'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    note = json['note'];
    stock = json['stock'];
    preOrder = json['pre_order'];
    bookingPrice = json['booking_price'];
    productPrice = json['product_price'];
    discountCharge = json['discount_charge'];
    image = json['image'];
    detailsImages = json['details_images'].cast<String>();
    isEvent = json['is_event'];
    eventId = json['event_id'];
    highlight = json['highlight'];
    highlightId = json['highlight_id'];
    groupping = json['groupping'];
    grouppingId = json['groupping_id'];
    campaignSectionId = json['campaign_section_id'];
    campaignSection = json['campaign_section'];
    message = json['message'];
    seo = json['seo'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    variation = json['variation'];
    bannerImage = json['banner_image'];
    bannerImageLink = json['banner_image_link'];
    attributeValue = json['attribute_value'];
    iconSpecification = json['icon_specification'];
    productReviewAvg = json['product_review_avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['maximum_order'] = maximumOrder;
    if (categoryList != null) {
      data['category_list'] = categoryList!.map((v) => v!.toJson()).toList();
    }
    data['product_name'] = productName;
    data['sku'] = sku;
    data['slug'] = slug;
    data['buisness_name'] = buisnessName;
    data['seller_id'] = sellerId;
    data['seller_slug'] = sellerSlug;
    data['will_show_emi'] = willShowEmi;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['note'] = note;
    data['stock'] = stock;
    data['pre_order'] = preOrder;
    data['booking_price'] = bookingPrice;
    data['product_price'] = productPrice;
    data['discount_charge'] = discountCharge;
    data['image'] = image;
    data['details_images'] = detailsImages;
    data['is_event'] = isEvent;
    data['event_id'] = eventId;
    data['highlight'] = highlight;
    data['highlight_id'] = highlightId;
    data['groupping'] = groupping;
    data['groupping_id'] = grouppingId;
    data['campaign_section_id'] = campaignSectionId;
    data['campaign_section'] = campaignSection;
    data['message'] = message;
    data['seo'] = seo;
    data['meta_keyword'] = metaKeyword;
    data['meta_description'] = metaDescription;
    data['variation'] = variation;
    data['banner_image'] = bannerImage;
    data['banner_image_link'] = bannerImageLink;
    data['attribute_value'] = attributeValue;
    data['icon_specification'] = iconSpecification;
    data['product_review_avg'] = productReviewAvg;
    return data;
  }
}

class CategoryList {
  int? id;
  String? categoryName;
  String? slug;
  bool? isInactive;
  String? image;
  String? categoryIcon;
  String? parent;
  String? parentSlug;

  CategoryList(
      {this.id,
      this.categoryName,
      this.slug,
      this.isInactive,
      this.image,
      this.categoryIcon,
      this.parent,
      this.parentSlug});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    slug = json['slug'];
    isInactive = json['is_inactive'];
    image = json['image'];
    categoryIcon = json['category_icon'];
    parent = json['parent'];
    parentSlug = json['parent_slug'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    data['slug'] = slug;
    data['is_inactive'] = isInactive;
    data['image'] = image;
    data['category_icon'] = categoryIcon;
    data['parent'] = parent;
    data['parent_slug'] = parentSlug;
    return data;
  }
}

class Brand {
  int? id;
  String? name;
  String? slug;
  String? image;

  Brand({this.id, this.name, this.slug, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    return data;
  }
}
