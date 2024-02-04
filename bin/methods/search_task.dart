import 'dart:io';

import 'package:colorize/colorize.dart';

import '../dart_task_manager_mohammed_soqati.dart';
// Function that enables the user to search a task's title, description, tags, and priority using their search criteria(input).
searchTasks() {
  bool isRunning = taskList.isNotEmpty; //only running the rest of the function if the taskList isn't empty.
  int searchResultsCount = 0;
  while (isRunning) {
    print("Please enter what to search: ");
    String searchInput = stdin.readLineSync()!.toLowerCase();
    String comparedInput = searchInput;
    if (comparedInput.replaceAll(" ", "") == "") {
      print(Colorize("Search field can't be empty!").red()); //Making sure user input isn't empty.
      print("===================================================");
      continue;
    } else {
      searchInput.trim(); //Trimming search input so that it's ready to be used.
      for (var task in taskList) {
        if (task.title.toLowerCase().contains(searchInput) ||
            task.description.toLowerCase().contains(searchInput) ||
            task.tags.any((tag) => tag.toLowerCase().contains(searchInput)) ||
            task.priority.name.toLowerCase().contains(searchInput)) {
          task.getInfo();
          searchResultsCount++;
        }
      }
      //showing the user the amount of search results shown out of the total amount, or informing them that no results were found based on their input.
      (searchResultsCount > 0) 
          ? print(Colorize("$searchResultsCount results out of ${taskList.length} found.").lightGray())
          : print(Colorize("No Results found!").red());
      isRunning = false;
    }
  }
}