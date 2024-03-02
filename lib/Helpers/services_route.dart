class ClienteServicesRoute {
  static String url = "http://192.168.1.7:5167";
  
  static String get find => "$url/api/1.0/Cliente";
  static String findId(String id) => "$url/api/1.0/Cliente/$id";
}

class ProveedorServicesRoute {
  static String url = "http://192.168.1.7:5167";
  
  static String get find => "$url/api/1.0/Proveedor";
  static String findId(String id) => "$url/api/1.0/Proveedor/$id";
}

