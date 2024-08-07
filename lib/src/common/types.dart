typedef Json = Map<String, dynamic>;
typedef JsonList = List<dynamic>;
typedef JsonListNested = List<Json>;

extension JsonUtil on Json {
  dynamic get(String key) {
    if (containsKey(key)) return this[key];
    return null;
  }
}
