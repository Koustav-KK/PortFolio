import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Blog extends StatefulWidget {
  const Blog({super.key});

  @override
  State<Blog> createState() => _BlogState();
}

class _BlogState extends State<Blog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 800;
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.transparent,
      endDrawer: DrawerMobile(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.primary.withOpacity(0.2),
              theme.colorScheme.secondary.withOpacity(0.2),
              theme.colorScheme.surface.withOpacity(0.9),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
            transform: GradientRotation(_scrollController.hasClients
                ? _scrollController.offset * 0.0005
                : 0), // Subtle parallax effect
          ),
        ),
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent, // Match other widgets
                iconTheme: IconThemeData(
                  size: 35.0,
                  color: theme.colorScheme.onSurface,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: isWeb ? false : true,
                  title: Container(
                    decoration: BoxDecoration(
                      color:
                          theme.colorScheme.primary, // Theme-consistent color
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: isWeb ? 7.0 : 4.0),
                    child: AbelCustom(
                      text: "Welcome To My Blog",
                      size: isWeb ? 30.0 : 24.0,
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Image.asset(
                    "assets/blog.JPG",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: isWeb ? 500.0 : 400.0,
                pinned: true,
                floating: true,
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
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: BlogPost(
                        title: documentSnapshot['title'],
                        bodyText: documentSnapshot['body'],
                        isWeb: isWeb,
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class BlogPost extends StatefulWidget {
  final String? title;
  final String? bodyText;
  final bool isWeb;
  const BlogPost({
    Key? key,
    required this.title,
    required this.bodyText,
    required this.isWeb,
  }) : super(key: key);

  @override
  State<BlogPost> createState() => _BlogPostState();
}

class _BlogPostState extends State<BlogPost> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: widget.isWeb
          ? EdgeInsets.only(left: 70.0, right: 70.0, top: 40.0)
          : EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            width: 1.0,
            color: theme.colorScheme.primary,
          ),
          color: theme.colorScheme.surface.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: AbelCustom(
                      text: widget.title ?? 'Untitled',
                      size: 25.0,
                      color: theme.colorScheme.onPrimary,
                    ),
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
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.0),
            Text(
              widget.bodyText ?? 'No content available',
              style: GoogleFonts.openSans(fontSize: 15.0),
              maxLines: expand ? null : 3,
              overflow: expand ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
