// 📌 File: lib/router.dart
import 'package:go_router/go_router.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/vehicle_search_screen.dart';
import 'screens/work_ticket_screen.dart';
import 'screens/driver_search_screen.dart';
import 'screens/activity_history_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash', // ✅ Set splash screen as the first screen
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/vehicle-search', builder: (context, state) => VehicleSearchScreen()),
    GoRoute(path: '/work-ticket', builder: (context, state) => WorkTicketScreen()),
    GoRoute(path: '/driver-search', builder: (context, state) => DriverSearchScreen()),
    GoRoute(path: '/activity-history', builder: (context, state) => ActivityHistoryScreen()),
  ],
);
