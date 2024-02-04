import 'dart:io';

import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
import 'add_task.dart';
import 'delete_task.dart';
import 'edit_task.dart';
import 'filter_tasks.dart';
import 'mark_task.dart';
import 'print_all_tasks.dart';
import 'search_task.dart';

//Main menu function that is called on program startup and keeps running until the user quits the program.
bool mainMenu(){
    //Displaying main menu options for the user.
    print("\n");
    print("=======================Tasky=======================");
    print("===========Take it on one task at a time===========");
    print("===================================================");
    print("\n");
    print("A: Add a new task");
    print("D: Delete a task");
    print("L: List all tasks (Filterable)");
    print("E: Edit a task");
    print("M: Mark/Unmark tasks");
    print("S: Search for tasks");
    print("F: Apply filters (completion status, priority)");
    print("Q: Quit the program");
    print("\n");
    print("Please select one of the options above: ");
    //User input.
    String menuInput = stdin.readLineSync()!;
    //Handling main menu options using user input.
    switch (menuInput.toLowerCase()) {
      case "a":
        addTask();
        break;
      case "d":
        deleteTask();
        break;
      case "l":
        printAllTasks();
        break;
      case "e":
        editTask();
        break;
      case "m":
        markTask();
        break;
      case "s":
        searchTasks();
        break;
      case "f":
        filter = filterTasks();
        break;
      case "q":
        print(Colorize("Quitting Program...").red());
        return false;
      default:
      print(Colorize("Invalid input, please try again").red()); //Handling invalid user input.
    }
    return true;
}