final class ToolInfo {
  const ToolInfo({
    required this.name,
    required this.installed,
    this.version,
    this.location,
  });

  final String name;
  final bool installed;
  final String? version;
  final String? location;
}
