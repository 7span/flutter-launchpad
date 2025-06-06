import 'package:api_client/api_client.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

final userApiClient = getIt.get<RestApiClient>(instanceName: 'user');

final baseApiClient = getIt.get<RestApiClient>(instanceName: 'base');
