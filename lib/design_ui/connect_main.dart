import 'package:cached_network_image/cached_network_image.dart';
import 'package:cia_client/constant.dart';
import 'package:cia_client/design_ui/drawer.dart';
import 'package:cia_client/utils/storage_manager.dart';
import 'package:cia_client/utils/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_indicator/page_indicator.dart';
import '../utils/model.dart';

class ConnectMain extends StatefulWidget {
  const ConnectMain({Key? key}) : super(key: key);

  @override
  _ConnectMainState createState() => _ConnectMainState();
}

class _ConnectMainState extends State<ConnectMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List liked = [];
  String userId = "";
  List<Post> postList = [];

  @override
  void initState() {
    getPosts();
    StorageManager.readData("userId").then((value) {
      setState(() {
        userId = value;
      });
    });
    super.initState();
  }

  Future getPosts() async {
    var res = await UserRepository().getAllPosts();
    setState(() {
      postList = res.map<Post>((json) => Post.fromJson(json)).toList();
      postList.forEach((post) {
        if (post.liked.contains(userId)) {
          liked.add(post.postId);
        }
      });
    });
  }

  Widget postWidget(Post post) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      constraints: BoxConstraints(
        minHeight: 180,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 2.0,
              spreadRadius: 2.0,
            )
          ]),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: CachedNetworkImage(
                  imageUrl: post.imageUrl,
                  placeholder: (context, url) => CupertinoActivityIndicator(),
                ),
              ),
            ),
            title: Container(
              // padding: EdgeInsets.only(top: 5),
              child: Text(
                post.username,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                post.createdAt,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            trailing: DropdownButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.black54),
              underline: SizedBox(),
              items: <String>['Connect', 'Block', 'Report'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                post.message.title,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                post.message.description,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 15),
          post.attachments[0].url.isEmpty
              ? SizedBox()
              : Container(
                  height: MediaQuery.of(context).size.height / 3.4,
                  alignment: Alignment.center,
                  constraints: BoxConstraints(minHeight: 100),
                  decoration: BoxDecoration(color: Colors.grey.shade400),
                  child: post.attachments.length == 1
                      ? Image.asset(
                          post.attachments[0].url,
                          fit: BoxFit.cover,
                        )
                      : PageIndicatorContainer(
                          length: post.attachments.length,
                          align: IndicatorAlign.bottom,
                          indicatorColor: Colors.grey,
                          indicatorSelectorColor: primaryColor,
                          shape: IndicatorShape.circle(size: 8),
                          child: PageView.builder(
                            itemCount: post.attachments.length,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                post.attachments[index].url,
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                ),
          Divider(
            height: 30,
            thickness: 1,
            color: Colors.black54,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  setState(() {
                    if (liked.contains(post.postId)) {
                      liked.remove(post.postId);
                      UserRepository().disLike(post.postId, userId);
                    } else {
                      liked.add(post.postId);
                      UserRepository().like(post.postId, userId);
                    }
                  });
                },
                icon: Icon(
                    liked.contains(post.postId)
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    size: 20,
                    color: Colors.black54),
              ),
              SizedBox(width: 10),
              IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.solidComment,
                      size: 20, color: Colors.black54)),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.share,
                      size: 20, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        key: _scaffoldKey,
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu, color: Colors.white, size: 30),
          ),
          centerTitle: true,
          title: Text("Letz Connect"),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(bottom: 15),
            children: postList.map((post) => postWidget(post)).toList(),
          ),
        ),
      ),
    );
  }
}
