import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CategoryEnum {
  business('Business', FontAwesomeIcons.building),
  entertainment('Entertainment', FontAwesomeIcons.tv),
  general('General', FontAwesomeIcons.addressCard),
  health('Health', FontAwesomeIcons.kitMedical),
  science('Science', FontAwesomeIcons.microscope),
  sports('Sports', FontAwesomeIcons.volleyball),
  technology('Technology', FontAwesomeIcons.microchip);

  final String value;
  final IconData icon;

  const CategoryEnum(this.value, this.icon);
}