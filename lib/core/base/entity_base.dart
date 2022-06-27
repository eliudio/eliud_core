abstract class EntityBase {
  Map<String, Object?> toDocument();
  Future<Map<String, Object?>> enrichedDocument(Map<String, Object?> theDocument);
}
