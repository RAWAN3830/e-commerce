import 'package:e_commerce/infra/provider/api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context,listen: false);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'), // Customize your color
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account Settings'),
            onTap: () {
              // Navigate to account settings page
            },
          ),
          Divider(),
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            secondary: Icon(Icons.notifications),
          ),

          Divider(),
          Consumer<ApiProvider>(
            builder: (context,value,child) {
              return SwitchListTile(
                title: Text('Dark Theme'),
                value: value.getTheme,
                onChanged: (values) {
                  value.setTheme = values;
                },
                secondary: Icon(Icons.brightness_6),
              );
            }
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language Settings'),
            onTap: () {
              // Navigate to language settings page
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            onTap: () {
              // Navigate to privacy policy
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About Us'),
            onTap: () {
              // Navigate to about us page
            },
          ),
        ],
      ),
    );
  }
}

