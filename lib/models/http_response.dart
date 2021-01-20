//the t is that its like a list which can have a data in it when returned
//as demonstrated inside the api_service.dart

class HttpResponse<T> {
  bool isSuccessful;
  T data;
  String message;
  int responseCode;
  HttpResponse(this.isSuccessful, this.data, {this.message, this.responseCode});
}
