import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inbank_frontend/colors.dart';

class CountryDropdown extends StatelessWidget {
  final String selectedCountry;
  final Function(String?) onCountryChanged;
  final List<String> countries;

  const CountryDropdown({
    Key? key,
    required this.selectedCountry,
    required this.onCountryChanged,
    this.countries = const ['Estonia', 'Latvia', 'Lithuania'],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dropdownWidth = MediaQuery.of(context).size.width * 0.8;

    return Container(
      width: dropdownWidth, // Use responsive width
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Country',
          labelStyle: TextStyle(
            color: AppColors.textColor,
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: AppColors.primaryColor.withOpacity(0.1),
        ),
        value: selectedCountry,
        onChanged: onCountryChanged,
        style: GoogleFonts.openSans(
          color: AppColors.textColor,
          fontWeight: FontWeight.w600,
        ),
        dropdownColor: AppColors.primaryColor,
        items: countries.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: AppColors.textColor),
            ),
          );
        }).toList(),
      ),
    );
  }
}

