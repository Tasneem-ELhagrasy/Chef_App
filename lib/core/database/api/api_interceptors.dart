import 'package:chef_app/core/database/api/end_points.dart';
import 'package:chef_app/core/database/cache/cache.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:dio/dio.dart';

class ApiInterCeptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] =
        sl<Cache>().getStringData(ApiKeys.token) != null
            ? 'FOODAPI ${sl<Cache>().getStringData(ApiKeys.token)}'
            : null;
    super.onRequest(options, handler);
  }
  
  
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {    
    super.onResponse(response, handler);
    // return handler.next(response);
  }
  
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {        
    super.onError(err, handler);
        // return handler.next(err);

  }
}
