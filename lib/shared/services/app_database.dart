import 'package:meuapp/shared/services/supabase_database.dart';

abstract class AppDatabase {
  static final AppDatabase instance = SupabaseDatabase(); // Padrão singleton, uma única instância
  void init();
  Future<bool> login({required String email, required String password});
  Future<bool> createAccount({
    required String email,
    required String password,
    required String name,
  });
}
