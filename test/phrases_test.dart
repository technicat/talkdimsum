import 'package:flutter_test/flutter_test.dart';

import 'package:talkdimsum/core/provider/conversation.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('loading phrases', () async {
    var con = Conversation();
    await con.load();
    expect(con.phrases.isNotEmpty, true);
  });
}
