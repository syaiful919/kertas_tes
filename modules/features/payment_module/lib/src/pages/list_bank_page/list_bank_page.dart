import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'bloc/list_bank_page_bloc.dart';
import 'bloc/list_bank_page_event.dart';
import 'bloc/list_bank_page_state.dart';

class ListBankPage extends StatefulWidget {
  final Function(BankEntity) onSelected;

  const ListBankPage({
    super.key,
    required this.onSelected,
  });

  @override
  State<ListBankPage> createState() => _ListBankPageState();
}

class _ListBankPageState extends State<ListBankPage> {
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
        title: locale.listBankPage.title,
        context: context,
      ),
      body: BlocBuilder<ListBankPageBloc, ListBankPageState>(
        builder: (context, state) {
          return ViewDataWidget<(List<BankEntity>, List<BankEntity>)>.state(
            state: state.banks,
            onLoaded: (data) {
              final (_, List<BankEntity> displayed) = data;
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

  Widget _buildSuccessState(List<BankEntity> data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(Gap.md, Gap.md, Gap.md, Gap.sm),
          child: SearchField(
            placeholder: locale.listBankPage.placeholders.findBank,
            useShadow: true,
            onChanged: _onSearch,
          ),
        ),
        Expanded(
          child: _buildList(data),
        ),
      ],
    );
  }

  Widget _buildList(List<BankEntity> data) {
    if (data.isEmpty) {
      return const DefaultEmptyView();
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
        Gap.md,
        Gap.none,
        Gap.md,
        Gap.md,
      ),
      itemCount: data.length,
      itemBuilder: (_, i) {
        return DSListTile(
          title: data[i].name,
          onTap: () {
            widget.onSelected.call(data[i]);
          },
        );
      },
    );
  }

  void _loadData() {
    context.read<ListBankPageBloc>().add(GetListBankEvent());
  }

  void _onSearch(String value) {
    context.read<ListBankPageBloc>().add(
          SearchBankEvent(keyword: value),
        );
  }
}
