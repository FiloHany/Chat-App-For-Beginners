import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  // The route name for this page.
  static String id = 'chat page';

  // Scorller controller for the ListView
  final scrollController = ScrollController();

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollections);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Retrieve the email argument passed from the previous page
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                centerTitle: true,
                // Use the klogo constant for the logo image in the app bar
                automaticallyImplyLeading: false,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(klogo),
                      height: 80,
                    ),
                    Text(
                      "Chat App",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Pacifico",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          // Return a ChatBubble widget for each item in the list
                          return messagesList[index].user == email
                              ? ChatBubble(
                                  message: messagesList[index],
                                )
                              : ChatBubbleFriends(
                                  message: messagesList[index],
                                );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        messages.add({
                          kMessage: value,
                          kCreatedAt: DateTime.now(),
                          kUser: email,
                        });
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        controller.clear();
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            color: kPrimaryColor,
                            onPressed: () {
                              // Handle send button press
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Type your message here...",
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(16),
                          )),
                    ),
                  ),
                ],
              ),
            );
          } else {
            print('Loading...');
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
