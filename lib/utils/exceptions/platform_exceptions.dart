
class TPlatformException implements Exception {

  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'invalid_login_Credentials':
        return 'Invalid login credentials. Please double-check your information';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method.';
      case 'invalid-password':
        return 'Incorrect Password. Please try again.';
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your firebase project.';
      case 'session-cookie-expired':
        return 'The Firebase cookie has expired.Please sign in again';
      case 'sign_in_failed':
        return 'sign-in failed. Please try again later.';
      case 'internal-error':
        return 'internal error.Please try later.';
      case 'invalid-verification-code':
        return 'Invalid verification code.Please enter a valid code';
      default:
        return 'An unexpected firebase error occurred.Please try again.';
    }
  }
}