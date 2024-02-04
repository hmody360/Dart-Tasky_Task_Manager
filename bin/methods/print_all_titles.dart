import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
//function that prints only the index and task name of all tasks, for task choosing purposes(used in edit, delete and mark task functions).
printTaskTitles(){
  print("===================================================");
  taskList.isEmpty ? {print(Colorize("No Tasks Available!").red())} : //Making sure list is not empty.
  List.generate(taskList.length, (index) => {
    print("$index: ${taskList[index].title} (${taskList[index].isCompleted ? "Completed" : "Incomplete"})")
  });
  print("===================================================");
}