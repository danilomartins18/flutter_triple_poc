abstract class ILocalStorageService {
  Future get(String key);
  Future delete(String key);
  Future save(String key, dynamic value);
  Future removeAll();
}
