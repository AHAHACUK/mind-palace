class Node {
  final int id;
  final String name;
  final int? parentNodeId;

  bool get isRoot => parentNodeId == null;

  Node({required this.id, required this.name, required this.parentNodeId});

  Node copyWith({String? name}) {
    return Node(id: id, name: name ?? this.name, parentNodeId: parentNodeId);
  }
}
