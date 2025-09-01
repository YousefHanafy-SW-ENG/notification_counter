abstract class AppAssets {
  static const Images images = Images();
  static const AppIcons icons = AppIcons();
}

class Images {
  const Images();
  final String profilePhoto = 'assets/images/profile_photo.jpg';
  final String productPhoto = 'assets/images/product_photo.png';
}

class AppIcons {
  const AppIcons();
  final String filterIcon = 'assets/icons/filter_icon.svg';
  final String notificationIcon = 'assets/icons/notification_icon.svg';
  final String replyArrowIcon = 'assets/icons/reply_arrow.svg';
  final String ratingIcon = 'assets/icons/rating_icon.svg';
}