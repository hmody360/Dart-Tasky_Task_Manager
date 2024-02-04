import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
import 'print_filter.dart';
//Function that checks the current filter options and prints based on them, by default it prints all available tasks
printAllTasks(){
  taskList.isEmpty ? print(Colorize("No Tasks Available!").red()) : {for (var task in taskList) { //check if taskList is empty, inform user and exit, otherwise continue
    printFilter(),
    if(filter["isFilterOn"]){ //checks if filter is on, and applies the chosen filters.
      if(filter["isStatusFilterOn"] && filter["isPriorityFilterOn"])
      {
        if((task.isCompleted == filter["status"]) && (task.priority == filter["priority"])){
          task.getInfo()
        }
      }else if (filter["isStatusFilterOn"]){
        if(task.isCompleted == filter["status"]){
          task.getInfo()
        }
      }else{
        if(task.priority == filter["priority"]){
          task.getInfo()
        }
      }
    }else{ //if filter is off print all results.
      task.getInfo() 
    }
  }};
}
