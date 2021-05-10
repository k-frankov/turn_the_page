class Book {
  static List<Page> pages = [
    Page(pageNumber: 1, text: "THE ADVENTURES OF TOM SAWYER\nBY MARK TWAIN"),
    Page(pageNumber: 2, text: """ 
‘TOM!’
No answer.
‘TOM!’
No answer.
‘What’s gone with that boy,  I wonder? You TOM!’
No answer.
The old lady pulled her spectacles down and looked over them about the room; then she put them up and looked out under them. She seldom or never looked through them for so small a thing as a boy; they were her state pair, the pride of her heart, and were built for “style,” not service—she could have seen through a pair of stove-lids just as well. She looked perplexed for a moment, and then said, not fiercely, but still loud enough for the furniture to hear:
‘Well, I lay if I get hold of you I’ll—‘
"""),
    Page(pageNumber: 3, text: "THE END.")
  ];
}

class Page {
  final int pageNumber;
  final String text;
  Page({required this.pageNumber, required this.text});
}
