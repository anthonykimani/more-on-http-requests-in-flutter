import 'package:flutter/material.dart';
import 'package:http_requests_in_flutter/models/property_model.dart';
import 'package:http_requests_in_flutter/widgets/http_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Request In Flutter'),
      ),
      body: FutureBuilder(
        future: httpService.getProperties(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Property>> snapshot) {
          if (snapshot.hasData) {
            List<Property>? properties = snapshot.data;
            return ListView(
              children: properties!
                  .map((Property property) => ListTile(
                        title: Text(property.propertyName),
                        subtitle: Text(property.propertyDescription),
                      ))
                  .toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
