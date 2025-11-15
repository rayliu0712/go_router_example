import 'package:flutter/material.dart';
import 'package:go_router_example/guest/guest.dart';
import 'package:go_router_example/guest/login.dart';
import 'package:go_router_example/guest/register.dart';
import 'package:go_router_example/logged_in/chat.dart';
import 'package:go_router_example/logged_in/create.dart';
import 'package:go_router_example/logged_in/search.dart';
import 'package:go_router_example/logged_in/explore.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

final router = GoRouter(
  initialLocation: '/guest',
  routes: [
    GoRoute(
      path: '/guest',
      builder: (context, state) => const GuestPage(),
      routes: [
        GoRoute(
          path: 'register',
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(path: 'login', builder: (context, state) => const LoginPage()),
      ],
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          destinations: [
            NavigationDestination(
              label: '探索',
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
            ),
            NavigationDestination(
              label: '搜尋',
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
            ),
            NavigationDestination(
              label: '新建',
              icon: Icon(Icons.add_outlined),
              selectedIcon: Icon(Icons.add),
            ),
            NavigationDestination(
              label: '聊天',
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat),
            ),
          ],
        ),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/explore',
              builder: (context, state) => const ExplorePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/create',
              builder: (context, state) => const CreatePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chat',
              builder: (context, state) => const MessagePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}
