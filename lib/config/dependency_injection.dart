import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DependencyInjection {
  static late SharedPreferences _sharedPreferences;
  
  static SharedPreferences get sharedPreferences => _sharedPreferences;

  static Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();
    
    // Initialize SharedPreferences
    _sharedPreferences = await SharedPreferences.getInstance();
    
    // Register Hive Adapters (add when models are ready)
    // Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(MenuItemModelAdapter());
    
    // Open Hive Boxes
    // await Hive.openBox('users');
    // await Hive.openBox('menu_items');
    // await Hive.openBox('orders');
    // await Hive.openBox('transactions');
    
    // Initialize other dependencies here
    // Example: GetIt.instance.registerSingleton<ApiClient>(ApiClient());
  }
}