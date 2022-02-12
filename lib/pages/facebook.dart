import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/facebook_model.dart';

class FacebookUI extends StatefulWidget {
  const FacebookUI({Key? key}) : super(key: key);
  static const String id = 'facebook_ui';
  @override
  _FacebookUIState createState() => _FacebookUIState();
}

class _FacebookUIState extends State<FacebookUI> {
  bool isDark = false;

  List<User> users = [
    User(name: 'Alexandra', avatar: 'assets/facebook/user_1.jpeg', story: 'assets/facebook/story_5.jpeg'),
    User(name: 'Sarah', avatar: 'assets/facebook/user_4.jpeg', story: 'assets/facebook/story_4.jpeg'),
    User(name: 'Jack', avatar: 'assets/facebook/user_3.jpeg', story: 'assets/facebook/story_3.jpeg'),
    User(name: 'Bob', avatar: 'assets/facebook/user_2.jpeg', story: 'assets/facebook/story_2.jpeg', post: 'assets/facebook/feed_1.jpeg', postTime: '1 hr ago', likesNumber: '2.5K', commentsNumber: '400 Comments', title: 'All the Lorem Ipsum generators on the Internet tend to repeat predefined'),
  ];

  List<User> stories(){
    List<User>  storyList = List.from(users);
    storyList.removeWhere((element) => element.story == '');
    return storyList;
  }

  List<User> posts(){
    List<User>  postList = List.from(users);
    postList.removeWhere((element) => element.post == '');
    return postList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: isDark ? Colors.black : Colors.white,
          foregroundColor: isDark ? Colors.white : Colors.black,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: const Text('facebook', style: TextStyle(color: CupertinoColors.systemBlue, fontSize: 30, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined, size: 30, color: CupertinoColors.systemGrey),
              onPressed: (){},
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt, size: 30, color: CupertinoColors.systemGrey),
              onPressed: (){},
            ),
            IconButton(
                icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                onPressed: () {
                  setState(() {
                    isDark = !isDark;
                  });
                })
          ],
        ),
        body: ListView(
          children: [
            /// Search Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/facebook/user_5.jpeg'),
                      )
                  ),
                ),
                title: const TextField(
                  decoration: InputDecoration(
                    // filled: true,
                    hintText: 'What\'s on your mind?',
                    hintStyle: TextStyle(color: CupertinoColors.systemGrey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            /// Live | Photo | Check in
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                  children: [
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.video_call, color: CupertinoColors.systemRed, size: 25),
                            const SizedBox(width: 10),
                            Text('Live', style: TextStyle(color: isDark ? CupertinoColors.systemGrey : Colors.black),),
                          ],
                        )
                    ),
                    VerticalDivider(color: isDark ? Colors.white : CupertinoColors.systemGrey),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.image, color: CupertinoColors.systemGreen, size: 25),
                            const SizedBox(width: 10),
                            Text('Photo', style: TextStyle(color: isDark ? CupertinoColors.systemGrey : Colors.black),),
                          ],
                        )
                    ),
                    VerticalDivider(color: isDark ? Colors.white : CupertinoColors.systemGrey),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on, color: CupertinoColors.systemRed, size: 25),
                            const SizedBox(width: 10),
                            Text('Check in', style: TextStyle(color: isDark ? CupertinoColors.systemGrey : Colors.black),),
                          ],
                        )
                    ),
                  ]
              ),
            ),
            /// Divider
            const Divider(thickness: 8, color: CupertinoColors.systemGrey),
            const SizedBox(height: 5),
            /// Stories
            Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories().length,
                  itemBuilder: (BuildContext context, int index) {
                    return  _story(stories()[index]);
                  }
              ),
            ),
            /// Divider
            const Divider(thickness: 8, color: CupertinoColors.systemGrey),
            const SizedBox(height: 5),
            /// Posts
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: posts().length,
                  itemBuilder: (BuildContext context, int index) {
                    return  _post(posts()[index]);
                  }
              ),
            ),



          ],
        )
    );
  }

  Widget _story(User user){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        height: 165,
        width: 120,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: AssetImage(user.story), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: CupertinoColors.activeBlue,
              radius: 21.5,
              child: CircleAvatar(
                radius: 20,
                foregroundImage: AssetImage(user.avatar),
              ),

            ),
            Text(user.name, style: const TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }

  Widget _post(User user){
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// User & Post Info
              ListTile(
                  minVerticalPadding: 0,
                  contentPadding: const EdgeInsets.all(0),
                  leading: CircleAvatar(
                    foregroundImage: AssetImage(user.avatar),
                  ),
                  title: Text(user.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? CupertinoColors.systemGrey : Colors.black),),
                  subtitle: Text(user.postTime, style: const TextStyle(color: CupertinoColors.systemGrey),),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_horiz, size: 30, color: CupertinoColors.systemGrey,),
                    onPressed: () {},
                  )
              ),
              /// Post title
              Text(user.title, style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 15)),
              const SizedBox(height: 10),
              /// Media
              Expanded(child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image(image: AssetImage(user.post), fit: BoxFit.cover)
              ),),
              const SizedBox(height: 5),
              /// ThumbUp & Like
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemBlue,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(child: Icon(Icons.thumb_up, size: 12, color: Colors.white)),
                      ),
                      Transform.translate(
                        offset: const Offset(-5, 0),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: CupertinoColors.systemRed,
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(child: Icon(Icons.favorite, size: 12, color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(user.likesNumber, style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 15))
                    ],
                  ),
                  Text(user.commentsNumber, style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 15))
                ],
              ),
              const SizedBox(height: 5),
              /// Like & Comment & Share
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.thumb_up, color: CupertinoColors.activeBlue,),
                        SizedBox(width: 5),
                        Text('Like', style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 15))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.chat, color: CupertinoColors.systemGrey),
                        SizedBox(width: 5),
                        Text('Comment', style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.share, color: CupertinoColors.systemGrey),
                        SizedBox(width: 5),
                        Text('Share', style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Divider(thickness: 8, color: CupertinoColors.systemGrey),
      ],
    );
  }
}

