class NotificationState {
  final int count;
  final bool isLoading;
  final String? error;

  const NotificationState({
    this.count = 0,
    this.isLoading = false,
    this.error,
  });

  NotificationState copyWith({
    int? count,
    bool? isLoading,
    String? error,
  }) {
    return NotificationState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}