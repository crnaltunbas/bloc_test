abstract class TextEvent {
  String text ;
  TextEvent(this.text);
}
class EnterTextEvent extends TextEvent{
  EnterTextEvent(String myText):super(myText);
}