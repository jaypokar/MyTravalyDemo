extension ListExtensions on List {
  bool areElementsDistinct() {
    // Convert the list to a set to remove duplicate elements
    Set<dynamic> set = Set.from(this);

    // Compare the lengths
    return length == set.length;
  }
}
