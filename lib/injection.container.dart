import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:telechat/features/login/data/repository/auth_repository_impl.dart';
import 'package:telechat/features/login/data/sources/remote/auth_service_impl.dart';
import 'package:telechat/features/login/domain/repository/auth_repository.dart';
import 'package:telechat/features/login/domain/usecase/is_sign_in_usecase.dart';
import 'package:telechat/features/login/domain/usecase/sign_in_usecase.dart';
import 'package:telechat/features/login/domain/usecase/sign_up_usecase.dart';
import 'package:telechat/features/login/presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  sl.registerSingleton<AuthServiceImpl>(AuthServiceImpl(FirebaseAuth.instance));
  sl.registerSingleton<AuthService>(AuthServiceImpl(FirebaseAuth.instance));

  sl.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  //Usecases
  sl.registerSingleton<SigInUsecase>(SigInUsecase(sl()));
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase(sl()));
  sl.registerSingleton<IsSignInUsecase>(IsSignInUsecase(sl()));

  //Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl(), sl()));
}
