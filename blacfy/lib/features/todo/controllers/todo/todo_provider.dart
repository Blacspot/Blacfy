import 'package:blacfy/common/helpers/db_helper.dart';
import 'package:blacfy/common/models/task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Task> build() {
    return [];
  }

  void refresh() async {
    final data = await DBHelper.getItems();

    state = data.map((e) => Task.fromJson(e)).toList();
  }

  void addItem(Task task) async {
    await DBHelper.createItem(task);
    refresh();
  }

  void updateItem(int id, String title, String desc, int isCompleted,
      String date, String startTime, String endTime) async {
    await DBHelper.updateItem(
        id, title, desc, isCompleted, date, startTime, endTime);
    refresh();
  }
}
