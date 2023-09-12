import 'notes.dart';
import 'dart:io';

var run = new UserInteraction();
void main() {
  //init method
  //listen to user input

  stdin.lineMode = true;
  stdin.echoMode = true;
  String search = "";

  run.promptUser(search);
  // print("Type something and press enter: ");

  //start listen for input
}

class UserInteraction {
  List<Note> filteredList = sample;
  int count = 0;
  void promptUser(String search) {
    // print("Search :");
    stdout.write("Search : ");
    stdin.listen((data) {
      String userInput = String.fromCharCodes(data).trim();

      // for (var notes in sample) {
      //   print(notes.content);
      // }

      if (userInput.isNotEmpty) {
        search += userInput;
        getSearchText(search);
        for (var notes in filteredList) {
          print("Title  :" + notes.title);
          print("Body   :" + notes.content);
          print("");
          this.count++;
        }
        if (this.count > 1) {
          print("${count} notes were found!");
        } else {
          print("${count} note was found!");
        }

        this.count = 0;
        search = "";
        filteredList = sample;
        stdout.write("Search : ");
      }
    });
  }

  void getSearchText(String searchText) {
    filteredList = sample
        .where((note) =>
            //filter by title
            note.title.toLowerCase().contains(searchText.toLowerCase()) ||
            //filter by content(body)
            note.content.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
