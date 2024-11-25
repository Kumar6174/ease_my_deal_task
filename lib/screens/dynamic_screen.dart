import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/ui_config_bloc.dart';
import '../widgets/top_navigation.dart';
import '../widgets/dynamic_banner.dart';
import '../widgets/category_section.dart';
import '../widgets/offer_section.dart';
import '../widgets/deals_section.dart';

class DynamicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0, // Custom top navigation replaces app bar
      ),
      body: BlocBuilder<UiConfigBloc, UiConfigState>(
        builder: (context, state) {
          if (state is UiConfigLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UiConfigLoaded) {
            final sections = state.sections;
            return ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];
                switch (section['type']) {
                  case 'delivery':
                    return TopNavigation(section['delivery_address']);
                  case 'banner':
                    return DynamicBanner(section['banners']); // Pass banners list
                  case 'categories':
                    return CategorySection(section['categories']);
                  case 'offers':
                    return OfferSection(section);
                  case 'deals':
                    return DealsSection(section); // Pass deals data
                  default:
                    return SizedBox.shrink(); // Fallback for unrecognized types
                }
              },
            );
          } else if (state is UiConfigError) {
            return Center(child: Text(state.message));
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
