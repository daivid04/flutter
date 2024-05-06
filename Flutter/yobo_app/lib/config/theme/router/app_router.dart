import 'package:go_router/go_router.dart';
import 'package:yobo_app/domain/entities/products_post.dart';
import 'package:yobo_app/presentation/screen/screen.dart';
import 'package:yobo_app/presentation/screen/security/security_screen.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: ProductsScreen.name,
      path: '/products',
      builder: (context, state) {
        final product = state.extra as ProductsPost;
        return ProductsScreen(
          product: product,
        );
      },
    ),
    GoRoute(
      name: SecurityScreen.name,
      path: '/security',
      builder: (context, state) => const SecurityScreen(),
      ),
      
  ],
);
