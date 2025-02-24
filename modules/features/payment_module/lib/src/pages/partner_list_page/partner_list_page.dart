import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';
import 'package:payment_module/src/pages/partner_list_page/bloc/partner_list_page_bloc.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'bloc/partner_list_page_event.dart';
import 'bloc/partner_list_page_state.dart';
import 'widgets/partner_card.dart';

class PartnerListPage extends StatefulWidget {
  final Function(PartnerEntity partner) onSelectPartner;

  const PartnerListPage({
    super.key,
    required this.onSelectPartner,
  });

  @override
  State<PartnerListPage> createState() => _PartnerListPageState();
}

class _PartnerListPageState extends State<PartnerListPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return DSScaffold(
      backgroundColor: AppColors.white100,
      appBar: PlainAppbar(
        title: locale.partnerListPage.title,
        context: context,
      ),
      body: BlocBuilder<PartnerListPageBloc, PartnerListPageState>(
        builder: (context, state) {
          return ViewDataWidget<
              (
                List<PartnerEntity>,
                List<PartnerEntity>,
              )>.state(
            state: state.partners,
            onLoaded: (data) {
              final (_, List<PartnerEntity> displayed) = data;
              return _buildSuccessState(displayed);
            },
            onErrorRetry: () {
              _loadData();
            },
          );
        },
      ),
    );
  }

  Widget _buildSuccessState(List<PartnerEntity> data) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(Gap.md, Gap.md, Gap.md, Gap.xs),
          child: SpacedColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            space: Gap.lg,
            children: [
              SearchField(
                onChanged: _onSearch,
                placeholder: locale.partnerListPage.placeholders.findPartner,
              ),
              Text(
                locale.partnerListPage.labels.target,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: FontSize.xs,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: _buildList(data),
        ),
      ],
    );
  }

  Widget _buildList(List<PartnerEntity> data) {
    if (data.isEmpty) {
      return const DefaultEmptyView();
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
        Gap.md,
        Gap.none,
        Gap.md,
        Gap.md,
      ),
      itemCount: data.length,
      itemBuilder: (_, i) {
        return PartnerCard(
          partner: data[i],
          onTap: widget.onSelectPartner,
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: Gap.sm);
      },
    );
  }

  void _loadData() {
    context.read<PartnerListPageBloc>().add(GetPartnerListEvent());
  }

  void _onSearch(String value) {
    context.read<PartnerListPageBloc>().add(
          SearchPartnerEvent(keyword: value),
        );
  }
}
