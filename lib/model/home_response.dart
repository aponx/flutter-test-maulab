class HomeResponse<T> {
  Status status;
  T? data;
  String? message;

  HomeResponse.initial(this.message) : status = Status.INITIAL;

  HomeResponse.loading(this.message) : status = Status.LOADING;

  HomeResponse.completed(this.data) : status = Status.COMPLETED;

  HomeResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { INITIAL, LOADING, COMPLETED, ERROR }
