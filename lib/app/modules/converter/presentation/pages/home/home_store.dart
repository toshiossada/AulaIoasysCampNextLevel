import 'package:flutter/foundation.dart';

class HomeStore extends ValueNotifier<bool> {
  HomeStore() : super(false);

  void setLoading(bool v) => value = v;
}
