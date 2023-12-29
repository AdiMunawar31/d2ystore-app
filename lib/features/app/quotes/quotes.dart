import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;

class Quotes extends StatefulWidget {
  static const routeName = '/quotes';

  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  late String quote, owner, imglink;
  bool working = false;
  final grey = Colors.blueGrey[800];
  late ScreenshotController screenshotController;

  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
    quote = "";
    owner = "";
    imglink = "";
    getQuote();
  }

  // get a random Quote from the API
  Future<void> getQuote() async {
    try {
      setState(() {
        working = true;
        quote = imglink = owner = "";
      });
      var response = await http.post(
        Uri.parse('http://api.forismatic.com/api/1.0/'),
        body: {"method": "getQuote", "format": "json", "lang": "en"},
      );
      print("response <= ${response}");

      setState(() {
        try {
          var res = jsonDecode(response.body);
          owner = res["quoteAuthor"].toString().trim();
          quote = res["quoteText"].replaceAll("â", " ");
          getImg(owner);
        } catch (e) {
          getQuote();
        }
      });
    } catch (e) {
      offline();
    }
  }

  // if it is offline, show a fixed Quote
  void offline() {
    setState(() {
      owner = "Janet Fitch";
      quote = "The phoenix must burn to emerge";
      imglink = "";
      working = false;
    });
  }

  // When share button clicked, share a text and screenshot of the quote
  Future<void> shareQuote() async {
    final directory = await getApplicationDocumentsDirectory();
    String path =
        '${directory.path}/screenshots${DateTime.now().toIso8601String()}.png';

    try {
      await screenshotController.capture();
      Share.shareFiles([path], text: quote);
    } catch (e) {
      print(e.toString());
    }
  }

  // get image of the quote author, using Wikipedia Api
  Future<void> getImg(String name) async {
    var image = await http.get(Uri.parse(
        "https://en.wikipedia.org/w/api.php?action=query&generator=search&gsrlimit=1&prop=pageimages%7Cextracts&pithumbsize=400&gsrsearch=" +
            name +
            "&format=json"));

    setState(() {
      try {
        var res = json.decode(image.body)["query"]["pages"];
        res = res[res.keys.first];
        imglink = res["thumbnail"]["source"];
      } catch (e) {
        imglink = "";
      }
      working = false;
    });
  }

  // Choose to show the loaded image from the Api or the offline one
  Widget drawImg() {
    if (imglink.isEmpty) {
      return Image.asset("assets/images/d2ystore.png", fit: BoxFit.cover);
    } else {
      return Image.network(imglink, fit: BoxFit.cover);
    }
  }

  // Main build function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            drawImg(),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.6, 1],
                  colors: [
                    grey!.withAlpha(70),
                    grey!.withAlpha(220),
                    grey!.withAlpha(255),
                  ],
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: quote != null ? '“ ' : "",
                      style: const TextStyle(
                        fontFamily: "Ic",
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: quote != null ? quote : "",
                          style: const TextStyle(
                            fontFamily: "Ic",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        TextSpan(
                          text: quote != null ? '”' : "",
                          style: const TextStyle(
                            fontFamily: "Ic",
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    owner.isEmpty ? "" : "\n" + owner,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Ic",
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            AppBar(
              title: const Text(
                "Motivational Quote",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: !working ? getQuote : null,
            child: const Icon(Icons.refresh, size: 35, color: Colors.white),
          ),
          InkWell(
            onTap: null,
            child:
                const Icon(Icons.content_copy, size: 30, color: Colors.white),
          ),
          InkWell(
            onTap: null,
            child: const Icon(Icons.share, size: 30, color: Colors.white),
          )
        ],
      ),
    );
  }
}
