import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    PostFeedScreen(),
    Center(child: Text('Search')),
    Center(child: Text('Add Post')),
    Center(child: Text('Notifications')),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class PostFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stories(),
        UserWidget(),
        Post(
          username: 'dharanya21',
          imageUrl: 'img/download1.jpg',
          likes: 123,
          caption: 'Great day!',
        ),
        Post(
          username: 'amirthaa__',
          imageUrl: 'img/download.jpg',
          likes: 456,
          caption: 'Enjoying the sunset.',
        ),
      ],
    );
  }
}

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Story(
            username: 'vijay',
            imageUrl: 'img/images.jpg',
          ),
          Story(
            username: 'dq_xx',
            imageUrl: 'img/Instagram-story-example-1-min.png',
          ),
          Story(
            username: 'Nani',
            imageUrl: 'img/images1.jpg',
          ),
          Story(
            username: 'sunz',
            imageUrl: 'img/download.jpg',
          ),
          Story(
            username: 'naturezz',
            imageUrl: 'img/download1.jpg',
          )
        ],
      ),
    );
  }
}

class Story extends StatelessWidget {
  final String username;
  final String imageUrl;

  Story({required this.username, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: 80.0,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
            radius: 30.0,
          ),
          SizedBox(height: 4.0),
          Text(
            username,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Suggested for you',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          UserSuggestion(
            username: 'Vijay',
            imageUrl: 'img/vijay.jpg',
          ),
          UserSuggestion(
            username: 'DQ',
            imageUrl: 'img/dq.webp',
          ),
          UserSuggestion(
            username: 'Nani',
            imageUrl: 'img/Nani.jpg',
          ),
        ],
      ),
    );
  }
}

class UserSuggestion extends StatelessWidget {
  final String username;
  final String imageUrl;

  UserSuggestion({required this.username, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: 20.0,
      ),
      title: Text(username),
      trailing: ElevatedButton(
        onPressed: () {},
        child: Text('Follow'),
      ),
    );
  }
}

class Post extends StatelessWidget {
  final String username;
  final String imageUrl;
  final int likes;
  final String caption;

  Post({
    required this.username,
    required this.imageUrl,
    required this.likes,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(imageUrl), // Placeholder image
            ),
            title: Text(username),
            trailing: Icon(Icons.more_vert),
          ),
          Image.asset(imageUrl), // Placeholder image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.favorite_border),
                SizedBox(width: 8.0),
                Icon(Icons.comment),
                SizedBox(width: 8.0),
                Icon(Icons.send),
                Spacer(),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('$likes likes'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RichText(
              text: TextSpan(
                text: username,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ' $caption',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              'View all comments',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
