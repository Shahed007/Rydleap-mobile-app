import 'package:flutter/material.dart';
import 'package:rydleap/core/app_icons.dart';

class AboutModel {
  final String title;
  final String icon;
  final VoidCallback onTap;

  AboutModel({required this.title, required this.icon, required this.onTap});
}

List<AboutModel> aboutItems = [
  AboutModel(
      title: "Settings",
      icon: AppIcons.settings,
      onTap: () {
        print("Settings");
      }),
  AboutModel(
      title: "Promotions and offers",
      icon: AppIcons.promotion,
      onTap: () {
        print("Promotions and offers");
      }),
  AboutModel(
      title: "Change Password",
      icon: AppIcons.key,
      onTap: () {
        print("Change Password");
      }),
  AboutModel(
      title: "Payment Methods",
      icon: AppIcons.payment,
      onTap: () {
        print("Payment Methods");
      }),
  AboutModel(
      title: "Ride History",
      icon: AppIcons.history,
      onTap: () {
        print("Ride History");
      }),
  AboutModel(
      title: "Language",
      icon: AppIcons.language,
      onTap: () {
        print("Language");
      }),
  AboutModel(
      title: "Report a Problem",
      icon: AppIcons.report,
      onTap: () {
        print("Report a Problem");
      }),
  AboutModel(
      title: "Contact us",
      icon: AppIcons.contact,
      onTap: () {
        print("Contact us");
      }),
];
