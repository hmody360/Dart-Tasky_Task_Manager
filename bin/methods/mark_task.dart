import 'dart:io';

import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
import 'print_all_titles.dart';

//Function to choose a task out of a number of tasks to change its mark (Completed => Incomplete | and vice versa). 
markTask(){
  bool isRunning = taskList.isNotEmpty; //only running the rest of the function if the taskList isn't empty.
  printTaskTitles();
  while (isRunning) {
    try {
      print("Please input an index from the list to (mark/unmark): ");
      int indexInput = int.parse(stdin.readLineSync()!);
      if(indexInput >= 0 && indexInput < taskList.length){
        taskList[indexInput].changeMark();
        print(Colorize("Task \"${taskList[indexInput].title}\"'s mark has been changed to ${taskList[indexInput].isCompleted ? "Completed" : "Incomplete"}").green());
        isRunning = false;
      }else{
        print(Colorize("Input is out of bounds, please input between [0-${taskList.length-1}]").red());
        continue;
      }
    } catch (e) {
      print(Colorize("Invalid Input!! Please input a number.").red());
    }
    
    
  }
  
}