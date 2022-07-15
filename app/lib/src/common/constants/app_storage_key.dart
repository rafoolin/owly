enum AppStorageKey {
  authEmail('AUTH_EMAIL'),
  authPassword('AUTH_PASSWORD'),
  authSavedEmail('AUTH_SAVED_EMAIL'),
  authSavedPassword('AUTH_SAVED_PASSWORD');

  final String key;
  const AppStorageKey(this.key);
}
