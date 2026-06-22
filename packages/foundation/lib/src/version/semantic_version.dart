final class SemanticVersion implements Comparable<SemanticVersion> {
  const SemanticVersion({required this.major, required this.minor, required this.patch});

  final int major;
  final int minor;
  final int patch;

  @override
  int compareTo(SemanticVersion other) {
    if (major != other.major) {
      return major.compareTo(other.major);
    }

    if (minor != other.minor) {
      return minor.compareTo(other.minor);
    }

    return patch.compareTo(other.patch);
  }

  @override
  String toString() => '$major.$minor.$patch';
}
