import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/ui/views/main_view/main_view_view_model.dart';

class MainViewWidget extends StatefulWidget {
  const MainViewWidget({super.key});

  @override
  State<MainViewWidget> createState() => _MainViewWidgetState();
}

class _MainViewWidgetState extends State<MainViewWidget> {
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   context.read<MainScreenViewModel>().loadData();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: ListView(
        children: const [
          _FirstExpansionTileButton(),
          SizedBox(height: 10.0),
          _SecondExpansionTileButton(),
          SizedBox(height: 10.0),
          _ThirdExpansionTileButton()
        ],
      ),
    );
  }
}

class _FirstExpansionTileButton extends StatelessWidget {
  const _FirstExpansionTileButton();

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return ExpansionTile(
      title: const Text('Button 1'),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            8.0,
            5.0,
            8.0,
            17.0,
          ),
          child: AspectRatio(
            aspectRatio: 0.96,
            child: Image.asset(model.insideImage),
          ),
        ),
      ],
    );
  }
}

class _SecondExpansionTileButton extends StatelessWidget {
  const _SecondExpansionTileButton();

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final model = context.watch<MainScreenViewModel>();
    return ExpansionTile(
      title: const Text('Button 2'),
      children: [
        ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: model.comments.length,
          itemBuilder: (context, index) {
            return _CommentsListDisplay(index: index);
          },
        ),
      ],
      onExpansionChanged: (isExpanded) => {
        if (isExpanded) model.loadComments(),
      },
    );
  }
}

class _ThirdExpansionTileButton extends StatelessWidget {
  const _ThirdExpansionTileButton();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Button 3'),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            8.0,
            5.0,
            8.0,
            17.0,
          ),
          child: text3(),
        ),
      ],
    );
  }
}

class _CommentsListDisplay extends StatelessWidget {
  final int index;
  const _CommentsListDisplay({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    final comment = model.comments[index];
    return ListTile(
      title: Text(comment.email),
      subtitle: Text(comment.body),
    );
  }
}

Text text1() {
  return const Text(
      "Mr  and  Mrs  Dursley,  of  number  four,  Privet  Drive,  were  proud  to  say  that  they  were  perfectly  normal,  thank  you  very  much.  They  were  the  last  people  you’d  expect  to  be  involved  in  anything  strange  or  mysterious,  because  they  just  didn’t  hold  with  such  nonsense. Mr Dursley was the director of a firm called Grunnings, which made  drills.  He  was  a  big,  beefy  man  with  hardly  any  neck,  although  he  did  have  a  very  large  moustache.  Mrs  Dursley  was  thin  and  blonde  and  had  nearly  twice  the  usual  amount  of  neck,  which came in very useful as she spent so much of her time craning over garden fences, spying on the neighbours. The Dursleys had a small  son  called  Dudley  and  in  their  opinion  there  was  no  finer  boy anywhere. The  Dursleys  had  everything  they  wanted,  but  they  also  had  a  secret, and their greatest fear was that somebody would discover it. They didn’t think they could bear it if anyone found out about the  Potters.  Mrs  Potter  was  Mrs  Dursley’s  sister,  but  they  hadn’t  met  for  several  years;  in  fact,  Mrs  Dursley  pretended  she  didn’t  have a sister, because her sister and her good-for-nothing husband were  as  unDursleyish  as  it  was  possible  to  be.  The  Dursleys  shuddered  to  think  what  the  neighbours  would  say  if  the  Potters  arrived  in  the  street.  The  Dursleys  knew  that  the  Potters  had  a  small  son,  too,  but  they  had  never  even  seen  him.  This  boy  was  another  good  reason  for  keeping  the  Potters  away;  they  didn’t  want Dudley mixing with a child like that. ");
}

Text text3() {
  return const Text(
      'The bang was like a cannon blast, and the golden flames that erupted between them, at the dead center of the circle they had been treading, marked the point where the spells collided. Harry saw Voldemort’s green jet meet his own spell, saw the Elder Wand fly high, dark against the sunrise, spinning across the enchanted ceiling like the head of Nagini, spinning through the air toward the master it would not kill, who had come to take full possession of it at last. And Harry, with the unerring skill of a Seeker, caught the wand in his free hand as Voldemort fell backwards, arms splayed, the slit pupils of the scarlet eyes rolling upward. Tom Riddle hit the floor with a mundane finality, his body feeble and shrunken, the white hands empty, the snakelike face vacant and unknowing. Voldemort was dead, killed by his own rebounding curse, and Harry stood with two wands in his hands, staring down at his enemy shell.One shivering second of silence, the shock of the moment sus-pend: and then the tumult broke around Harry as the screams and the cheers and the roars of the watchers rent the air. The fierce news dazzled the windows as they thundered toward him, and the first to reach him were Ron and Hermione, and it was their arms that were wrapped around him, their incomprehensible shouts that deafened him. Then Ginny, Neville, and Luna were there, and then all the Weasleys and Hagrid, and Kingsley and McGonagall and Flitwick and Spout, and Harry could not hear a word that anyone was shouting, nor tell whose hands were seizing him, pulling him, trying to hug some part of him, hundreds of them pressing in, all of them determined to touch the Boy Who Lived, the reason it was over at last…');
}
