import '../dart_task_manager_mohammed_soqati.dart';
//function that prints the current filter options when using the printAllTasks function to let the user know what their results are based on.
/*When printing the priorty filter type, 'filter["priority"].name' seems to not work at all, even after importing the file where TaskPriority enum resides
thus this workaround was made using 'replaceFirst()' method*/
printFilter(){
  print("==========Results Based on current Filter==========");
  print("| Status: ${filter["isStatusFilterOn"] ? filter["status"] ? "Completed" : "Incompleted" : "Any"}");
  print("| Priority: ${filter["isPriorityFilterOn"] ? "${filter["priority"]}".replaceFirst("TaskPriority.", "") : "Any"}");
  print("===================================================");
}