import 'dart:io';

import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
import '../models/task_model.dart';

//Function to add a task to taskList.
addTask(){
  bool isRunning = true;
  //while loop that stops only if all input is valid.
  while (isRunning) {
      print("Please enter task title:");
      String title = stdin.readLineSync()!;
      String comparedTitle = title;
      //checking if title input is valid (empty title not allowed).
      if(comparedTitle.replaceAll(" ", "") == ""){
        print(Colorize("Title can't be empty!").red());
        print("===================================================");
        continue;
      }else{
        print("Please enter task description:");
        String description = stdin.readLineSync()!;

        print("===================================================");
        print(Colorize("H: High priority").red());
        print(Colorize("M: Medium priority (default)").yellow());
        print(Colorize("L: Low priority").green());
        print("===================================================");
        print("Please select priority of task:");
        TaskPriority priority;
        String inputPriority = stdin.readLineSync()!;
        //implmenting user selection of task's priority (default is medium priorty).
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
          print("Default priority selected: medium");
          priority = TaskPriority.medium;
        }
        // allowing the user to add their own unique tags, and only accepting alphabitical letters as tags.
        print("Please enter task tags seperated by a comma ',' :");
        String tagsInput = stdin.readLineSync()!;
        List<String> tags = tagsInput.replaceAll(" ", "").split(",");
        tags.removeWhere((e) => !e.contains(RegExp("[a-zA-Z]")));
        print("===================================================");
        //Confirming the user's add of a task, providing them with a way to cancel its addition.
        print(Colorize("Are you sure you want to add \"$title\" task? (Y[default]/N):").yellow());
        bool isConfimed;
        stdin.readLineSync()!.toLowerCase() == "n" ? isConfimed = false : isConfimed = true;
        if (isConfimed) {
          print(Colorize("Task \"$title\" has been added sucessfuly").green()); //informing the user their task has been added.
        taskList.add(Task(title: title, description: description, priority: priority,tags: tags, dateOfCreation: DateTime.now())); //Task object creation and addition to taskList.
        }else{
          print(Colorize("Task \"$title\" 's addition has been cancelled!").red());
        }
        isRunning = false;
      }
  }
  

}