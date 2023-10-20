///////create the folder 'models' inside lib folder and place this file inside models folder

class Place {
  int? uid;
  double? lat;
  double? lng;
  bool? bike;
  String? name;
  String? address;
  bool? spot;
  int? number;
  int? bookedBikes;
  int? bikes;
  int? bikesAvailableToRent;
  int? bikeRacks;
  int? freeRacks;
  int? specialRacks;
  int? freeSpecialRacks;
  bool? maintenance;
  String? terminalType;
  List<BikeList>? bikeList;
  List<String>? bikeNumbers;
  BikeTypes? bikeTypes;
  String? placeType;
  bool? rackLocks;

  Place(
      {this.uid,
      this.lat,
      this.lng,
      this.bike,
      this.name,
      this.address,
      this.spot,
      this.number,
      this.bookedBikes,
      this.bikes,
      this.bikesAvailableToRent,
      this.bikeRacks,
      this.freeRacks,
      this.specialRacks,
      this.freeSpecialRacks,
      this.maintenance,
      this.terminalType,
      this.bikeList,
      this.bikeNumbers,
      this.bikeTypes,
      this.placeType,
      this.rackLocks});

  Place.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    lat = json['lat'];
    lng = json['lng'];
    bike = json['bike'];
    name = json['name'];
    address = json['address'];
    spot = json['spot'];
    number = json['number'];
    bookedBikes = json['booked_bikes'];
    bikes = json['bikes'];
    bikesAvailableToRent = json['bikes_available_to_rent'];
    bikeRacks = json['bike_racks'];
    freeRacks = json['free_racks'];
    specialRacks = json['special_racks'];
    freeSpecialRacks = json['free_special_racks'];
    maintenance = json['maintenance'];
    terminalType = json['terminal_type'];
    if (json['bike_list'] != null) {
      bikeList = <BikeList>[];
      json['bike_list'].forEach((v) {
        bikeList!.add(new BikeList.fromJson(v));
      });
    }
    bikeNumbers = json['bike_numbers'].cast<String>();
    bikeTypes = json['bike_types'] != null
        ? new BikeTypes.fromJson(json['bike_types'])
        : null;
    placeType = json['place_type'];
    rackLocks = json['rack_locks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['bike'] = this.bike;
    data['name'] = this.name;
    data['address'] = this.address;
    data['spot'] = this.spot;
    data['number'] = this.number;
    data['booked_bikes'] = this.bookedBikes;
    data['bikes'] = this.bikes;
    data['bikes_available_to_rent'] = this.bikesAvailableToRent;
    data['bike_racks'] = this.bikeRacks;
    data['free_racks'] = this.freeRacks;
    data['special_racks'] = this.specialRacks;
    data['free_special_racks'] = this.freeSpecialRacks;
    data['maintenance'] = this.maintenance;
    data['terminal_type'] = this.terminalType;
    if (this.bikeList != null) {
      data['bike_list'] = this.bikeList!.map((v) => v.toJson()).toList();
    }
    data['bike_numbers'] = this.bikeNumbers;
    if (this.bikeTypes != null) {
      data['bike_types'] = this.bikeTypes!.toJson();
    }
    data['place_type'] = this.placeType;
    data['rack_locks'] = this.rackLocks;
    return data;
  }
}

class BikeList {
  String? number;
  int? bikeType;
  List<String>? lockTypes;
  bool? active;
  String? state;
  bool? electricLock;
  int? boardcomputer;
  Null? pedelecBattery;
  Null? batteryPack;

  BikeList(
      {this.number,
      this.bikeType,
      this.lockTypes,
      this.active,
      this.state,
      this.electricLock,
      this.boardcomputer,
      this.pedelecBattery,
      this.batteryPack});

  BikeList.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    bikeType = json['bike_type'];
    lockTypes = json['lock_types'].cast<String>();
    active = json['active'];
    state = json['state'];
    electricLock = json['electric_lock'];
    boardcomputer = json['boardcomputer'];
    pedelecBattery = json['pedelec_battery'];
    batteryPack = json['battery_pack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['bike_type'] = this.bikeType;
    data['lock_types'] = this.lockTypes;
    data['active'] = this.active;
    data['state'] = this.state;
    data['electric_lock'] = this.electricLock;
    data['boardcomputer'] = this.boardcomputer;
    data['pedelec_battery'] = this.pedelecBattery;
    data['battery_pack'] = this.batteryPack;
    return data;
  }
}

class BikeTypes {
  int? i71;
  int? i150;

  BikeTypes({this.i71, this.i150});

  BikeTypes.fromJson(Map<String, dynamic> json) {
    i71 = json['71'];
    i150 = json['150'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['71'] = this.i71;
    data['150'] = this.i150;
    return data;
  }
}
