import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/services/data_services.dart';
import 'package:travelapp/widgets/app_text.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchPage({super.key});

  void _searchPlaces(BuildContext context) {
    final name = _controller.text;
    if (name.isNotEmpty) {
      context.read<PlacesProvider>().fetchPlaces(name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Search",
          textf: FontWeight.bold,
          size: 30.sp,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'Enter place name',
                  labelStyle: TextStyle(color: Colors.blue[900]),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.blue[900],
                    ),
                    onPressed: () => _searchPlaces(context),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Consumer<PlacesProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (provider.places.isEmpty) {
                    return Center(
                        child: Text(
                      'No places found',
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ));
                  } else {
                    return ListView.builder(
                      itemCount: provider.places.length,
                      itemBuilder: (context, index) {
                        final place = provider.places[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                place['name'],
                                style: TextStyle(
                                    fontSize: 20.sp, color: Colors.blue[900]),
                              ),
                              subtitle: Text(
                                place['description'] ??
                                    'No description available',
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.black),
                              ),
                            ),
                            Divider(
                              height: 5.h,
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
