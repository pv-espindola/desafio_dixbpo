import 'dart:convert';


class AppException implements Exception {
  final String message;
  final String code;

  AppException({required this.message, required this.code});

  @override
  String toString() {
    return "$code: $message";
  }

  String? get parsedError {
    try {
      final responseData = json.decode(message) as Map<String, dynamic>;

      if (responseData.containsKey('non_field_errors')) {
        return responseData['non_field_errors'][0];
      }
    } catch (_) {}

    return null;
  }

  /// Handles the exception by showing a dialog with the error message or an
  /// inline error message in the form. If the error message contains a
  /// `non_field_errors` key, the error message is shown in a dialog. Otherwise,
  /// the error message is shown in an inline error message in the form.
  // void handleFormException(
  //   BuildContext context,
  //   GlobalKey<FormBuilderState> formKey,
  // ) {
  //   final responseData = json.decode(message) as Map<String, dynamic>;
  //
  //   if (responseData.containsKey('non_field_errors')) {
  //     final msg = responseData['non_field_errors'][0];
  //
  //     final lastKey = formKey.currentState?.fields.keys.last;
  //     final field = formKey.currentState?.fields[lastKey];
  //     if (lastKey != null && field != null) {
  //       field.invalidate(msg);
  //     } else {
  //       //errorDialog(context, msg);
  //     }
  //   } else {
  //     // for each responseData key, find the corresponding field in the form
  //     // and set the error message
  //     int invalidCount = 0;
  //     for (final key in responseData.keys) {
  //       final field = formKey.currentState?.fields[key];
  //       if (field != null) {
  //         final String msg;
  //         if (responseData[key] is List && responseData[key].length > 0) {
  //           msg = responseData[key][0];
  //         } else {
  //           msg = responseData[key].toString();
  //         }
  //         field.invalidate(msg);
  //         invalidCount++;
  //       }
  //     }
  //
  //     // if no fields were invalidated, show a generic error message
  //     if (invalidCount == 0) {
  //       //errorDialog(context, AppLocalizations.of(context)!.dialogError);
  //     }
  //   }
  // }
}

class ServerErrorException extends AppException {
  ServerErrorException(String message)
      : super(message: message, code: 'server_error');
}

class BadRequestException extends AppException {
  BadRequestException(String message)
      : super(message: message, code: 'bad_request_error');
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message)
      : super(message: message, code: 'unauthorised_error');
}

class NotFoundException extends AppException {
  NotFoundException(String message)
      : super(message: message, code: 'not_found_error');
}

class SocialAuthException extends AppException {
  SocialAuthException(String message)
      : super(message: message, code: 'social_auth_error');
}
