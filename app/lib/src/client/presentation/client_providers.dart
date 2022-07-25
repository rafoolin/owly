import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nhost_graphql_adapter/nhost_graphql_adapter.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../../../private_credential/nhost.dart';
import '../../features/authentication/presentation/auth_providers.dart';

final backendUrlProvider = Provider<String>(
  (_) => NhostCredential.nhostBackendUrl,
);

final _nhostClientProvider = Provider<NhostClient>(
  (ref) {
    final client = NhostClient(backendUrl: ref.watch(backendUrlProvider));
    // Release the client when it is no longer needed.
    ref.onDispose(client.close);

    return client;
  },
);

final authClientProvider = Provider<AuthClient>(
  (ref) => ref.watch(_nhostClientProvider).auth,
);

final storageClientProvider = Provider<StorageClient>(
  (ref) => ref.watch(_nhostClientProvider).storage,
);

final graphQLClientProvider = Provider<GraphQLClient>(
  (ref) {
    final nhostClient = ref.watch(_nhostClientProvider);
    final user = ref.watch(currentUserProvider);

    return createNhostGraphQLClientForAuth(
      nhostClient.gqlEndpointUrl,
      nhostClient.auth,
      gqlCache: GraphQLCache(),
      defaultHeaders: user == null
          ? null
          : {
              'x-hasura-role': 'me',
              'x-hasura-user-id': user.id,
            },
    );
  },
);

final graphQLClientValueNotifierProvider =
    Provider<ValueNotifier<GraphQLClient>>((ref) {
  final graphQLClient = ref.watch(graphQLClientProvider);
  return ValueNotifier(graphQLClient);
});
