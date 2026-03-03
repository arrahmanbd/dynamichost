import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/dashboard_provider.dart';

class ImageSliderPage extends HookConsumerWidget {


  const ImageSliderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(sliderIndexProvider);

    return Center(
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Stack(
          children: [
            CarouselSlider(
              items: images
                  .map(
                    (image) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 120,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  ref.read(sliderIndexProvider.notifier).state = index;
                },
              ),
            ),
            // Bottom-right indicator
            Positioned(
              bottom: 12,
              right: 16,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: images.asMap().entries.map((entry) {
                    return Container(
                      width: currentIndex == entry.key ? 20 : 10,
                      height: 6,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: currentIndex == entry.key
                            ? Colors.white
                            : Colors.grey[300],
                        shape: currentIndex == entry.key
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        borderRadius: currentIndex == entry.key
                            ? BorderRadius.circular(5) // rounded rectangle
                            : null, // no radius for circle
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
