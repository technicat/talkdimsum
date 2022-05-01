import 'package:flutter_test/flutter_test.dart';

import 'package:talkdimsum/core/provider/countries.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('loading countries', () async {
    var con = Countries();
    await con.load();
    // should check that countries length matches list of filenames
    expect(con.countries.isNotEmpty, true);
  });
}
