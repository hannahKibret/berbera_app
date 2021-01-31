
class Address {
  String firstName;
  String lastName;
  String email;
  String street;
  String apartment;
  String block;
  String city;
  String state;
  String country;
  String phoneNumber;
  String zipCode;
  String mapUrl;

  Address({
    this.firstName,
    this.lastName,
    this.email,
    this.street,
    this.apartment,
    this.block,
    this.city,
    this.state,
    this.country,
    this.phoneNumber,
    this.zipCode,
    this.mapUrl,
  });

  Address.fromJson(Map<String, dynamic> parsedJson) {
    firstName = parsedJson["first_name"];
    lastName = parsedJson["last_name"];
    apartment = parsedJson["company"];
    street = parsedJson["address_1"];
    block = parsedJson["address_2"];
    city = parsedJson["city"];
    state = parsedJson["state"];
    country = parsedJson["country"];
    email = parsedJson["email"];
    final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
    if (alphanumeric.hasMatch(firstName)) {
      phoneNumber = firstName;
    }
    //phoneNumber = parsedJson["phone"];
    zipCode = parsedJson["postcode"];
  }

  Address.fromMagentoJson(Map<String, dynamic> parsedJson) {
    firstName = parsedJson["firstname"];
    lastName = parsedJson["lastname"];
    if(parsedJson["street"] != null){
      List streets = List.from(parsedJson["street"]);
      street = streets.isNotEmpty ? streets[0] : "";
      block = streets.length > 1 ? streets[1] : "";
    }

    city = parsedJson["city"];
    state = parsedJson["region"];
    country = parsedJson["country_id"];
    email = parsedJson["email"];
    phoneNumber = parsedJson["telephone"];
    zipCode = parsedJson["postcode"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> address = {
      "first_name": firstName,
      "last_name": lastName,
      "address_1": street ?? '',
      "address_2": block ?? '',
      "company": apartment ?? '',
      "city": city,
      "state": state,
      "country": country,
      "phone": phoneNumber,
      "postcode": zipCode,
      "mapUrl": mapUrl,
    };
    if(email != null && email.isNotEmpty){
      address["email"] = email;
    }
    return address;
  }

  Map<String, dynamic> toMagentoJson() {
    return {
      "address": {
        "region": state,
        "country_id": country,
        "region_id": state,
        "street": [
          street,
          '$apartment${(block?.isEmpty ?? true) ? '' : ' - $block'}',
        ],
        "postcode": zipCode,
        "city": city,
        "firstname": firstName,
        "lastname": lastName,
        "email": email,
        "telephone": phoneNumber,
        "same_as_billing": 1
      }
    };
  }

  Map<String, dynamic> toOpencartJson() {
    return {
      "zone_id": state,
      "country_id": country,
      "address_1": street ?? '',
      "address_2": block ?? '',
      "company": apartment ?? '',
      "postcode": zipCode,
      "city": city,
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "telephone": phoneNumber
    };
  }

  bool isValid() {
    return firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        street.isNotEmpty &&
        city.isNotEmpty &&
        state.isNotEmpty &&
        country.isNotEmpty &&
        phoneNumber.isNotEmpty;
  }

  Map<String, String> toJsonEncodable() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "address_1": street ?? '',
      "address_2": block ?? '',
      "company": apartment ?? '',
      "city": city,
      "state": state,
      "country": country,
      "email": email,
      "phone": phoneNumber,
      "postcode": zipCode
    };
  }


  @override
  String toString() {
    return street + country + city;
  }
}

class ListAddress {
  List<Address> list = [];

  toJsonEncodable() {
    return list.map((item) {
      return item.toJsonEncodable();
    }).toList();
  }
}
