import 'package:get_it/get_it.dart';

import 'email/email_api/email_api.dart';
import 'email/email_api/email_repository.dart';
import 'email/email_bloc.dart';
import 'package:http/http.dart' as http;


final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => EmailBloc(getIt()));
  getIt.registerLazySingleton<EmailRepository>(() => EmailRepositoryImpl(emailApi: getIt()));
  getIt.registerLazySingleton<EmailApi>(() => EmailApiImpl(client: getIt()));
  getIt.registerLazySingleton(() => http.Client());

}