import 'package:flutter_test/flutter_test.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('loading dim sum', () async {
    var dim = DimSum();
    await dim.loadDishes();

    await dim.loadCategories();
    expect(dim.categories.isNotEmpty, true);

    var dish = dim.dish("點心");
    expect(dish != null, true);
  });
}
