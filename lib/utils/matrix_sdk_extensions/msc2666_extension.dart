import 'dart:convert';

import 'package:http/http.dart';
import 'package:matrix/matrix.dart' as matrix;

extension Msc2666Extension on matrix.Client {
  Future<bool> isMsc2666Supported() async {
    return (await getVersions())
            .unstableFeatures?['uk.half-shot.msc2666.query_mutual_rooms'] ==
        true;
  }

  Future<List<String>> queryMutualRoomsIds(String userId) async {
    final requestUri = Uri(
      path: '/_matrix/client/unstable/uk.half-shot.msc2666/user/mutual_rooms',
      query: 'user_id=$userId',
    );

    if (baseUri == null) return [];

    final request = Request('GET', baseUri!.resolveUri(requestUri));
    request.headers['authorization'] = 'Bearer $accessToken';
    final response = await httpClient.send(request);
    final responseBody = await response.stream.toBytes();
    if (response.statusCode != 200) unexpectedResponse(response, responseBody);

    final responseString = utf8.decode(responseBody);
    final json = jsonDecode(responseString);
    final joined = json['joined'] as List<dynamic>;

    return joined.cast<String>();
  }
}
