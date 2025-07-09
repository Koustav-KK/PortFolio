import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/web.dart' show Logger;
import 'package:my_portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  get headerSliverBuilder => null;

  get body => null;

  // List title = ["Who Is Koustav?", "🚀 Building My Portfolio App with Flutter"];
  //List bodyText = ["We Can Read It On My Blog Page", "Check It Out"];
  void article() async {
    await FirebaseFirestore.instance
        .collection("articles")
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.reversed.forEach((element) {
        //print(element.data()['title']);
      });
    });
  }

  /* void streamArticle() async {
    var logger = Logger();

    await for (var snapshot
        in FirebaseFirestore.instance.collection('articles').snapshots()) {
      for (var title in snapshot.docs.reversed) {
        logger.d(title.data()['title']);
      }
    }
  }*/

  /*@override
  void initState() {
    streamArticle();
    //article();
    super.initState();
  }*/

  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 800;

    return Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        endDrawer: DrawerMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  size: 35.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: isWeb ? false : true,
                  title: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    padding: EdgeInsetsGeometry.symmetric(
                        horizontal: isWeb ? 7.0 : 4.0),
                    child: AbelCustom(
                        text: "Welcome To My Blog",
                        size: isWeb ? 30.0 : 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  background: Image.asset(
                    "assets/blog.JPG",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: isWeb ? 500.0 : 400.0,
              ),
            ];
          },
          body: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('articles').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return BlogPost(
                          title: documentSnapshot['title'],
                          bodyText: documentSnapshot['body'],
                          isWeb: isWeb,
                        );
                      });
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              }),
        ));
  }
}

class BlogPost extends StatefulWidget {
  final title;
  final bodyText;
  final isWeb;
  const BlogPost(
      {Key? key,
      @required this.title,
      @required this.bodyText,
      required this.isWeb})
      : super(key: key);

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.isWeb
          ? EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0)
          : EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
              style: BorderStyle.solid, width: 1.0, color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3.0)),
                    child: AbelCustom(
                        text: widget.title.toString(),
                        size: 25.0,
                        color: Colors.white),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        expand = !expand;
                      });
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(height: 7.0),
            Text(widget.bodyText.toString(),
                style: GoogleFonts.openSans(fontSize: 15.0),
                maxLines: expand == true ? null : 3,
                overflow: expand == true
                    ? TextOverflow.visible
                    : TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
