
class AppConstant{

static const int splashDlay=3;
static const int animationDlay=2000;
static const double animationbegin=.2;
static const double animationend=1;
static const String baseUrl ="https://magdsoft-internship.herokuapp.com/api/";
static const String helpUrl="${baseUrl}getHelp";
static const String productsUrl="${baseUrl}getProducts";
getSiginUrl({ required int phoneNumber, required String name}) =>
     "${baseUrl}verifyPhone?phone=$phoneNumber&name=$name";

getOtpUrl({required int code, required int phoneNumber}) =>
    "${baseUrl}otp?code=$code&phone=$phoneNumber";

}