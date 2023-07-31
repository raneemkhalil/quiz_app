import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  int _correctAnswers = 0;
  bool _correct = false, _result = false;

  List<Map<String, dynamic>> questionsWithAnswers = [{
    'question': 'What is my favorite sport?',
    'answers': {
      'Football': true,
      'Tennis': false,
      'Basketball': false
    },
  },
  {
    'question': 'What is my favorite color?',
    'answers': {
      'Red': false,
      'Blue': true,
      'Yellow': false
    },
  },
  {
    'question': 'What is my favorite fruit?',
    'answers': {
      'Apple': false,
      'Banana': false,
      'Manga': true,
    },
  }];

  void _correctOrNot(truth){
    _correct = truth;
  }

  void _reset(){
    setState(() {
      _correctAnswers = 0;
      _result = !_result;
      _index = 0;
    });
  }

  void _incrementIndex(truth) {
    setState(() {
      if(_index < questionsWithAnswers.length - 1){
        _index++;
        print(_index);
      }
      else{
        _result = !_result;
      }
      _correctOrNot(truth);
      if(_correct){
        _correctAnswers++;
      }
      print(_result);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children:[
                  const Text(
                    "welcom to raneem's app",
                    style: TextStyle(
                      fontSize: 26
                    ),
                  ),
                  const SizedBox(height: 40,),
                  if(!_result)
                    Container(
                      child: Column(
                        children: [
                          const Text(
                            'Answer the question about me bellow please:',
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            questionsWithAnswers[_index]['question'],
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...questionsWithAnswers[_index]['answers'].keys.map((answer) => SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: FloatingActionButton(
                                onPressed: () => _incrementIndex(questionsWithAnswers[_index]['answers'][answer]),
                                child: Text(
                                  answer,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          )),
                        ]
                      ),
                    ),
                  if(_result)
                    Container(
                      child: Column(
                        children: [
                          const Text(
                            "Do you want to retry? ^_^",
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          const SizedBox(height: 40,),
                          Text(
                            'You score $_correctAnswers/${questionsWithAnswers.length}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 30,),
                          FloatingActionButton(
                            onPressed: () => _reset(),
                            child: const Icon(Icons.replay),
                          )
                        ]
                      ),
                    )
                ]
              )
            )
          ]
        )
      )
    );
  }
}
