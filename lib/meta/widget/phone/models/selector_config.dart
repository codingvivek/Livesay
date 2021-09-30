@Deprecated('use CountrySelectorNavigation instead')
abstract class SelectorConfig {
  const SelectorConfig();
  static coverSheet() => const SelectorConfigCoverSheet();
}

@Deprecated('use CountrySelectorNavigation instead')
class SelectorConfigCoverSheet extends SelectorConfig {
  const SelectorConfigCoverSheet();
  @override
  bool operator ==(Object other) {
    return other is SelectorConfigCoverSheet;
  }

  @override
  int get hashCode;
}
