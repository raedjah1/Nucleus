abstract class UseCase<T, U> {
  U execute(T request);
}
