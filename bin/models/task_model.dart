import 'package:colorize/colorize.dart';

enum TaskPriority {high, medium, low}
//Class that holds a task's object information.
class Task{
  String title;
  String description;
  DateTime? dateOfCreation;
  TaskPriority priority;
  List<String> tags;
  bool isCompleted;

  Task({required this.title, required this.description, this.dateOfCreation, required this.priority,required this.tags, this.isCompleted = false});

  //Gets info of a Task object.
  getInfo(){
    print("====================================");
    print(Colorize("Title: $title").lightBlue());
    print(Colorize("Description: $description").lightCyan());
    print(Colorize("Date of Creation: $dateOfCreation").lightYellow());
    print(Colorize("Priority: ${priority.name}").lightMagenta());
    print(Colorize("Tags: ${tags.toString()}").lightGreen());
    print("Status: ${isCompleted ? "Completed" : "Incomplete"}");
    print("====================================");
  }
  //Takes parameters and edits a task object's attributes.
  edit(String title, String description, TaskPriority priority, List<String> tags){
    this.title = title;
    this.description = description;
    this.priority = priority;
    this.tags = tags;
  }
  //Changes the mark attribute of the task object.
  changeMark(){
    isCompleted = !isCompleted;
  }
}