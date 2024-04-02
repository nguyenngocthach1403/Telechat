import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:telechat/features/auth/data/repository/auth_repository_impl.dart';
import 'package:telechat/features/auth/data/sources/remote/auth_service_impl.dart';
import 'package:telechat/features/auth/domain/repository/auth_repository.dart';
import 'package:telechat/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:telechat/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:telechat/features/auth/presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;
//Firebase
final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

Future<void> initializeDependency() async {
  sl.registerSingleton<AuthServiceImpl>(AuthServiceImpl(auth, firestore));
  sl.registerSingleton<AuthService>(AuthServiceImpl(auth, firestore));

  sl.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));

  //Usecases
  sl.registerSingleton<SigInUsecase>(SigInUsecase(sl()));
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase(sl()));

  //Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl()));
}
