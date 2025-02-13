abstract class AuthRepository {
  Future<void> loginWithEmailAndPassword({required email, required password});
  Future<void> registerWithEmailAndPassword(
      {required email, required password});
  Future<void> signOut();
}
