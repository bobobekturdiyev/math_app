import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:math_app/core/di/locator.dart';
import 'package:math_app/core/resources/all_resources.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../main/data/models/link/link_dto.dart';

class WLinkItem extends StatelessWidget {
  final LinkDto link;

  const WLinkItem({
    super.key,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(Uri.parse(link.url));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: Row(
          children: [
            if (link.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(imageUrl: link.image!),
              )
            else
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  AppImages.placeholder,
                  width: 42,
                  height: 42,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                link.title,
                style: locator<ThemeData>().textTheme.bodyMedium,
              ),
            ),
            SvgPicture.asset(
              AppIcons.arrowRightRounded,
              width: 36,
              height: 36,
              colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
