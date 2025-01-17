
String formatDate(DateTime publishedAt) {
  final now = DateTime.now();
  final difference = now.difference(publishedAt);

  if (difference.inDays >= 1) {
    return "${difference.inDays} Day${difference.inDays > 1 ? 's' : ''} Ago";
  } else if (difference.inHours >= 1) {
    return "${difference.inHours} Hour${difference.inHours > 1 ? 's' : ''} Ago";
  } else if (difference.inMinutes >= 1) {
    return "${difference.inMinutes} Minute${difference.inMinutes > 1 ? 's' : ''} Ago";
  } else {
    return "Just Now";
  }
}
