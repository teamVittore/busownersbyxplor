import 'package:admin_app/UI/presentation/auth/bloc/auth_bloc.dart';
import 'package:admin_app/UI/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:admin_app/UI/presentation/home/cubit/home_cubit.dart';
import 'package:admin_app/UI/presentation/route/cubit/route_cubit.dart';
import 'package:admin_app/core/dataSource/db_const.dart';
import 'package:admin_app/core/models/user_profile_model.dart';
import 'package:admin_app/core/provider/app_navigation_provider.dart';
import 'package:admin_app/core/routes/app_route.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:admin_app/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocators();
  await Hive.initFlutter(); // Initialize Hive

  Hive.registerAdapter(UserProfileModelAdapter());
  await Hive.openBox(token);
  await Hive.openBox<UserProfileModel>(user);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AuthBloc>()),
        BlocProvider(create: (_) => locator<HomeCubit>()),
        BlocProvider(create: (_) => locator<DashboardCubit>()),
        BlocProvider(create: (_) => locator<RouteCubit>()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AppNavigation(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 720),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            AppRoute.setStream(context); // Call setStream here after providers
            return MaterialApp.router(
              title: 'BusOwners By Xplor',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                // fontFamily: GoogleFonts.poppinsTextTheme().fontFamily,
                useMaterial3: true,
                textTheme: GoogleFonts.poppinsTextTheme(),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: primaryColor,
                ).copyWith(
                  surface: Colors.white,
                ),
              ),
              routerConfig: AppRoute.router,
            );
          },
        ),
      ),
    );
  }
}
