

//IDEE DER MAINPAGEABER GESCHEITERT
/*
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class SearchBar extends StatefulWidget {
  @override
  State createState() {
    return _SearchBar();
  }
}

class _SearchBar extends State {
  late bool searching, error;
  var data;
  late String query;
  String dataurl = "https://wild-kerchief-fish.cyclic.app";

  @override
  void initState() {
    searching = false;
    error = false;
    query = "";
    super.initState();
  }

  void getSuggestion() async {
    //get suggestion function
    var url = Uri.parse(dataurl + "/station/" + Uri.encodeComponent(query));
    var res = await http.get(url);
    //in query there might be unwant character so, we encode the query to url
    if (res.statusCode == 200) {
      setState(() {
        data = json.decode(res.body);
        //update data value and UI
      });
      log("MK: data: ${data}");
    } else {
      //there is error
      setState(() {
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: searching
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      searching = false;
                      //set not searching on back button press
                    });
                  },
                )
              : Icon(Icons.play_arrow),
          //if searching is true then show arrow back else play arrow
          title: searching ? searchField() : Text("Meine Stationen"),
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    searching = true;
                  });
                }), // search icon button

            //add more icons here
          ],
          backgroundColor: searching ? Colors.grey : Colors.black,
          //if searching set background to black, else set to deep orange
        ),
        body: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                child: data == null
                    ? Container(
                        padding: EdgeInsets.all(20),
                        child: searching
                            ? Text("Loading...")
                            : Text("Suche jede Station")
                        //if is searching then show "Please wait"
                        //else show search peopels text
                        )
                    : Container(
                        child: searching
                            ? showSearchSuggestions()
                            : Text("Finde jede Station"),
                      )
                // if data is null or not retrived then
                // show message, else show suggestion
                )));
  }

  Widget showSearchSuggestions() {
    List suggestionlist = List.from(data.map((i) {
      return SearchSuggestion.fromJSON(i);
    }));
    //serilizing json data inside model list.
    return Column(
      children: suggestionlist.map((suggestion) {
        return InkResponse(
            onTap: () {
              //when tapped on suggestion
              print(suggestion.id); //pint student id
            },
            child: SizedBox(
                width: double.infinity, //make 100% width
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      suggestion.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )));
      }).toList(),
    );
  }

  Widget searchField() {
    //search input field
    return Container(
        child: TextField(
      autofocus: true,
      style: TextStyle(color: Colors.white, fontSize: 18),
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
        hintText: "Suche Stationen",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ), //under line border, set OutlineInputBorder() for all side border
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ), // focused border color
      ), //decoration for search input field
      onChanged: (value) {
        query = value; //update the value of query
        getSuggestion(); //start to get suggestion
      },
    ));
  }
}

//serarch suggestion data model to serialize JSON data
class SearchSuggestion {
  String id, name;
  SearchSuggestion({required this.id, required this.name});

  factory SearchSuggestion.fromJSON(Map<String, dynamic> json) {
    return SearchSuggestion(
      id: json["id"],
      name: json["name"],
    );
  }
}
*/
