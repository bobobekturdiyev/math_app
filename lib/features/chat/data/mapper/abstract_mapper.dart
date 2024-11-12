/// {@category Mapper}
///
/// Abstract class Mapper maps data exceptions to domain exception and
/// it's a base class for other mappers which can override logic of mapping
/// certain data exceptions
///
abstract class Mapper {
  // Constructor
  const Mapper();

  // Functions
  Exception getException(Exception error) {
    return error;
  }
}