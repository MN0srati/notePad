import 'package:realm/realm.dart';

part 'note_model.realm.dart';
@RealmModel()
class _Notes {
  @PrimaryKey()
  late int index;

  late String title;
  late String body;
}
