import 'package:flutter/material.dart';

import 'RestaurantsScreen.dart';

class ResourcesWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Object resource;

  const ResourcesWidget(this.title, this.icon, this.resource);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 88,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 8),
                color: Colors.grey.withOpacity(.5),
                spreadRadius: 4)
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => resource))
            },
            child: Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Icon(this.icon, color: Colors.grey[700]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(this.title),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
