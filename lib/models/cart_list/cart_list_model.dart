///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CartListModelDataCartProductsProduct {
/*
{
  "_id": "5f1aa346cce33f65397fa7ef",
  "supplier": "5f1a9c45cce33f65397fa7eb",
  "arabicName": "دونات نوتيلا (كبير)",
  "englishName": "Nutella Donut (Large)",
  "arabicDescription": "دونات محشي بشكولاته البندق",
  "englishDescription": "Donut stuffed with Nutella",
  "sku": "SKU001L",
  "price": 6,
  "unit": "5ea87137d8d93354f6161311",
  "__v": 1,
  "deleted": false,
  "createdAt": "2020-07-24T12:00:54.951Z",
  "status": "Active",
  "coverPhoto": "1a1f8eb05e0a21c8e99e879e5fbf1835",
  "images": [
    ""
  ],
  "categories": [
    "5ea870e7d8d93354f616130f"
  ]
}
*/

  String Id;
  String supplier;
  String arabicName;
  String englishName;
  String arabicDescription;
  String englishDescription;
  String sku;
  int price;
  String unit;
  int v;
  bool deleted;
  String createdAt;
  String status;
  String coverPhoto;
  List<String> images;
  List<String> categories;

  CartListModelDataCartProductsProduct({
    this.Id,
    this.supplier,
    this.arabicName,
    this.englishName,
    this.arabicDescription,
    this.englishDescription,
    this.sku,
    this.price,
    this.unit,
    this.v,
    this.deleted,
    this.createdAt,
    this.status,
    this.coverPhoto,
    this.images,
    this.categories,
  });
  CartListModelDataCartProductsProduct.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    supplier = json['supplier']?.toString();
    arabicName = json['arabicName']?.toString();
    englishName = json['englishName']?.toString();
    arabicDescription = json['arabicDescription']?.toString();
    englishDescription = json['englishDescription']?.toString();
    sku = json['sku']?.toString();
    price = json['price']?.toInt();
    unit = json['unit']?.toString();
    v = json['__v']?.toInt();
    deleted = json['deleted'];
    createdAt = json['createdAt']?.toString();
    status = json['status']?.toString();
    coverPhoto = json['coverPhoto']?.toString();
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
    if (json['categories'] != null) {
      final v = json['categories'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      categories = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['supplier'] = supplier;
    data['arabicName'] = arabicName;
    data['englishName'] = englishName;
    data['arabicDescription'] = arabicDescription;
    data['englishDescription'] = englishDescription;
    data['sku'] = sku;
    data['price'] = price;
    data['unit'] = unit;
    data['__v'] = v;
    data['deleted'] = deleted;
    data['createdAt'] = createdAt;
    data['status'] = status;
    data['coverPhoto'] = coverPhoto;
    if (images != null) {
      final v = images;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['images'] = arr0;
    }
    if (categories != null) {
      final v = categories;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['categories'] = arr0;
    }
    return data;
  }
}

class CartListModelDataCartProducts {
/*
{
  "_id": "61d33c82617f847db190374d",
  "price": 5,
  "quantity": 5,
  "product": {
    "_id": "5f1aa346cce33f65397fa7ef",
    "supplier": "5f1a9c45cce33f65397fa7eb",
    "arabicName": "دونات نوتيلا (كبير)",
    "englishName": "Nutella Donut (Large)",
    "arabicDescription": "دونات محشي بشكولاته البندق",
    "englishDescription": "Donut stuffed with Nutella",
    "sku": "SKU001L",
    "price": 6,
    "unit": "5ea87137d8d93354f6161311",
    "__v": 1,
    "deleted": false,
    "createdAt": "2020-07-24T12:00:54.951Z",
    "status": "Active",
    "coverPhoto": "1a1f8eb05e0a21c8e99e879e5fbf1835",
    "images": [
      ""
    ],
    "categories": [
      "5ea870e7d8d93354f616130f"
    ]
  },
  "createdAt": "2021-12-19T19:17:55.214Z"
}
*/

  String Id;
  double price;
  int quantity;
  CartListModelDataCartProductsProduct product;
  String createdAt;

  CartListModelDataCartProducts({
    this.Id,
    this.price,
    this.quantity,
    this.product,
    this.createdAt,
  });
  CartListModelDataCartProducts.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    price = json['price']?.toDouble();
    quantity = json['quantity']?.toInt();
    product = (json['product'] != null) ? CartListModelDataCartProductsProduct.fromJson(json['product']) : null;
    createdAt = json['createdAt']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['price'] = price;
    data['quantity'] = quantity;
    if (product != null) {
      data['product'] = product.toJson();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}

class CartListModelDataCartSupplierStaff {
/*
{
  "_id": "5f1a9c45cce33f65397fa7ea",
  "email": "bakingkuptest@gmail.com"
}
*/

  String Id;
  String email;

  CartListModelDataCartSupplierStaff({
    this.Id,
    this.email,
  });
  CartListModelDataCartSupplierStaff.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    email = json['email']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['email'] = email;
    return data;
  }
}

class CartListModelDataCartSupplierLocation {
/*
{
  "address": "Bilal Ibn Rabah Street, Dammam Saudi Arabia",
  "coordinates": [
    26.4218863
  ],
  "type": "Point"
}
*/

  String address;
  List<double> coordinates;
  String type;

  CartListModelDataCartSupplierLocation({
    this.address,
    this.coordinates,
    this.type,
  });
  CartListModelDataCartSupplierLocation.fromJson(Map<String, dynamic> json) {
    address = json['address']?.toString();
    if (json['coordinates'] != null) {
      final v = json['coordinates'];
      final arr0 = <double>[];
      v.forEach((v) {
        arr0.add(v.toDouble());
      });
      coordinates = arr0;
    }
    type = json['type']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address'] = address;
    if (coordinates != null) {
      final v = coordinates;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['coordinates'] = arr0;
    }
    data['type'] = type;
    return data;
  }
}

class CartListModelDataCartSupplier {
/*
{
  "_id": "5f1a9c45cce33f65397fa7eb",
  "representativeName": "baking up",
  "VATRegisterNumber": 1234567890,
  "coverPhoto": "https:",
  "location": {
    "address": "Bilal Ibn Rabah Street, Dammam Saudi Arabia",
    "coordinates": [
      26.4218863
    ],
    "type": "Point"
  },
  "staff": [
    {
      "_id": "5f1a9c45cce33f65397fa7ea",
      "email": "bakingkuptest@gmail.com"
    }
  ]
}
*/

  String Id;
  String representativeName;
  int VATRegisterNumber;
  String coverPhoto;
  CartListModelDataCartSupplierLocation location;
  List<CartListModelDataCartSupplierStaff> staff;

  CartListModelDataCartSupplier({
    this.Id,
    this.representativeName,
    this.VATRegisterNumber,
    this.coverPhoto,
    this.location,
    this.staff,
  });
  CartListModelDataCartSupplier.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    representativeName = json['representativeName']?.toString();
    VATRegisterNumber = json['VATRegisterNumber']?.toInt();
    coverPhoto = json['coverPhoto']?.toString();
    location = (json['location'] != null) ? CartListModelDataCartSupplierLocation.fromJson(json['location']) : null;
    if (json['staff'] != null) {
      final v = json['staff'];
      final arr0 = <CartListModelDataCartSupplierStaff>[];
      v.forEach((v) {
        arr0.add(CartListModelDataCartSupplierStaff.fromJson(v));
      });
      staff = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['representativeName'] = representativeName;
    data['VATRegisterNumber'] = VATRegisterNumber;
    data['coverPhoto'] = coverPhoto;
    if (location != null) {
      data['location'] = location.toJson();
    }
    if (staff != null) {
      final v = staff;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data['staff'] = arr0;
    }
    return data;
  }
}

class CartListModelDataCart {
/*
{
  "_id": "6100ca8d9e01df71ed6585bd",
  "customer": "5f4d264122c0291c7f2e5fc2",
  "supplier": {
    "_id": "5f1a9c45cce33f65397fa7eb",
    "representativeName": "baking up",
    "VATRegisterNumber": 1234567890,
    "coverPhoto": "https:",
    "location": {
      "address": "Bilal Ibn Rabah Street, Dammam Saudi Arabia",
      "coordinates": [
        26.4218863
      ],
      "type": "Point"
    },
    "staff": [
      {
        "_id": "5f1a9c45cce33f65397fa7ea",
        "email": "bakingkuptest@gmail.com"
      }
    ]
  },
  "__v": 5,
  "VAT": 11.85,
  "isReccuring": false,
  "createdAt": "2021-07-28T06:10:05.592Z",
  "products": [
    {
      "_id": "61d33c82617f847db190374d",
      "price": 5,
      "quantity": 5,
      "product": {
        "_id": "5f1aa346cce33f65397fa7ef",
        "supplier": "5f1a9c45cce33f65397fa7eb",
        "arabicName": "دونات نوتيلا (كبير)",
        "englishName": "Nutella Donut (Large)",
        "arabicDescription": "دونات محشي بشكولاته البندق",
        "englishDescription": "Donut stuffed with Nutella",
        "sku": "SKU001L",
        "price": 6,
        "unit": "5ea87137d8d93354f6161311",
        "__v": 1,
        "deleted": false,
        "createdAt": "2020-07-24T12:00:54.951Z",
        "status": "Active",
        "coverPhoto": "1a1f8eb05e0a21c8e99e879e5fbf1835",
        "images": [
          ""
        ],
        "categories": [
          "5ea870e7d8d93354f616130f"
        ]
      },
      "createdAt": "2021-12-19T19:17:55.214Z"
    }
  ]
}
*/

  String Id;
  String customer;
  CartListModelDataCartSupplier supplier;
  int v;
  double VAT;
  bool isReccuring;
  String createdAt;
  List<CartListModelDataCartProducts> products;

  CartListModelDataCart({
    this.Id,
    this.customer,
    this.supplier,
    this.v,
    this.VAT,
    this.isReccuring,
    this.createdAt,
    this.products,
  });
  CartListModelDataCart.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    customer = json['customer']?.toString();
    supplier = (json['supplier'] != null) ? CartListModelDataCartSupplier.fromJson(json['supplier']) : null;
    v = json['__v']?.toInt();
    VAT = json['VAT']?.toDouble();
    isReccuring = json['isReccuring'];
    createdAt = json['createdAt']?.toString();
    if (json['products'] != null) {
      final v = json['products'];
      final arr0 = <CartListModelDataCartProducts>[];
      v.forEach((v) {
        arr0.add(CartListModelDataCartProducts.fromJson(v));
      });
      products = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['customer'] = customer;
    if (supplier != null) {
      data['supplier'] = supplier.toJson();
    }
    data['__v'] = v;
    data['VAT'] = VAT;
    data['isReccuring'] = isReccuring;
    data['createdAt'] = createdAt;
    if (products != null) {
      final v = products;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data['products'] = arr0;
    }
    return data;
  }
}

class CartListModelData {
/*
{
  "cart": {
    "_id": "6100ca8d9e01df71ed6585bd",
    "customer": "5f4d264122c0291c7f2e5fc2",
    "supplier": {
      "_id": "5f1a9c45cce33f65397fa7eb",
      "representativeName": "baking up",
      "VATRegisterNumber": 1234567890,
      "coverPhoto": "https:",
      "location": {
        "address": "Bilal Ibn Rabah Street, Dammam Saudi Arabia",
        "coordinates": [
          26.4218863
        ],
        "type": "Point"
      },
      "staff": [
        {
          "_id": "5f1a9c45cce33f65397fa7ea",
          "email": "bakingkuptest@gmail.com"
        }
      ]
    },
    "__v": 5,
    "VAT": 11.85,
    "isReccuring": false,
    "createdAt": "2021-07-28T06:10:05.592Z",
    "products": [
      {
        "_id": "61d33c82617f847db190374d",
        "price": 5,
        "quantity": 5,
        "product": {
          "_id": "5f1aa346cce33f65397fa7ef",
          "supplier": "5f1a9c45cce33f65397fa7eb",
          "arabicName": "دونات نوتيلا (كبير)",
          "englishName": "Nutella Donut (Large)",
          "arabicDescription": "دونات محشي بشكولاته البندق",
          "englishDescription": "Donut stuffed with Nutella",
          "sku": "SKU001L",
          "price": 6,
          "unit": "5ea87137d8d93354f6161311",
          "__v": 1,
          "deleted": false,
          "createdAt": "2020-07-24T12:00:54.951Z",
          "status": "Active",
          "coverPhoto": "1a1f8eb05e0a21c8e99e879e5fbf1835",
          "images": [
            ""
          ],
          "categories": [
            "5ea870e7d8d93354f616130f"
          ]
        },
        "createdAt": "2021-12-19T19:17:55.214Z"
      }
    ]
  },
  "items": 15,
  "total": 90.85,
  "VAT": 11.85
}
*/

  CartListModelDataCart cart;
  int items;
  double total;
  double VAT;

  CartListModelData({
    this.cart,
    this.items,
    this.total,
    this.VAT,
  });
  CartListModelData.fromJson(Map<String, dynamic> json) {
    cart = (json['cart'] != null) ? CartListModelDataCart.fromJson(json['cart']) : null;
    items = json['items']?.toInt();
    total = json['total']?.toDouble();
    VAT = json['VAT']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (cart != null) {
      data['cart'] = cart.toJson();
    }
    data['items'] = items;
    data['total'] = total;
    data['VAT'] = VAT;
    return data;
  }
}

class CartListModel {
/*
{
  "status": "Success",
  "errorCode": 0,
  "data": [
    {
      "cart": {
        "_id": "6100ca8d9e01df71ed6585bd",
        "customer": "5f4d264122c0291c7f2e5fc2",
        "supplier": {
          "_id": "5f1a9c45cce33f65397fa7eb",
          "representativeName": "baking up",
          "VATRegisterNumber": 1234567890,
          "coverPhoto": "https:",
          "location": {
            "address": "Bilal Ibn Rabah Street, Dammam Saudi Arabia",
            "coordinates": [
              26.4218863
            ],
            "type": "Point"
          },
          "staff": [
            {
              "_id": "5f1a9c45cce33f65397fa7ea",
              "email": "bakingkuptest@gmail.com"
            }
          ]
        },
        "__v": 5,
        "VAT": 11.85,
        "isReccuring": false,
        "createdAt": "2021-07-28T06:10:05.592Z",
        "products": [
          {
            "_id": "61d33c82617f847db190374d",
            "price": 5,
            "quantity": 5,
            "product": {
              "_id": "5f1aa346cce33f65397fa7ef",
              "supplier": "5f1a9c45cce33f65397fa7eb",
              "arabicName": "دونات نوتيلا (كبير)",
              "englishName": "Nutella Donut (Large)",
              "arabicDescription": "دونات محشي بشكولاته البندق",
              "englishDescription": "Donut stuffed with Nutella",
              "sku": "SKU001L",
              "price": 6,
              "unit": "5ea87137d8d93354f6161311",
              "__v": 1,
              "deleted": false,
              "createdAt": "2020-07-24T12:00:54.951Z",
              "status": "Active",
              "coverPhoto": "1a1f8eb05e0a21c8e99e879e5fbf1835",
              "images": [
                ""
              ],
              "categories": [
                "5ea870e7d8d93354f616130f"
              ]
            },
            "createdAt": "2021-12-19T19:17:55.214Z"
          }
        ]
      },
      "items": 15,
      "total": 90.85,
      "VAT": 11.85
    }
  ]
}
*/

  String status;
  int errorCode;
  List<CartListModelData> data;

  CartListModel({
    this.status,
    this.errorCode,
    this.data,
  });
  CartListModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
    errorCode = json['errorCode']?.toInt();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <CartListModelData>[];
      v.forEach((v) {
        arr0.add(CartListModelData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['errorCode'] = errorCode;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}
