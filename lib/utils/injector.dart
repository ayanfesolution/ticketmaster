import 'package:ticketmaster/utils/local_storage_structure.dart';
import 'package:ticketmaster/utils/palette.dart';

class Injector {
  final Palette palette = Palette();
  final QuickStorage quickStorage = QuickStorage();
}

Injector injector = Injector();
