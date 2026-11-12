import 'package:intl/intl.dart';

extension TimeAndDate on DateTime{

  String get getTime => DateFormat("h:mm a").format(this);
  String get getDate => DateFormat("MMM d, yyyy").format(this);

  String getFullDateAndTime() => DateFormat("MMM d, yyyy h:mm a").format(this);

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.isNegative) {
      return 'in the future';
    }

    if (difference.inSeconds < 60) {
      return 'just now';
    }

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    }

    if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    }

    if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    if (difference.inDays < 30) {
      return '${difference.inDays ~/ 7} weeks ago';
    }

    if (difference.inDays < 365) {
      return '${difference.inDays ~/ 30} months ago';
    }

    return '${difference.inDays ~/ 365} years ago';
  }

}


