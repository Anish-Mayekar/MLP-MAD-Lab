import 'package:flutter/material.dart';
import 'package:flashcards_quiz/models/api.dart';
import 'package:flashcards_quiz/models/response_model.dart';
import 'package:flashcards_quiz/views/home_screen.dart';
import 'package:flashcards_quiz/views/profile_page.dart';

// Import other screens if needed

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  bool inProgress = false;
  ResponseModel? responseModel;
  String noDataText = "Welcome to Vocabulary Builder";
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        // Navigate to Quiz screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else if (_selectedIndex == 2) {
        // Navigate to Profile screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vocabulary Builder"),
        backgroundColor: const Color.fromARGB(255, 215, 1, 11),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchWidget(),
            const SizedBox(height: 12),
            if (inProgress)
              const LinearProgressIndicator()
            else if (responseModel != null)
              Expanded(child: _buildResponseWidget())
            else
              _noDataWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pageview),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
  _buildResponseWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          responseModel!.word!,
          style: TextStyle(
            color: Colors.purple.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(responseModel!.phonetic ?? ""),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _buildMeaningWidget(responseModel!.meanings![index]);
            },
            itemCount: responseModel!.meanings!.length,
          ),
        ),
      ],
    );
  }

  _buildMeaningWidget(Meanings meanings) {
    String definitionList = "";
    meanings.definitions?.forEach(
      (element) {
        int index = meanings.definitions!.indexOf(element);
        definitionList += "\n${index + 1}. ${element.definition}\n";
      },
    );

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meanings.partOfSpeech!,
              style: TextStyle(
                color: Colors.orange.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Definitions : ",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(definitionList),
            _buildSet("Synonyms", meanings.synonyms),
            _buildSet("Antonyms", meanings.antonyms),
          ],
        ),
      ),
    );
  }

  _buildSet(String title, List<String>? setList) {
    if (setList?.isNotEmpty ?? false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title : ",
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(setList!
              .toSet()
              .toString()
              .replaceAll("{", "")
              .replaceAll("}", "")),
          const SizedBox(height: 10),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  _noDataWidget() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Text(
          noDataText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  _buildSearchWidget() {
    return Column(
      children: [
        // GestureDetector(
        //   onTap: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => const SecondPage()),
        //   ),
        //   // child: Container(
        //   //   // Increase width and height as desired
        //   //   height: 140,
        //   //   width: MediaQuery.of(context).size.width, // Full width
        //   //   decoration: BoxDecoration(
        //   //     borderRadius: BorderRadius.circular(20.0),
        //   //     color: const Color.fromARGB(255, 231, 234, 236),
        //   //   ),
        //   //   child: const Center(
        //   //     child: Text(
        //   //       'Quiz',
        //   //       style: TextStyle(
        //   //         fontSize: 25.0, // Adjust font size if needed
        //   //       ),
        //   //     ),
        //   //   ),
        //   // ),
        // ),
        const SizedBox(height: 12),
        SearchBar(
          hintText: "Search word here",
          onSubmitted: (value) {
            _getMeaningFromApi(value);
          },
        ),
      ],
    );
  }

  _getMeaningFromApi(String word) async {
    setState(() {
      inProgress = true;
    });
    try {
      responseModel = await API.fetchMeaning(word);
      setState(() {});
    } catch (e) {
      responseModel = null;
      noDataText = "Meaning cannot be fetched";
    } finally {
      setState(() {
        inProgress = false;
      });
    }
  }
}