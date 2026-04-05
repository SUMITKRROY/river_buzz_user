import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Unsplash fallbacks when primary CDN URLs fail (boat → ghat → morning aarti).
const kVaranasiImageFallbacks = [
  'https://images.unsplash.com/photo-1561361058-c24cecae35ca', // Boat at sunrise
  'https://images.unsplash.com/photo-1518005020250-6eb5f3f2754d', // Ghat steps
  'https://images.unsplash.com/photo-1590050752117-23a9d7fc2173', // Morning Aarti
];

/// Primary URL first, then [kVaranasiImageFallbacks], deduplicated.
List<String> buildImageUrlChain(String primaryUrl) {
  final all = [primaryUrl, ...kVaranasiImageFallbacks];
  final seen = <String>{};
  return all.where((u) => seen.add(u)).toList();
}

class NetworkImageWithFallbacks extends StatefulWidget {
  const NetworkImageWithFallbacks({
    super.key,
    required this.urls,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.loadingBuilder,
    this.errorWidget,
    this.retryPlaceholder,
    this.retryBackgroundColor,
  });

  final List<String> urls;
  final BoxFit fit;
  final double? height;
  final double? width;
  final ImageLoadingBuilder? loadingBuilder;
  final Widget? errorWidget;

  /// Shown while advancing to the next URL after a load failure.
  final Widget? retryPlaceholder;

  /// Background while retrying the next URL. Defaults to light grey.
  final Color? retryBackgroundColor;

  @override
  State<NetworkImageWithFallbacks> createState() =>
      _NetworkImageWithFallbacksState();
}

class _NetworkImageWithFallbacksState extends State<NetworkImageWithFallbacks> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.urls.isEmpty) {
      return widget.errorWidget ?? const SizedBox.shrink();
    }
    final url = widget.urls[_index.clamp(0, widget.urls.length - 1)];
    final isLast = _index >= widget.urls.length - 1;

    return Image.network(
      url,
      key: ValueKey<String>(url),
      height: widget.height,
      width: widget.width,
      fit: widget.fit,
      loadingBuilder: widget.loadingBuilder,
      errorBuilder: (context, error, stackTrace) {
        if (!isLast) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            if (mounted) setState(() => _index++);
          });
          return Container(
            height: widget.height,
            width: widget.width,
            color: widget.retryBackgroundColor ?? Colors.grey.shade200,
            child: widget.retryPlaceholder ??
                const Center(
                  child: CircularProgressIndicator(color: Colors.grey),
                ),
          );
        }
        return widget.errorWidget ??
            Container(
              height: widget.height,
              width: widget.width,
              color: Colors.grey.shade200,
              child: const Icon(Icons.error_outline, color: Colors.grey, size: 40),
            );
      },
    );
  }
}
