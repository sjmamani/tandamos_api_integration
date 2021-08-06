import 'package:flutter/material.dart';

import 'constants/dio_client.dart';
import 'model/user_data_model.dart';

class TandamosApiIntegrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DioClient _dioClient = DioClient();
    return MaterialApp(
      title: 'Tandamos Api Integration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<UserData>(
          future: _dioClient.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => _dioClient
                      .getConfigurationTada(snapshot.data!.accessToken),
                  child: Text('GET Config Tanda'),
                ),
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
