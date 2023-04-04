import 'package:adventuregame/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // we are using the dark theme
      home: StoryPage(),
    );
  }
}

//creates an instance of the StoryBrain class, which contains the logic for the interactive story.
StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    int userChoice;

    return Scaffold(
      body: Container(
        //add background image to the app
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        //to make the icon more higher than the "STORIES" text
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          //add the quoteLeft icon from FontAwesome library
                          child: FaIcon(
                            FontAwesomeIcons.quoteLeft,
                            size: 24, // set the icon size
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "STORIES",
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        //to make the icon more higher than the "STORIES" text
                        Padding(
                          padding: EdgeInsets.only(bottom: 18.0),
                          //add the quoteRight icon from FontAwesome library
                          child: FaIcon(
                            FontAwesomeIcons.quoteRight,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //call the custom widget
                    VerticalLine(
                      width: 200,
                      height: 3,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(storyBrain.getStory(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.abel(
                            textStyle: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5,
                              height: 1.5,
                            ),
                          )),
                    ),
                    //call the custom widget
                    VerticalLine(
                      width: 200,
                      height: 3,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                      userChoice = 1;
                      print("Button $userChoice is being clicked");
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.red),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // set the border radius
                            )),
                    overlayColor: MaterialStateProperty.resolveWith((states) =>
                        Colors.white.withOpacity(0.1)), // set the overlay color
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      storyBrain.getChoice1(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        textStyle:
                            const TextStyle(fontSize: 24.0, letterSpacing: 1.2),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  //show or hide the button based on the condition of the buttonShouldBeVisible() method
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                        userChoice = 2;
                         print("Button $userChoice is being clicked");
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.blue),
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // set the border radius
                              )),
                      // set the overlay color
                      overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white.withOpacity(0.1)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        storyBrain.getChoice2(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                              fontSize: 24.0, letterSpacing: 1.2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//refactor the code to new custom widget
class VerticalLine extends StatelessWidget {
  const VerticalLine({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.borderRadius,
  });

// to make it more dynamic
  final double width; //initialize width variable
  final double height; //initialize height variable
  final Color color; //initialize color variable
  final BorderRadius borderRadius; //initialize borderRadius variable

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
    );
  }
}
