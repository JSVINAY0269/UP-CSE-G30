import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:site_manager/features/feature_auth/data/data_sources/auth_data_source.dart';
import 'package:site_manager/features/feature_auth/data/repositories/auth_repository_impl.dart';
import 'package:site_manager/features/feature_auth/domain/repositories/auth_repository.dart';
import 'package:site_manager/features/feature_auth/domain/use_cases/auth_use_cases.dart';
import 'package:site_manager/features/feature_auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:site_manager/features/feature_auth/domain/use_cases/search_users_use_case.dart';
import 'package:site_manager/features/feature_team/data/data_sources/team_data_source.dart';
import 'package:site_manager/features/feature_team/data/repositories/team_repository_impl.dart';
import 'package:site_manager/features/feature_team/domain/repositories/team_repository.dart';
import 'package:site_manager/features/feature_team/domain/use_cases/add_member_use_case.dart';
import 'package:site_manager/features/feature_team/domain/use_cases/add_task_progress_use_case.dart';
import 'package:site_manager/features/feature_team/domain/use_cases/add_task_use_case.dart';
import 'package:site_manager/features/feature_team/domain/use_cases/create_team_use_case.dart';
import 'package:site_manager/features/feature_team/domain/use_cases/get_task_progress_use_case.dart';
import 'package:site_manager/features/feature_team/domain/use_cases/get_team_info_use_case.dart';
import 'package:site_manager/features/feature_team/domain/use_cases/get_teams_user_case.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/feature_auth/domain/use_cases/auth_state_stream_use_case.dart';
import 'features/feature_team/domain/use_cases/update_task_use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await dotenv.load(fileName: ".env");
  final supabaseUrl = dotenv.env["SUPABASE_URL"].toString();
  final supabaseAnonKey = dotenv.env["SUPABASE_ANON_KEY"].toString();

  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  sl.registerFactory(() => supabase);

  // Data Sources

  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(supabase: sl()));

  sl.registerLazySingleton<TeamDataSource>(
      () => TeamDataSourceImpl(supabase: sl()));

  // Repositories

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: sl()));

  sl.registerLazySingleton<TeamRepository>(
      () => TeamRepositoryImpl(teamDataSource: sl()));

  // UseCases

  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()));

  sl.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(authRepository: sl()));

  sl.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(authRepository: sl()));

  sl.registerLazySingleton<AuthStateStreamUseCase>(
      () => AuthStateStreamUseCase(authRepository: sl()));

  sl.registerLazySingleton<GetCurrentUserUseCase>(
      () => GetCurrentUserUseCase(authRepository: sl()));

  sl.registerLazySingleton<SearchUserUseCase>(
      () => SearchUserUseCase(authRepository: sl()));

  sl.registerLazySingleton<GetTeamsUseCase>(
      () => GetTeamsUseCase(teamRepository: sl()));

  sl.registerLazySingleton<GetTeamInfoUseCase>(
      () => GetTeamInfoUseCase(teamRepository: sl()));

  sl.registerLazySingleton<AddMemberUseCase>(
      () => AddMemberUseCase(teamRepository: sl()));

  sl.registerLazySingleton<AddTaskUseCase>(
      () => AddTaskUseCase(teamRepository: sl()));

  sl.registerLazySingleton<UpdateTaskUseCase>(
      () => UpdateTaskUseCase(teamRepository: sl()));

  sl.registerLazySingleton<CreateTeamUseCase>(
      () => CreateTeamUseCase(teamRepository: sl()));

  sl.registerLazySingleton<AddTaskProgressUseCase>(
      () => AddTaskProgressUseCase(teamRepository: sl()));

  sl.registerLazySingleton<GetTaskProgressUseCase>(
      () => GetTaskProgressUseCase(teamRepository: sl()));
}
