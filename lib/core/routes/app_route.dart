import 'package:admin_app/UI/presentation/auth/bloc/auth_bloc.dart';
import 'package:admin_app/UI/presentation/auth/pages/auth_page.dart';
import 'package:admin_app/UI/presentation/dashboard/pages/dashboard_page.dart';
import 'package:admin_app/UI/presentation/home/cubit/home_cubit.dart';
import 'package:admin_app/UI/presentation/home/home_screen.dart';
import 'package:admin_app/UI/presentation/home/model/vehicle_model.dart';
import 'package:admin_app/UI/presentation/intro/pages/intro_page.dart';
import 'package:admin_app/UI/presentation/payment/pages/add_card_details_page.dart';
import 'package:admin_app/UI/presentation/payment/pages/add_upi_page.dart';
import 'package:admin_app/UI/presentation/payment/pages/payment_page.dart';
import 'package:admin_app/UI/presentation/privacy_policy/pages/privacy_policy_page.dart';
import 'package:admin_app/UI/presentation/profile/cubit/profile_cubit.dart';
import 'package:admin_app/UI/presentation/profile/edit_profile_screen.dart';
import 'package:admin_app/UI/presentation/profile/profile_screen.dart';
import 'package:admin_app/UI/presentation/route/pages/route_screen.dart';
import 'package:admin_app/UI/presentation/splash/splash_screen_page.dart';
import 'package:admin_app/UI/presentation/vehicle_trip/cubit/vehicle_trip_cubit.dart';
import 'package:admin_app/UI/presentation/vehicle_trip/pages/vehicle_trip_page.dart';
import 'package:admin_app/UI/presentation/vehicles/vehicles_screen.dart';
import 'package:admin_app/core/dataSource/token_manager.dart';
import 'package:admin_app/core/service/dependancy_injection.dart';
import 'package:admin_app/core/utils/go_router_refresh_stream.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final List<String> globalPaths = [
  Routes.forgotPass.path,
  Routes.otpVerification.path,
  Routes.resetPassword.path,
  Routes.splashScreen.path,
];

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRoute {
  static late BuildContext context;

  static final GoRouter router = GoRouter(
    // navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => const SplashScreenPage(),
      ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.intro.path,
      ),
      GoRoute(
        path: Routes.vehicleDetails.path,
        name: Routes.vehicleDetails.name,
        // builder: (context, state) {
        //   log("dfsfsdfsdfsd ${state.uri.queryParameters["id"]}");
        //   return const VehicleTripPage(
        //     name: "data",
        //   );
        // },
        builder: (context, state) => BlocProvider.value(
          value: locator<VehicleTripCubit>()
            ..getTripDetail(
              start: state.uri.queryParameters['start']!,
              to: state.uri.queryParameters['end']!,
              vehicleId: state.uri.queryParameters["id"]!,
            ),
          child: VehicleTripPage(
            name: state.uri.queryParameters['vehicleNumber']!,
          ),
        ),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const AuthPage(),
      ),
      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        builder: (context, state, child) {
          return HomeScreen(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.dashboard.path,
            name: Routes.dashboard.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: DashboardPage(),
            ),
          ),
          GoRoute(
            path: Routes.vehicles.path,
            name: Routes.vehicles.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: BlocProvider.value(
                value: locator<HomeCubit>()..getVehicles(),
                child: const VehiclesScreen(),
              ),
            ),
          ),
          GoRoute(
            path: Routes.profile.path,
            name: Routes.profile.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: BlocProvider.value(
                value: locator<ProfileCubit>()..getProfile(),
                child: ProfileScreen(),
              ),
            ),
            routes: [
              GoRoute(
                path: Routes.editprofile.path,
                name: Routes.editprofile.name,
                builder: (_, __) => BlocProvider.value(
                  value: locator<ProfileCubit>()..getProfile(),
                  child: const EditProfileScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.privacyPolicy.path,
        name: Routes.privacyPolicy.name,
        builder: (_, __) => const PrivacyPolicyPage(),
      ),
      GoRoute(
        path: Routes.intro.path,
        name: Routes.intro.name,
        builder: (_, __) => const IntroPage(),
      ),
      GoRoute(
        path: Routes.payment.path,
        name: Routes.payment.name,
        builder: (_, __) => const PaymentPage(),
      ),
      GoRoute(
        path: Routes.addCard.path,
        name: Routes.addCard.name,
        builder: (_, __) => const AddCardDetailsPage(),
      ),
      GoRoute(
        path: Routes.addUpi.path,
        name: Routes.addUpi.name,
        builder: (_, __) => const AddUpiPage(),
      ),
      GoRoute(
        path: Routes.routes.path,
        name: Routes.routes.name,
        builder: (context, state) {
          VehicleModel vehicleModel =
              state.extra as VehicleModel; // -> casting is important
          return RouteScreen(
            vehicleModel: vehicleModel,
          );
        },
      ),
    ],
    initialLocation: Routes.splashScreen.path,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.watch<AuthBloc>().stream),
    redirect: (_, GoRouterState state) async {
      final isLoggedIn = await TokenManager().getToken();
      if (isLoggedIn != null) {
        if (state.matchedLocation == Routes.login.path) {
          return Routes.root.path;
        } else {
          return null;
        }
      } else {
        // Check if the route matches any global route pattern
        final isGlobalRoute = globalPaths.any((path) {
          final routePattern = RegExp(path.replaceAll(RegExp(r':\w+'), r'\w+'));
          return routePattern.hasMatch(state.matchedLocation);
        });

        if (isGlobalRoute) {
          // If not logged in but accessing a global route, allow access
          return null;
        } else {
          // If not logged in or logged out and not accessing a global route, redirect to login page
          return Routes.login.path;
        }
      }
    },
  );

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }
}

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),
  dashboard("/dashboard"),
  vehicleDetails("/vehicleDetails"),
  vehicles("/vehicles"),
  privacyPolicy("/privacy_policy"),
  profile("/profile"),
  editprofile("editprofile"),
  login("/login"),
  routes("/routes"),
  intro("/intro"),
  payment("/payment"),
  addCard("/addcard"),
  addUpi("/addupi"),
  addBank("/addbank"),

  forgotPass("/forgotpass"),
  otpVerification("/otpverification"),
  resetPassword("/resetpassword");

  final String path;

  const Routes(this.path);
}
