class ApiUrl {
  static const baseUrl = "https://ryd-leap-backend.vercel.app";

  static const otpUrl = "$baseUrl/api/v1/otp/send-otp";
  static const verifyOtpUrl = "$baseUrl/api/v1/otp/verify-otp";
  static const userRegistrationUrl = "$baseUrl/api/v1/users/register";
  static const driverRegistrationUrl = "$baseUrl/api/v1/users/create-rider";
  static const loginUrl = "$baseUrl/api/v1/auth/login";
}
