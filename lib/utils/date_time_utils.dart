import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String durationBeforeCurrent() {
    DateTime now = DateTime.now();
    int comparisonResult = now.compareTo(this);

    if (comparisonResult < 0) {
      return '--';
    }
    Duration duration = now.difference(this);
    return '${duration.formatDuration()} trước';
  }

  String get hhmm {
    var format = DateFormat('HH:mm');
    String dateString = format.format(this);
    return dateString;
  }

  String get hhmma {
    var format = DateFormat('hh:mm a');
    String dateString = format.format(this);
    return dateString;
  }

  String get ddmmyyy {
    var format = DateFormat('dd/MM/yyyy');
    String dateString = format.format(this);
    return dateString;
  }
}

extension DurationExtension on Duration {
  String formatDuration() {
    Duration duration = this;
    int oneDayInSeconds = Duration.secondsPerDay;
    int oneHourInSeconds = Duration.secondsPerHour;

    if (duration.inSeconds < oneHourInSeconds) {
      return "${duration.inMinutes} phút";
    } else if (duration.inSeconds < oneDayInSeconds) {
      int hours = (duration.inSeconds / oneHourInSeconds).floor();
      int minutes = (duration.inSeconds.remainder(oneHourInSeconds) /
              Duration.secondsPerMinute)
          .floor();
      return "$hours giờ $minutes  phút";
    } else {
      int days = duration.inDays;
      int hours =
          (duration.inSeconds.remainder(oneDayInSeconds) / oneHourInSeconds)
              .floor();
      return "$days ngày $hours giờ";
    }
  }
}
