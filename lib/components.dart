import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TabsWeb extends StatefulWidget {
  final route;
  final title;
  const TabsWeb({Key? key, this.title, this.route}) : super(key: key);

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> with SingleTickerProviderStateMixin {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isSelected = true),
      onExit: (_) => setState(() => isSelected = false),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(widget.route);
        },
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 1.0,
            end: isSelected ? 1.05 : 1.0,
          ),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            style: GoogleFonts.aBeeZee(
              fontSize: 20.0,
              color: isSelected
                  ? Colors.tealAccent
                  : Theme.of(context).textTheme.bodyLarge!.color,
              decoration:
                  isSelected ? TextDecoration.underline : TextDecoration.none,
              decorationColor: Colors.tealAccent,
              decorationThickness: isSelected ? 2.0 : 1.0,
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        TabsWeb(
          title: "Home",
          route: '/',
        ),
        Spacer(),
        TabsWeb(
          title: "Works",
          route: '/works',
        ),
        Spacer(),
        TabsWeb(
          title: "Blog",
          route: '/blog',
        ),
        Spacer(),
        TabsWeb(
          title: "About",
          route: '/about',
        ),
        Spacer(),
        TabsWeb(
          title: "Contact",
          route: '/contact',
        ),
      ],
    );
  }
}

class TabsMobile extends StatefulWidget {
  final text;
  final route;
  const TabsMobile({Key? key, @required this.text, @required this.route})
      : super(key: key);

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        height: 50.0,
        minWidth: 200.0,
        color: Colors.blue,
        child: Text(
          widget.text,
          style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        });
  }
}

Widget urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35),
    onPressed: () async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    },
  );
}

class DrawersWeb extends StatefulWidget {
  const DrawersWeb({super.key});

  @override
  State<DrawersWeb> createState() => _DrawersWebState();
}

class _DrawersWebState extends State<DrawersWeb> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/pic.png"),
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            "Koustav Karmakar",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg",
                  "https://www.instagram.com/koustav_489/profilecard/"),
              urlLauncher(
                "assets/facebook.svg",
                "https://www.facebook.com/koustav.karmakar.75?mibextid=kFxxJD",
              ),
              urlLauncher(
                "assets/github.svg",
                "https://www.github.com/Koustav-KK",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DrawerMobile extends StatefulWidget {
  const DrawerMobile({super.key});

  @override
  State<DrawerMobile> createState() => _DrawerMobileState();
}

class _DrawerMobileState extends State<DrawerMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black)),
              child: Image.asset("assets/pic.png"),
            ),
          ),
          TabsMobile(text: "Home", route: '/'),
          SizedBox(height: 20.0),
          TabsMobile(text: "Works", route: '/works'),
          SizedBox(height: 20.0),
          TabsMobile(text: "Blog", route: '/blog'),
          SizedBox(height: 20.0),
          TabsMobile(text: "About", route: '/about'),
          SizedBox(height: 20.0),
          TabsMobile(text: "Contact", route: '/contact'),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher(
                "assets/instagram.svg",
                "https://www.instagram.com/koustav_489/profilecard/",
              ),
              urlLauncher(
                "assets/facebook.svg",
                "https://www.facebook.com/koustav.karmakar.75?mibextid=kFxxJD",
              ),
              urlLauncher(
                "assets/github.svg",
                "https://www.github.com/Koustav-KK",
              )
            ],
          )
        ],
      ),
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;
  const SansBold(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;
  const Sans(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

class AbelCustom extends StatefulWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbelCustom({
    Key? key,
    @required this.text,
    @required this.size,
    @required this.color,
    @required this.fontWeight,
  }) : super(key: key); // ✅ Fixed extra closing parenthesis

  @override
  State<AbelCustom> createState() => _AbelCustomState();
}

class _AbelCustomState extends State<AbelCustom> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: GoogleFonts.abel(
        fontSize: widget.size,
        color: widget.color == null ? Colors.black : widget.color,
        fontWeight:
            widget.fontWeight == null ? FontWeight.normal : widget.fontWeight,
      ),
    );
  }
}

class textForm extends StatelessWidget {
  final text;
  final Containerwidth;
  final hintText;
  final maxLine;
  final controller;
  final validator;

  const textForm(
      {Key? key,
      @required this.text,
      @required this.Containerwidth,
      @required this.hintText,
      this.maxLine,
      this.controller,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Sans(text, 16.0),
            SizedBox(height: 5.0),
            SizedBox(
              width: Containerwidth,
              child: TextFormField(
                validator: validator,
                controller: controller,
                maxLines: maxLine == null ? null : maxLine,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: hintText,
                  hintStyle: GoogleFonts.poppins(fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final width;
  final height;
  const AnimatedCard(
      {Key? key,
      @required this.imagePath,
      this.text,
      this.fit,
      this.reverse,
      this.width,
      this.height})
      : super(key: key);

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.imagePath,
                  height: widget.height == null ? 200.0 : widget.height,
                  width: widget.width == null ? 200.0 : widget.width,
                  fit: widget.fit == null ? null : widget.fit),
              SizedBox(height: 10.0),
              widget.text == null ? SizedBox() : SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

//Variables
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

var logger = Logger();

//Classes And Methods
class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          SansBold("Contact Me", 35.0),
          textForm(
            text: "First Name",
            Containerwidth: widthDevice / 1.4,
            hintText: "Please Enter First Name",
            controller: _firstNameController,
            validator: (text) {
              if (text.isEmpty) {
                return "Please Enter your First Name";
              }
            },
          ),
          textForm(
            text: "Last Name",
            Containerwidth: widthDevice / 1.4,
            hintText: "Please Enter Last Name",
            controller: _lastNameController,
          ),
          textForm(
            text: "Phone Number",
            Containerwidth: widthDevice / 1.4,
            hintText: "Please Type Phone Number",
            controller: _phoneController,
          ),
          textForm(
              text: "Email",
              Containerwidth: widthDevice / 1.4,
              hintText: "Enter Your Email Address",
              controller: _emailController,
              validator: (text) {
                if (text.isEmpty) {
                  return "Please Enter your Email";
                }
              }),
          textForm(
              text: "Message",
              Containerwidth: widthDevice / 1.4,
              hintText: "Please Type Your Message",
              maxLine: 10,
              controller: _messageController,
              validator: (text) {
                if (text.isEmpty) {
                  return "Please Enter your Message ";
                }
              }),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = new AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                    _firstNameController.text,
                    _lastNameController.text,
                    _emailController.text,
                    _phoneController.text,
                    _messageController.text)) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message Sent Successfully");
                } else {
                  DialogError(context, "Message Failed To Sent");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: SansBold("Submit", 20.0),
          ),
        ],
      ),
    );
  }
}

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  //var logger = Logger();
  //final TextEditingController _firstNameController = TextEditingController();
  //final TextEditingController _lastNameController = TextEditingController();
  //final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _phoneController = TextEditingController();
  //final TextEditingController _messageController = TextEditingController();
  //final formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 30.0),
          SansBold("Contact Me", 40.0),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                textForm(
                  text: "First Name",
                  Containerwidth: 350.0,
                  hintText: "Please Enter First Name",
                  controller: _firstNameController,
                  validator: (text) {
                    if (text.isEmpty) {
                      return "Please Enter your First Name";
                    }
                  },
                ),
                SizedBox(height: 15.0),
                textForm(
                  text: "Email",
                  Containerwidth: 350.0,
                  hintText: "Please Enter Email",
                  controller: _emailController,
                  validator: (text) {
                    if (text.isEmpty) {
                      return "Please Enter your Email";
                    }
                  },
                ),
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  textForm(
                    text: "Last Name",
                    Containerwidth: 350.0,
                    hintText: "Please Enter Last Name",
                    controller: _lastNameController,
                  ),
                  SizedBox(height: 15.0),
                  textForm(
                      text: "Phone Number",
                      Containerwidth: 350.0,
                      hintText: "Please Enter Phone Number",
                      controller: _phoneController),
                ],
              )
            ],
          ),
          SizedBox(height: 20.0),
          textForm(
              text: "Message",
              Containerwidth: widthDevice / 1.5,
              hintText: "Enter Your Message",
              maxLine: 10,
              controller: _messageController,
              validator: (text) {
                if (text.isEmpty) {
                  return "Please Enter your Message";
                }
              }),
          SizedBox(height: 20.0),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = new AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                    _firstNameController.text,
                    _lastNameController.text,
                    _emailController.text,
                    _phoneController.text,
                    _messageController.text)) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message Sent Successfully");
                } else {
                  DialogError(context, "Message Failed To Sent");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            height: 60.0,
            minWidth: 200.0,
            color: Colors.tealAccent,
            child: SansBold("Submit", 20.0),
          )
        ],
      ),
    );
  }
}

class AddDataFirestore {
  CollectionReference response =
      FirebaseFirestore.instance.collection('messages');

  Future addResponse(final firstName, final lastName, final email,
      final phoneNumber, final message) async {
    return response.add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone number': phoneNumber,
      'message': message,
      'createdAt': FieldValue.serverTimestamp(), // added for ordering
    }).then((value) {
      logger.d("Success");
      return true;
    }).catchError((error) {
      logger.d(error);
      return false;
    });
  }
}

Future<void> DialogError(BuildContext context, String title) async {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: SansBold(title, 20.0),
    ),
  );

  // Automatically dismiss the dialog after 2 seconds
  await Future.delayed(const Duration(seconds: 1));
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}

tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.tealAccent,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(5.0)),
    padding: EdgeInsets.all(7.0),
    child: Text(
      text,
      style: GoogleFonts.openSans(fontSize: 15.0),
    ),
  );
}
