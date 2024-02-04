
import 'methods/main_menu.dart';
import 'models/task_model.dart';

/*  Regarding the name of this file, for some reason it wasn't running at all when I named it to "main.dart",
and it only seems to work if it's name is the same as the dart project name.*/ 

//Task list.
List<Task> taskList = [];
//Filter Map(This can also be done using a class, but I wanted to practice on Maps).
Map<String, dynamic> filter = {"isFilterOn": false, "isStatusFilterOn": false, "isPriorityFilterOn": false};
void main() {
  bool isRunning = true;

  while (isRunning) {
    isRunning = mainMenu();
  }
}





