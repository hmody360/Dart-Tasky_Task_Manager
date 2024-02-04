import 'dart:io';

import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
import 'print_all_titles.dart';
// Function to delete a task from taskList.
deleteTask(){
  bool isRunning = taskList.isNotEmpty; //only running the rest of the function if the taskList isn't empty.
  printTaskTitles(); //Showing the user the list of available tasks to delete.
  // while loop that keeps running until the user's input is valid.
  while (isRunning) {

    try {
      print("Please input an index from the list:");
      int indexInput = int.parse(stdin.readLineSync()!);
      if(indexInput >= 0 && indexInput < taskList.length){
        print("===================================================");
        //confirming the user's deletion of a task, providing them with a way to cancel its deletion.
        print(Colorize("Are you sure you want to delete \"${taskList[indexInput].title}\" task? (Y[default]/N):").yellow());
        bool isConfimed;
        stdin.readLineSync()!.toLowerCase() == "n" ? isConfimed = false : isConfimed = true;
        if (isConfimed) {
          print(Colorize("Task \"${taskList[indexInput].title}\" has been deleted").green()); //informing the user the task has been deleted
          taskList.removeAt(indexInput);
        }else{
          print(Colorize("Task \"${taskList[indexInput].title}\" 's deletion has been cancelled!").red()); //informing the user that task deletion was cancelled.
        }
        isRunning = false;
      }else{
        print(Colorize("Input is out of bounds, please input between [0-${taskList.length-1}]").red()); //alarming the user their input is out of bounds.
        continue;
      }

  } catch (error) {
   print(Colorize("Invalid Input!! Please input a number.").red()); //alarming the user their input is incorrect.
  }
  }
  
}