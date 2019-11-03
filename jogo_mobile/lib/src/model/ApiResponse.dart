class Response<T> {
  bool ok;
  String msg;
  T result;

  Response.ok({this.result,this.msg}) {
    ok = true;
  }

  Response.error({this.result,this.msg}) {
    ok = false;
  }
}