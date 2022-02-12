
class User{
  late String name;
  late String avatar;
  late String post;
  late String story;
  late String postTime;
  late String likesNumber;
  late String commentsNumber;
  late String title;

  User({required this.name, required this.avatar, this.post = '', this.postTime = '', this.likesNumber = '', this.commentsNumber = '', this.title = '', this.story = ''});
}