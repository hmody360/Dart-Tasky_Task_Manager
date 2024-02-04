import 'dart:io';

import 'package:colorize/colorize.dart';

import '../models/task_model.dart';
//function that returns a Map of items required to filter in the printAllTasks function.
//the user is able to filter by completion status(Incomplete, Completed) and/or priority(high, medium, low) or neither to get all results.
Map<String, dynamic> filterTasks(){
  bool isFilterOn = false; //checks if filtering is enables
  bool isStatusFilterOn = false; //checks if completion status filtiring is enabled
  bool isPriorityFilterOn = false; //checks if priority filtiring is enabled
  bool? status; //contains bool whether to filter by (Incomplete: false) or (Complete: true)
  TaskPriority? prioirty; //contains Taskpriority selection for the filter wanted.

  print("Would You like to filter your results? (Y[default]/N)");
  String filterInput = stdin.readLineSync()!;

  switch (filterInput.toLowerCase()) {
    case "n":
      print(Colorize("No Filters Applied.").yellow());
      return {"isFilterOn": isFilterOn, "isStatusFilterOn": isStatusFilterOn, "isPriorityFilterOn": isPriorityFilterOn};
    default:
      isFilterOn = true;
      
  }

  print("===================================================");
  print(Colorize("N: Incomplete").red());
  print(Colorize("C: Complete").green());
  print("===================================================");
  print("Select Completion Status Filter (default: no status filter):");
  String statusInput = stdin.readLineSync()!;
  switch (statusInput.toLowerCase()) {
    case "n":
      status = false;
      isStatusFilterOn = true;
      break;
    case "c":
      status = true;
      isStatusFilterOn = true;
      break;
    default:
    print(Colorize("No Completion Status Filter Selected!").yellow());
  }

  print("===================================================");
  print(Colorize("H: High priority").red());
  print(Colorize("M: Medium priority").yellow());
  print(Colorize("L: Low priority").green());
  print("===================================================");
  print("Select Priority Filter (default: no priority filter):");
  String priorityInput = stdin.readLineSync()!;

  switch (priorityInput.toLowerCase()) {
    case "h" || "high":
      prioirty = TaskPriority.high;
      isPriorityFilterOn = true;
      break;
    case "m" || "medium":
      prioirty = TaskPriority.medium;
      isPriorityFilterOn = true;
      break;
    case "l" || "low":
      prioirty = TaskPriority.low;
      isPriorityFilterOn = true;
      break;
    default:
    print(Colorize("No Completion Status Filter Selected!").yellow());
  }
  return {
    "isFilterOn": isFilterOn,
    "isStatusFilterOn": isStatusFilterOn,
    "isPriorityFilterOn": isPriorityFilterOn,
    "status": status,
    "priority": prioirty
  };
  }