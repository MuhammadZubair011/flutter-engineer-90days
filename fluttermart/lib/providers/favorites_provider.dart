import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    ref.keepAlive();
    return {};
  }

  void toggleFavorite(String productId) {
    if (state.contains(productId)) {
      state = state.where((id) => id != productId).toSet();
    } else {
      state = {...state, productId};
    }

  }

  // ── CHECK if product is favorited ─────────────────────────

  bool isFavorite (String productId) => state.contains(productId);

  // ── COUNT ─────────────────────────────────────────────────
  int get count => state.length;
}

final favoriteProvider = NotifierProvider<FavoriteNotifier, Set<String>>(
  FavoriteNotifier.new,
);


