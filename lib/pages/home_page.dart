import 'package:flutter/material.dart';
import 'package:server_test2/elements/bor_mero.dart';
import 'package:server_test2/elements/drawer.dart';
import 'package:server_test2/models/container.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  final String url; // URL for the WebSocket connection
  const HomePage({super.key, required this.url});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<WebSocketChannel>
      _channelFuture; // Future for the WebSocket channel
  ContainerManager manager = ContainerManager();

  @override
  void initState() {
    super.initState();
    _channelFuture = _connectToWebSocket(); // Initialize the Future
  }

  Future<WebSocketChannel> _connectToWebSocket() async {
    // Create and return the WebSocket channel
    final channel = WebSocketChannel.connect(Uri.parse(widget.url));
    return channel;
  }

  @override
  void dispose() {
    // Close the channel when the widget is disposed
    _channelFuture.then((channel) => channel.sink.close());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: FutureBuilder<WebSocketChannel>(
        future: _channelFuture, // Use the Future here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final channel = snapshot.data!;
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Demo'),
                    centerTitle: true,
                  ),
                ),
                StreamBuilder(
                  stream: channel.stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                              Text("Waiting for data..."),
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                        child: Center(
                            child: ElevatedButton(
                          child: Text("Retry Connection"),
                          onPressed: () {
                            setState(() {
                              _channelFuture.then((channel) => channel.sink.close());
                              _channelFuture = _connectToWebSocket();
                            });
                          },
                        )),
                      );
                    } else if (snapshot.hasData) {
                      manager.verify(snapshot.data);
                      if (manager.containers.isEmpty) {
                        return SliverToBoxAdapter(child: Center(child: Text('No data available.')));
                      }
                      return SliverPadding(
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500.0,
                            mainAxisSpacing: 70.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              var con =
                                  manager.containers.values.toList()[index];
                              return con != null
                                  ? BorWidget(container: con)
                                  : Text("No data");
                            },
                            childCount: manager.containers.length,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 40),
                      );
                    } else {
                      return Center(child: Text('No data available.'));
                    }
                  },
                ),
              ],
            );
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
