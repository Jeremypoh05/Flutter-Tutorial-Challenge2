import 'package:adventuregame/story.dart';

//StoryBrain has list of story object
class StoryBrain {
  //declares an instance variable called _storyNumber and initializes it to 0.
  // This variable will be used to keep track of which story the user is currently viewing.
  int _storyNumber = 0;

  //This line declares a final list of Story objects called _storyData.
  // Each Story object represents a different story that the user can experience.
  final List<Story> _storyData = [
    Story(
        storyTitle:
        'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    Story(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    Story(
        storyTitle:
        'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    Story(
        storyTitle:
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    Story(
        storyTitle:
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  //returns the story title of the Story object at index _storyNumber in the _storyData list.
  String getStory () {
    return _storyData[_storyNumber].storyTitle;
  }

  //returns the first choice of the Story object at index _storyNumber in the _storyData list.
  String getChoice1 () {
    return _storyData[_storyNumber].choice1;
  }

  //returns the second choice of the Story object at index _storyNumber in the _storyData list.
  String getChoice2 () {
    return _storyData[_storyNumber].choice2;
  }

  //takes an integer choiceNumber as its argument.
  // This method will update the _storyNumber variable based on the user's choice.
  void nextStory(int choiceNumber) {
    if (_storyNumber == 0 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 0 && choiceNumber == 2) {
      _storyNumber = 1;
    } else if (_storyNumber == 1 && choiceNumber == 1) {
      _storyNumber = 2;
    } else if (_storyNumber == 1 && choiceNumber == 2) {
      _storyNumber = 3;
    } else if (_storyNumber == 2 && choiceNumber == 1) {
      _storyNumber = 5;
    } else if (_storyNumber == 2 && choiceNumber == 2) {
      _storyNumber = 4;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5){
      restart();
    }
  }

  //sets the _storyNumber variable back to 0, which resets the story.
  void restart () {
    _storyNumber = 0;
  }

  //used to determine whether or not to show the "Restart" button in the user interface.
  // bool buttonShouldBeVisible() {
  //   //more cleaner, more readable code than below way.
  //   //_storyNumber variable is either 0, 1, or 2, then the expression will evaluate to true and the method will return true.
  //   //_storyNumber is not equal to any of those values, then the expression will evaluate to false and the method will return false by default
  //   return _storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2;
  // }

  bool buttonShouldBeVisible() {
    if(_storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2){
      return true;
    }
    else {
      print('End of Stories. Please restart.');
      return false;
    }
  }
}


