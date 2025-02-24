import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';

class PartnerCard extends StatelessWidget {
  final PartnerEntity partner;
  final Function(PartnerEntity partner) onTap;

  const PartnerCard({
    super.key,
    required this.partner,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(partner),
      child: DSFlatCard(
        padding: const EdgeInsets.all(Gap.xs),
        child: SpacedRow(
          space: Gap.xxs,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blue200,
              radius: Corners.lg,
              child: Text(
                partner.name.getAbbreviation(),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: FontSize.xs,
                ),
              ),
            ),
            Expanded(
              child: SpacedColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                space: Gap.xxxxs,
                children: [
                  Text(
                    partner.name,
                    style: const TextStyle(
                      color: AppColors.blue700,
                      fontSize: FontSize.lg,
                      height: 1.25,
                    ),
                  ),
                  Text(
                    partner.email,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: FontSize.xs,
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
