
class SearchResult {
  final bool cancel;
  final bool manual;

  SearchResult({
    required this.cancel, 
    this.manual = false,
    });
  // TODO: name, description, latlon
  @override
  String toString() {
    // TODO: implement toString
    return '{cancel: $cancel, manual $manual}';
  }
}