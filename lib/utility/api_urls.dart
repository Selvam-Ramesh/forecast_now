class api_urls{
  static const String baseUrl = 'http://api.weatherapi.com/v1/';
  static const String apikey ='key=';

  static const String getforcast = baseUrl+'forecast.json?'+apikey+'&q=';


 /* static const String getallcategories = baseUrl + '/category';
  static const String getcategorybyid = baseUrl + '/category/';

  static const String getallproducts = baseUrl + '/product';
  static const String getallproductsbycategoryid = baseUrl + '/product/';
  static const String getproductbytitle = baseUrl + '/product/search?q=';

  static const String getallorders = baseUrl + '/order';
  static const String getorderbyid = baseUrl + '/order/';
  static const String getordersofcurrentuser = baseUrl + '/order/';
  static const String createorder = baseUrl + '/order';
  static const String deleteorderbyid = baseUrl + '/order/';*/

}