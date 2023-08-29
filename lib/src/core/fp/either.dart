sealed class Either<E extends Exception, S> {}

// classe que representa o falha 
class Failure<E extends Exception, S> extends Either<E, S> {
  final E exception;
  Failure(this.exception);
}

// classe que representa o falha 
class Success<E extends Exception, S> extends Either<E, S> {
  final S value;
  Success(this.value);
}
