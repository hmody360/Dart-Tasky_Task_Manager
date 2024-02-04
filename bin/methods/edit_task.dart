import 'dart:io';

import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
import '../models/task_model.dart';
import 'print_all_titles.dart';

//Function to edit an already existing task.
//includes similar functionalties from delete function(choose task to edit) and add function(input changes).
//leaving empty or space input makes the attribute remain unchanged.
editTask(){
  bool isRunning = taskList.isNotEmpty; //only running the rest of the function if the taskList isn't empty.
  printTaskTitles(); //Showing the user the available tasks to edit.
  //while loop that keeps running until all user input is valid, and task is editied.
  while (isRunning) {
    
    try {
      print("Please input an index from the list:");
      int indexInput = int.parse(stdin.readLineSync()!);
      if(indexInput >= 0 && indexInput < taskList.length){
        print("Please input new task title (leave empty to not change):");
        String title = stdin.readLineSync()!;
        String comparedTitle = title;
        if(comparedTitle.replaceAll(" ", "") == ""){
          title = taskList[indexInput].title;
        }

        print("Please input new task description (leave empty to not change):");
        String description = stdin.readLineSync()!;
        String comparedDesc = description;
        if(comparedDesc.replaceAll(" ", "") == ""){
          description = taskList[indexInput].description;
        }

        print("===================================================");
        print(Colorize("H: High priority").red());
        print(Colorize("M: Medium priority").yellow());
        print(Colorize("L: Low priority").green());
        print("===================================================");
        print("Please select new priority of task (default: ${taskList[indexInput].priority.name}):");

        TaskPriority priority;
        String inputPriority = stdin.readLineSync()!;
        //implmenting user selection of task's priority (default is previous priorty)
        switch (inputPriority.toLowerCase()) {
          case "h" || "high":
            priority = TaskPriority.high;
            break;
          case "m" || "medium":
            priority = TaskPriority.medium;
            break;
          case "l" || "low":
            priority = TaskPriority.low;
            break;
          default:
          priority = taskList[indexInput].priority;
        }
        print("Please input new task tags seperated by commas ',' (leave empty to not change):");
        String tagsInput = stdin.readLineSync()!;
        String comparedTags = tagsInput;
        List<String> tags;
        if(comparedTags.replaceAll(" ", "") == ""){
          tags = taskList[indexInput].tags;
        }else{
          tags = tagsInput.replaceAll(" ", "").split(",");
          tags.removeWhere((e) => !e.contains(RegExp("[a-zA-Z]")));
        }
        taskList[indexInput].edit(title, description, priority, tags);
        isRunning = false;
      }else{
        print(Colorize("Input is out of bounds, please input between [0-${taskList.length-1}]").red());
        continue;
      }

  } catch (error) {
   print(Colorize("Invalid Input!! Please input a number.").red()); 
  }
  }
  
}