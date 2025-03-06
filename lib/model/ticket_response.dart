// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  final EventModelEmbedded? embedded;
  final EventModelLinks? links;
  final Page? page;

  EventModel({this.embedded, this.links, this.page});

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    embedded:
        json["_embedded"] == null
            ? null
            : EventModelEmbedded.fromJson(json["_embedded"]),
    links:
        json["_links"] == null
            ? null
            : EventModelLinks.fromJson(json["_links"]),
    page: json["page"] == null ? null : Page.fromJson(json["page"]),
  );

  Map<String, dynamic> toJson() => {
    "_embedded": embedded?.toJson(),
    "_links": links?.toJson(),
    "page": page?.toJson(),
  };
}

class EventModelEmbedded {
  final List<Event>? events;

  EventModelEmbedded({this.events});

  factory EventModelEmbedded.fromJson(Map<String, dynamic> json) =>
      EventModelEmbedded(
        events:
            json["events"] == null
                ? []
                : List<Event>.from(
                  json["events"]!.map((x) => Event.fromJson(x)),
                ),
      );

  Map<String, dynamic> toJson() => {
    "events":
        events == null
            ? []
            : List<dynamic>.from(events!.map((x) => x.toJson())),
  };
}

class Event {
  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final List<Image>? images;
  final Sales? sales;
  final Dates? dates;
  final List<Classification>? classifications;
  final Promoter? promoter;
  final List<Promoter>? promoters;
  final String? info;
  final String? pleaseNote;
  final List<PriceRange>? priceRanges;
  final List<Product>? products;
  final Seatmap? seatmap;
  final Accessibility? accessibility;
  final TicketLimit? ticketLimit;
  final AgeRestrictions? ageRestrictions;
  final Ticketing? ticketing;
  final EventLinks? links;
  final EventEmbedded? embedded;

  Event({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.images,
    this.sales,
    this.dates,
    this.classifications,
    this.promoter,
    this.promoters,
    this.info,
    this.pleaseNote,
    this.priceRanges,
    this.products,
    this.seatmap,
    this.accessibility,
    this.ticketLimit,
    this.ageRestrictions,
    this.ticketing,
    this.links,
    this.embedded,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    name: json["name"],
    type: json["type"],
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: json["locale"],
    images:
        json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    sales: json["sales"] == null ? null : Sales.fromJson(json["sales"]),
    dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
    classifications:
        json["classifications"] == null
            ? []
            : List<Classification>.from(
              json["classifications"]!.map((x) => Classification.fromJson(x)),
            ),
    promoter:
        json["promoter"] == null ? null : Promoter.fromJson(json["promoter"]),
    promoters:
        json["promoters"] == null
            ? []
            : List<Promoter>.from(
              json["promoters"]!.map((x) => Promoter.fromJson(x)),
            ),
    info: json["info"],
    pleaseNote: json["pleaseNote"],
    priceRanges:
        json["priceRanges"] == null
            ? []
            : List<PriceRange>.from(
              json["priceRanges"]!.map((x) => PriceRange.fromJson(x)),
            ),
    products:
        json["products"] == null
            ? []
            : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x)),
            ),
    seatmap: json["seatmap"] == null ? null : Seatmap.fromJson(json["seatmap"]),
    accessibility:
        json["accessibility"] == null
            ? null
            : Accessibility.fromJson(json["accessibility"]),
    ticketLimit:
        json["ticketLimit"] == null
            ? null
            : TicketLimit.fromJson(json["ticketLimit"]),
    ageRestrictions:
        json["ageRestrictions"] == null
            ? null
            : AgeRestrictions.fromJson(json["ageRestrictions"]),
    ticketing:
        json["ticketing"] == null
            ? null
            : Ticketing.fromJson(json["ticketing"]),
    links: json["_links"] == null ? null : EventLinks.fromJson(json["_links"]),
    embedded:
        json["_embedded"] == null
            ? null
            : EventEmbedded.fromJson(json["_embedded"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "images":
        images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
    "sales": sales?.toJson(),
    "dates": dates?.toJson(),
    "classifications":
        classifications == null
            ? []
            : List<dynamic>.from(classifications!.map((x) => x.toJson())),
    "promoter": promoter?.toJson(),
    "promoters":
        promoters == null
            ? []
            : List<dynamic>.from(promoters!.map((x) => x.toJson())),
    "info": info,
    "pleaseNote": pleaseNote,
    "priceRanges":
        priceRanges == null
            ? []
            : List<dynamic>.from(priceRanges!.map((x) => x.toJson())),
    "products":
        products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
    "seatmap": seatmap?.toJson(),
    "accessibility": accessibility?.toJson(),
    "ticketLimit": ticketLimit?.toJson(),
    "ageRestrictions": ageRestrictions?.toJson(),
    "ticketing": ticketing?.toJson(),
    "_links": links?.toJson(),
    "_embedded": embedded?.toJson(),
  };
}

class Accessibility {
  final int? ticketLimit;
  final String? id;

  Accessibility({this.ticketLimit, this.id});

  factory Accessibility.fromJson(Map<String, dynamic> json) =>
      Accessibility(ticketLimit: json["ticketLimit"], id: json["id"]);

  Map<String, dynamic> toJson() => {"ticketLimit": ticketLimit, "id": id};
}

class AgeRestrictions {
  final bool? legalAgeEnforced;
  final String? id;

  AgeRestrictions({this.legalAgeEnforced, this.id});

  factory AgeRestrictions.fromJson(Map<String, dynamic> json) =>
      AgeRestrictions(
        legalAgeEnforced: json["legalAgeEnforced"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
    "legalAgeEnforced": legalAgeEnforced,
    "id": id,
  };
}

class Classification {
  final bool? primary;
  final Genre? segment;
  final Genre? genre;
  final Genre? subGenre;
  final Genre? type;
  final Genre? subType;
  final bool? family;

  Classification({
    this.primary,
    this.segment,
    this.genre,
    this.subGenre,
    this.type,
    this.subType,
    this.family,
  });

  factory Classification.fromJson(Map<String, dynamic> json) => Classification(
    primary: json["primary"],
    segment: json["segment"] == null ? null : Genre.fromJson(json["segment"]),
    genre: json["genre"] == null ? null : Genre.fromJson(json["genre"]),
    subGenre:
        json["subGenre"] == null ? null : Genre.fromJson(json["subGenre"]),
    type: json["type"] == null ? null : Genre.fromJson(json["type"]),
    subType: json["subType"] == null ? null : Genre.fromJson(json["subType"]),
    family: json["family"],
  );

  Map<String, dynamic> toJson() => {
    "primary": primary,
    "segment": segment?.toJson(),
    "genre": genre?.toJson(),
    "subGenre": subGenre?.toJson(),
    "type": type?.toJson(),
    "subType": subType?.toJson(),
    "family": family,
  };
}

class Genre {
  final String? id;
  final String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) =>
      Genre(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Dates {
  final Start? start;
  final String? timezone;
  final Status? status;
  final bool? spanMultipleDays;

  Dates({this.start, this.timezone, this.status, this.spanMultipleDays});

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    start: json["start"] == null ? null : Start.fromJson(json["start"]),
    timezone: json["timezone"],
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    spanMultipleDays: json["spanMultipleDays"],
  );

  Map<String, dynamic> toJson() => {
    "start": start?.toJson(),
    "timezone": timezone,
    "status": status?.toJson(),
    "spanMultipleDays": spanMultipleDays,
  };
}

class Start {
  final DateTime? localDate;
  final String? localTime;
  final DateTime? dateTime;
  final bool? dateTbd;
  final bool? dateTba;
  final bool? timeTba;
  final bool? noSpecificTime;

  Start({
    this.localDate,
    this.localTime,
    this.dateTime,
    this.dateTbd,
    this.dateTba,
    this.timeTba,
    this.noSpecificTime,
  });

  factory Start.fromJson(Map<String, dynamic> json) => Start(
    localDate:
        json["localDate"] == null ? null : DateTime.parse(json["localDate"]),
    localTime: json["localTime"],
    dateTime:
        json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
    dateTbd: json["dateTBD"],
    dateTba: json["dateTBA"],
    timeTba: json["timeTBA"],
    noSpecificTime: json["noSpecificTime"],
  );

  Map<String, dynamic> toJson() => {
    "localDate":
        "${localDate!.year.toString().padLeft(4, '0')}-${localDate!.month.toString().padLeft(2, '0')}-${localDate!.day.toString().padLeft(2, '0')}",
    "localTime": localTime,
    "dateTime": dateTime?.toIso8601String(),
    "dateTBD": dateTbd,
    "dateTBA": dateTba,
    "timeTBA": timeTba,
    "noSpecificTime": noSpecificTime,
  };
}

class Status {
  final String? code;

  Status({this.code});

  factory Status.fromJson(Map<String, dynamic> json) =>
      Status(code: json["code"]);

  Map<String, dynamic> toJson() => {"code": code};
}

class EventEmbedded {
  final List<Venue>? venues;
  final List<Attraction>? attractions;

  EventEmbedded({this.venues, this.attractions});

  factory EventEmbedded.fromJson(Map<String, dynamic> json) => EventEmbedded(
    venues:
        json["venues"] == null
            ? []
            : List<Venue>.from(json["venues"]!.map((x) => Venue.fromJson(x))),
    attractions:
        json["attractions"] == null
            ? []
            : List<Attraction>.from(
              json["attractions"]!.map((x) => Attraction.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "venues":
        venues == null
            ? []
            : List<dynamic>.from(venues!.map((x) => x.toJson())),
    "attractions":
        attractions == null
            ? []
            : List<dynamic>.from(attractions!.map((x) => x.toJson())),
  };
}

class Attraction {
  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final ExternalLinks? externalLinks;
  final List<String>? aliases;
  final List<Image>? images;
  final List<Classification>? classifications;
  final UpcomingEvents? upcomingEvents;
  final AttractionLinks? links;

  Attraction({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.externalLinks,
    this.aliases,
    this.images,
    this.classifications,
    this.upcomingEvents,
    this.links,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
    name: json["name"],
    type: json["type"],
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: json["locale"],
    externalLinks:
        json["externalLinks"] == null
            ? null
            : ExternalLinks.fromJson(json["externalLinks"]),
    aliases:
        json["aliases"] == null
            ? []
            : List<String>.from(json["aliases"]!.map((x) => x)),
    images:
        json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    classifications:
        json["classifications"] == null
            ? []
            : List<Classification>.from(
              json["classifications"]!.map((x) => Classification.fromJson(x)),
            ),
    upcomingEvents:
        json["upcomingEvents"] == null
            ? null
            : UpcomingEvents.fromJson(json["upcomingEvents"]),
    links:
        json["_links"] == null
            ? null
            : AttractionLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "externalLinks": externalLinks?.toJson(),
    "aliases":
        aliases == null ? [] : List<dynamic>.from(aliases!.map((x) => x)),
    "images":
        images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
    "classifications":
        classifications == null
            ? []
            : List<dynamic>.from(classifications!.map((x) => x.toJson())),
    "upcomingEvents": upcomingEvents?.toJson(),
    "_links": links?.toJson(),
  };
}

class ExternalLinks {
  final List<Facebook>? twitter;
  final List<Facebook>? facebook;
  final List<Facebook>? wiki;
  final List<Facebook>? instagram;
  final List<Facebook>? homepage;

  ExternalLinks({
    this.twitter,
    this.facebook,
    this.wiki,
    this.instagram,
    this.homepage,
  });

  factory ExternalLinks.fromJson(Map<String, dynamic> json) => ExternalLinks(
    twitter:
        json["twitter"] == null
            ? []
            : List<Facebook>.from(
              json["twitter"]!.map((x) => Facebook.fromJson(x)),
            ),
    facebook:
        json["facebook"] == null
            ? []
            : List<Facebook>.from(
              json["facebook"]!.map((x) => Facebook.fromJson(x)),
            ),
    wiki:
        json["wiki"] == null
            ? []
            : List<Facebook>.from(
              json["wiki"]!.map((x) => Facebook.fromJson(x)),
            ),
    instagram:
        json["instagram"] == null
            ? []
            : List<Facebook>.from(
              json["instagram"]!.map((x) => Facebook.fromJson(x)),
            ),
    homepage:
        json["homepage"] == null
            ? []
            : List<Facebook>.from(
              json["homepage"]!.map((x) => Facebook.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "twitter":
        twitter == null
            ? []
            : List<dynamic>.from(twitter!.map((x) => x.toJson())),
    "facebook":
        facebook == null
            ? []
            : List<dynamic>.from(facebook!.map((x) => x.toJson())),
    "wiki":
        wiki == null ? [] : List<dynamic>.from(wiki!.map((x) => x.toJson())),
    "instagram":
        instagram == null
            ? []
            : List<dynamic>.from(instagram!.map((x) => x.toJson())),
    "homepage":
        homepage == null
            ? []
            : List<dynamic>.from(homepage!.map((x) => x.toJson())),
  };
}

class Facebook {
  final String? url;

  Facebook({this.url});

  factory Facebook.fromJson(Map<String, dynamic> json) =>
      Facebook(url: json["url"]);

  Map<String, dynamic> toJson() => {"url": url};
}

class Image {
  final Ratio? ratio;
  final String? url;
  final num? width;
  final num? height;
  final bool? fallback;

  Image({this.ratio, this.url, this.width, this.height, this.fallback});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    ratio: ratioValues.map[json["ratio"]]!,
    url: json["url"],
    width: json["width"],
    height: json["height"],
    fallback: json["fallback"],
  );

  Map<String, dynamic> toJson() => {
    "ratio": ratioValues.reverse[ratio],
    "url": url,
    "width": width,
    "height": height,
    "fallback": fallback,
  };
}

enum Ratio { THE_169, THE_32, THE_43 }

final ratioValues = EnumValues({
  "16_9": Ratio.THE_169,
  "3_2": Ratio.THE_32,
  "4_3": Ratio.THE_43,
});

class AttractionLinks {
  final First? self;

  AttractionLinks({this.self});

  factory AttractionLinks.fromJson(Map<String, dynamic> json) =>
      AttractionLinks(
        self: json["self"] == null ? null : First.fromJson(json["self"]),
      );

  Map<String, dynamic> toJson() => {"self": self?.toJson()};
}

class First {
  final String? href;

  First({this.href});

  factory First.fromJson(Map<String, dynamic> json) =>
      First(href: json["href"]);

  Map<String, dynamic> toJson() => {"href": href};
}

class UpcomingEvents {
  final num? tmr;
  final num? ticketmaster;
  final num? total;
  final num? filtered;
  final num? archtics;

  UpcomingEvents({
    this.tmr,
    this.ticketmaster,
    this.total,
    this.filtered,
    this.archtics,
  });

  factory UpcomingEvents.fromJson(Map<String, dynamic> json) => UpcomingEvents(
    tmr: json["tmr"],
    ticketmaster: json["ticketmaster"],
    total: json["_total"],
    filtered: json["_filtered"],
    archtics: json["archtics"],
  );

  Map<String, dynamic> toJson() => {
    "tmr": tmr,
    "ticketmaster": ticketmaster,
    "_total": total,
    "_filtered": filtered,
    "archtics": archtics,
  };
}

class Venue {
  final String? name;
  final String? type;
  final String? id;
  final bool? test;
  final String? url;
  final String? locale;
  final List<Image>? images;
  final String? postalCode;
  final String? timezone;
  final City? city;
  final State? state;
  final Country? country;
  final Address? address;
  final Location? location;
  final List<Genre>? markets;
  final List<Dma>? dmas;
  final BoxOfficeInfo? boxOfficeInfo;
  final String? parkingDetail;
  final String? accessibleSeatingDetail;
  final GeneralInfo? generalInfo;
  final UpcomingEvents? upcomingEvents;
  final AttractionLinks? links;

  Venue({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.images,
    this.postalCode,
    this.timezone,
    this.city,
    this.state,
    this.country,
    this.address,
    this.location,
    this.markets,
    this.dmas,
    this.boxOfficeInfo,
    this.parkingDetail,
    this.accessibleSeatingDetail,
    this.generalInfo,
    this.upcomingEvents,
    this.links,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    name: json["name"],
    type: json["type"],
    id: json["id"],
    test: json["test"],
    url: json["url"],
    locale: json["locale"],
    images:
        json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    postalCode: json["postalCode"],
    timezone: json["timezone"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    state: json["state"] == null ? null : State.fromJson(json["state"]),
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    location:
        json["location"] == null ? null : Location.fromJson(json["location"]),
    markets:
        json["markets"] == null
            ? []
            : List<Genre>.from(json["markets"]!.map((x) => Genre.fromJson(x))),
    dmas:
        json["dmas"] == null
            ? []
            : List<Dma>.from(json["dmas"]!.map((x) => Dma.fromJson(x))),
    boxOfficeInfo:
        json["boxOfficeInfo"] == null
            ? null
            : BoxOfficeInfo.fromJson(json["boxOfficeInfo"]),
    parkingDetail: json["parkingDetail"],
    accessibleSeatingDetail: json["accessibleSeatingDetail"],
    generalInfo:
        json["generalInfo"] == null
            ? null
            : GeneralInfo.fromJson(json["generalInfo"]),
    upcomingEvents:
        json["upcomingEvents"] == null
            ? null
            : UpcomingEvents.fromJson(json["upcomingEvents"]),
    links:
        json["_links"] == null
            ? null
            : AttractionLinks.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "id": id,
    "test": test,
    "url": url,
    "locale": locale,
    "images":
        images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
    "postalCode": postalCode,
    "timezone": timezone,
    "city": city?.toJson(),
    "state": state?.toJson(),
    "country": country?.toJson(),
    "address": address?.toJson(),
    "location": location?.toJson(),
    "markets":
        markets == null
            ? []
            : List<dynamic>.from(markets!.map((x) => x.toJson())),
    "dmas":
        dmas == null ? [] : List<dynamic>.from(dmas!.map((x) => x.toJson())),
    "boxOfficeInfo": boxOfficeInfo?.toJson(),
    "parkingDetail": parkingDetail,
    "accessibleSeatingDetail": accessibleSeatingDetail,
    "generalInfo": generalInfo?.toJson(),
    "upcomingEvents": upcomingEvents?.toJson(),
    "_links": links?.toJson(),
  };
}

class Address {
  final String? line1;

  Address({this.line1});

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(line1: json["line1"]);

  Map<String, dynamic> toJson() => {"line1": line1};
}

class BoxOfficeInfo {
  final String? phoneNumberDetail;
  final String? openHoursDetail;
  final String? acceptedPaymentDetail;
  final String? willCallDetail;

  BoxOfficeInfo({
    this.phoneNumberDetail,
    this.openHoursDetail,
    this.acceptedPaymentDetail,
    this.willCallDetail,
  });

  factory BoxOfficeInfo.fromJson(Map<String, dynamic> json) => BoxOfficeInfo(
    phoneNumberDetail: json["phoneNumberDetail"],
    openHoursDetail: json["openHoursDetail"],
    acceptedPaymentDetail: json["acceptedPaymentDetail"],
    willCallDetail: json["willCallDetail"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumberDetail": phoneNumberDetail,
    "openHoursDetail": openHoursDetail,
    "acceptedPaymentDetail": acceptedPaymentDetail,
    "willCallDetail": willCallDetail,
  };
}

class City {
  final String? name;

  City({this.name});

  factory City.fromJson(Map<String, dynamic> json) => City(name: json["name"]);

  Map<String, dynamic> toJson() => {"name": name};
}

class Country {
  final String? name;
  final String? countryCode;

  Country({this.name, this.countryCode});

  factory Country.fromJson(Map<String, dynamic> json) =>
      Country(name: json["name"], countryCode: json["countryCode"]);

  Map<String, dynamic> toJson() => {"name": name, "countryCode": countryCode};
}

class Dma {
  final num? id;

  Dma({this.id});

  factory Dma.fromJson(Map<String, dynamic> json) => Dma(id: json["id"]);

  Map<String, dynamic> toJson() => {"id": id};
}

class GeneralInfo {
  final String? generalRule;
  final String? childRule;

  GeneralInfo({this.generalRule, this.childRule});

  factory GeneralInfo.fromJson(Map<String, dynamic> json) => GeneralInfo(
    generalRule: json["generalRule"],
    childRule: json["childRule"],
  );

  Map<String, dynamic> toJson() => {
    "generalRule": generalRule,
    "childRule": childRule,
  };
}

class Location {
  final String? longitude;
  final String? latitude;

  Location({this.longitude, this.latitude});

  factory Location.fromJson(Map<String, dynamic> json) =>
      Location(longitude: json["longitude"], latitude: json["latitude"]);

  Map<String, dynamic> toJson() => {
    "longitude": longitude,
    "latitude": latitude,
  };
}

class State {
  final String? name;
  final String? stateCode;

  State({this.name, this.stateCode});

  factory State.fromJson(Map<String, dynamic> json) =>
      State(name: json["name"], stateCode: json["stateCode"]);

  Map<String, dynamic> toJson() => {"name": name, "stateCode": stateCode};
}

class EventLinks {
  final First? self;
  final List<First>? attractions;
  final List<First>? venues;

  EventLinks({this.self, this.attractions, this.venues});

  factory EventLinks.fromJson(Map<String, dynamic> json) => EventLinks(
    self: json["self"] == null ? null : First.fromJson(json["self"]),
    attractions:
        json["attractions"] == null
            ? []
            : List<First>.from(
              json["attractions"]!.map((x) => First.fromJson(x)),
            ),
    venues:
        json["venues"] == null
            ? []
            : List<First>.from(json["venues"]!.map((x) => First.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": self?.toJson(),
    "attractions":
        attractions == null
            ? []
            : List<dynamic>.from(attractions!.map((x) => x.toJson())),
    "venues":
        venues == null
            ? []
            : List<dynamic>.from(venues!.map((x) => x.toJson())),
  };
}

class PriceRange {
  final String? type;
  final String? currency;
  final num? min;
  final num? max;

  PriceRange({this.type, this.currency, this.min, this.max});

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
    type: json["type"],
    currency: json["currency"],
    min: json["min"],
    max: json["max"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "currency": currency,
    "min": min,
    "max": max,
  };
}

class Product {
  final String? name;
  final String? id;
  final String? url;
  final String? type;
  final List<Classification>? classifications;

  Product({this.name, this.id, this.url, this.type, this.classifications});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    id: json["id"],
    url: json["url"],
    type: json["type"],
    classifications:
        json["classifications"] == null
            ? []
            : List<Classification>.from(
              json["classifications"]!.map((x) => Classification.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "url": url,
    "type": type,
    "classifications":
        classifications == null
            ? []
            : List<dynamic>.from(classifications!.map((x) => x.toJson())),
  };
}

class Promoter {
  final String? id;
  final String? name;
  final String? description;

  Promoter({this.id, this.name, this.description});

  factory Promoter.fromJson(Map<String, dynamic> json) => Promoter(
    id: json["id"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}

class Sales {
  final Public? public;

  Sales({this.public});

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
    public: json["public"] == null ? null : Public.fromJson(json["public"]),
  );

  Map<String, dynamic> toJson() => {"public": public?.toJson()};
}

class Public {
  final DateTime? startDateTime;
  final bool? startTbd;
  final bool? startTba;
  final DateTime? endDateTime;

  Public({this.startDateTime, this.startTbd, this.startTba, this.endDateTime});

  factory Public.fromJson(Map<String, dynamic> json) => Public(
    startDateTime:
        json["startDateTime"] == null
            ? null
            : DateTime.parse(json["startDateTime"]),
    startTbd: json["startTBD"],
    startTba: json["startTBA"],
    endDateTime:
        json["endDateTime"] == null
            ? null
            : DateTime.parse(json["endDateTime"]),
  );

  Map<String, dynamic> toJson() => {
    "startDateTime": startDateTime?.toIso8601String(),
    "startTBD": startTbd,
    "startTBA": startTba,
    "endDateTime": endDateTime?.toIso8601String(),
  };
}

class Seatmap {
  final String? staticUrl;
  final String? id;

  Seatmap({this.staticUrl, this.id});

  factory Seatmap.fromJson(Map<String, dynamic> json) =>
      Seatmap(staticUrl: json["staticUrl"], id: json["id"]);

  Map<String, dynamic> toJson() => {"staticUrl": staticUrl, "id": id};
}

class TicketLimit {
  final String? info;
  final String? id;

  TicketLimit({this.info, this.id});

  factory TicketLimit.fromJson(Map<String, dynamic> json) =>
      TicketLimit(info: json["info"], id: json["id"]);

  Map<String, dynamic> toJson() => {"info": info, "id": id};
}

class Ticketing {
  final AllInclusivePricing? safeTix;
  final AllInclusivePricing? allInclusivePricing;
  final String? id;

  Ticketing({this.safeTix, this.allInclusivePricing, this.id});

  factory Ticketing.fromJson(Map<String, dynamic> json) => Ticketing(
    safeTix:
        json["safeTix"] == null
            ? null
            : AllInclusivePricing.fromJson(json["safeTix"]),
    allInclusivePricing:
        json["allInclusivePricing"] == null
            ? null
            : AllInclusivePricing.fromJson(json["allInclusivePricing"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "safeTix": safeTix?.toJson(),
    "allInclusivePricing": allInclusivePricing?.toJson(),
    "id": id,
  };
}

class AllInclusivePricing {
  final bool? enabled;

  AllInclusivePricing({this.enabled});

  factory AllInclusivePricing.fromJson(Map<String, dynamic> json) =>
      AllInclusivePricing(enabled: json["enabled"]);

  Map<String, dynamic> toJson() => {"enabled": enabled};
}

class EventModelLinks {
  final First? first;
  final First? prev;
  final First? self;
  final First? next;
  final First? last;

  EventModelLinks({this.first, this.prev, this.self, this.next, this.last});

  factory EventModelLinks.fromJson(Map<String, dynamic> json) =>
      EventModelLinks(
        first: json["first"] == null ? null : First.fromJson(json["first"]),
        prev: json["prev"] == null ? null : First.fromJson(json["prev"]),
        self: json["self"] == null ? null : First.fromJson(json["self"]),
        next: json["next"] == null ? null : First.fromJson(json["next"]),
        last: json["last"] == null ? null : First.fromJson(json["last"]),
      );

  Map<String, dynamic> toJson() => {
    "first": first?.toJson(),
    "prev": prev?.toJson(),
    "self": self?.toJson(),
    "next": next?.toJson(),
    "last": last?.toJson(),
  };
}

class Page {
  final int? size;
  final int? totalElements;
  final int? totalPages;
  final int? number;

  Page({this.size, this.totalElements, this.totalPages, this.number});

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    size: json["size"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "number": number,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
