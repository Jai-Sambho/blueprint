import 'package:blueprint/src/presentation/screen/home/home_screen.dart';
import 'package:blueprint/src/routes/app_routes_constants.dart';
import 'package:go_router/go_router.dart';

class HomeRoutes {
  static final List<GoRoute> routes = [
    GoRoute(
        name: 'home',
        path: ApplicationRoutesConstants.home,
        builder: (context, state) => HomeScreen()),
  ];
}
