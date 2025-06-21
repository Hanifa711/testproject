import 'package:flutter/material.dart';

class ProductImageGallery extends StatelessWidget {
  final List<String> images;
  final int selectedImageIndex;
  final Function(int) onImageTap;

  const ProductImageGallery({
    super.key,
    required this.images,
    required this.selectedImageIndex,
    required this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: 308,
            width: 294,
            child:
                images.isNotEmpty
                    ? Image.network(
                      images[selectedImageIndex],
                      fit: BoxFit.contain,
                    )
                    : Icon(Icons.image, size: 100),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(images.length, (index) {
            return GestureDetector(
              onTap: () => onImageTap(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border:
                      selectedImageIndex == index
                          ? Border.all(color: Colors.green, width: 2)
                          : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(images[index], width: 40, height: 40),
              ),
            );
          }),
        ),
      ],
    );
  }
}
