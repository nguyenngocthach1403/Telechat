import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:telechat/features/auth/data/repository/auth_repository_impl.dart';
import 'package:telechat/features/auth/data/sources/remote/auth_service_impl.dart';
import 'package:telechat/features/auth/domain/repository/auth_repository.dart';
import 'package:telechat/features/auth/domain/usecase/sign_in_usecase.dart';
import 'package:telechat/features/auth/domain/usecase/sign_up_usecase.dart';
import 'package:telechat/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:telechat/features/group/data/repository/user_repository_impl.dart';
import 'package:telechat/features/group/data/sources/remote/group_service.dart';
import 'package:telechat/features/group/data/sources/remote/user_sevice.dart';
import 'package:telechat/features/group/domain/repository/user_repository.dart';
import 'package:telechat/features/group/domain/usecases/create_new_group_usecase.dart';
import 'package:telechat/features/group/domain/usecases/get_all_user_usecase.dart';
import 'package:telechat/features/group/domain/usecases/get_current_uid.dart';
import 'package:telechat/features/group/domain/usecases/get_my_group_usecase.dart';
import 'package:telechat/features/group/presentations/bloc/group/group_bloc.dart';
import 'package:telechat/features/group/presentations/bloc/user/user_bloc.dart';

final sl = GetIt.instance;
//Firebase
final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

Future<void> initializeDependency() async {
  sl.registerSingleton<AuthServiceImpl>(AuthServiceImpl(auth, firestore));
  sl.registerSingleton<AuthService>(AuthServiceImpl(auth, firestore));

  sl.registerSingleton<UserServiceImpl>(UserServiceImpl(firestore, auth));
  sl.registerSingleton<UserService>(UserServiceImpl(firestore, auth));
  sl.registerSingleton<GroupServiceImpl>(GroupServiceImpl(firestore));
  sl.registerSingleton<GroupService>(GroupServiceImpl(firestore));

  sl.registerSingleton<AuthRepositoryImpl>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<GroupRepositoryImpl>(GroupRepositoryImpl(sl(), sl()));
  sl.registerSingleton<GroupRepository>(GroupRepositoryImpl(sl(), sl()));

  //Usecases
  sl.registerSingleton<SigInUsecase>(SigInUsecase(sl()));
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase(sl()));
  sl.registerSingleton<GetAllUserUsecase>(GetAllUserUsecase(sl()));
  sl.registerSingleton<GetCurrentUID>(GetCurrentUID(sl()));
  sl.registerSingleton<GetMyGroupUsecase>(GetMyGroupUsecase(sl()));
  sl.registerSingleton<CreateNewGroupUseCase>(CreateNewGroupUseCase(sl()));

  //Bloc
  sl.registerFactory(() => AuthBloc(sl(), sl()));
  sl.registerFactory(() => UserBloc(sl(), sl()));
  sl.registerFactory(() => GroupBloc(sl(), sl(), sl()));
}
