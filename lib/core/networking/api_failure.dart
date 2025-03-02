import 'dart:io';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection to the server timed out. Please check your internet connection.');
      case DioExceptionType.sendTimeout:
        return const ServerFailure('Request send timed out. Please try again.');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Response receive timed out. Please try again later.');
      case DioExceptionType.badCertificate:
        return const ServerFailure('Invalid security certificate.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode ?? 500,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return const ServerFailure('Request cancelled. Please try again.');
      case DioExceptionType.connectionError:
        return const ServerFailure('Network connection failed. Please check your internet connection.');
      case DioExceptionType.unknown:
        if (_isNetworkError(dioException)) {
          return const ServerFailure('No internet connection.');
        }
        return const ServerFailure('An unexpected error occurred.');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic responseData) {
    final message = _parseResponseMessage(responseData);

    switch (statusCode) {
      case 400:
        return ServerFailure(message ?? 'Invalid request data.');
      case 401:
        return ServerFailure(message ?? 'Authentication required.');
      case 403:
        return ServerFailure(message ?? 'Access denied.');
      case 404:
        return ServerFailure(message ?? 'Resource not found.');
      case 408:
        return ServerFailure(message ?? 'Request timed out.');
      case 500:
        return ServerFailure(message ?? 'Internal server error.');
      case 503:
        return ServerFailure(message ?? 'Service currently unavailable.');
      default:
        return ServerFailure(message ?? 'Request failed with status code $statusCode.');
    }
  }

  static String? _parseResponseMessage(dynamic responseData) {
    if (responseData == null) return null;

    // Handle string responses
    if (responseData is String) {
      return responseData.isNotEmpty ? responseData : null;
    }

    // Handle map responses
    if (responseData is Map<String, dynamic>) {
      // Check common error message fields
      return responseData['message']?.toString() ??
          responseData['error']?.toString() ??
          responseData['detail']?.toString() ??
          _parseNestedErrors(responseData);
    }

    // Handle list responses
    if (responseData is List && responseData.isNotEmpty) {
      return responseData.first.toString();
    }

    return null;
  }

  static String? _parseNestedErrors(Map<String, dynamic> responseData) {
    // Handle nested errors structure
    final errors = responseData['errors'];
    if (errors is Map && errors.isNotEmpty) {
      return errors.values.first?.toString();
    }
    if (errors is List && errors.isNotEmpty) {
      return errors.first.toString();
    }

    // Fallback to first available value
    final firstValue = responseData.values.firstOrNull;
    if (firstValue is List && firstValue.isNotEmpty) {
      return firstValue.first.toString();
    }

    return firstValue?.toString();
  }

  static bool _isNetworkError(DioException dioException) {
    return dioException.error is SocketException || (dioException.message?.contains('SocketException') ?? false);
  }
}

class CacheFailure extends Failure {
  const CacheFailure(super.errorMessage);

  factory CacheFailure.fromException(Exception exception) {
    return CacheFailure('Cache error: ${exception.runtimeType}');
  }
}
