import 'package:core_module/core_module.dart';
import 'package:domain_module/domain_module.dart';
import 'package:flutter/material.dart';
import 'package:payment_module/src/locale/strings.g.dart';
import 'package:payment_module/src/pages/payment_method_page/bloc/payment_method_page_event.dart';
import 'package:third_parties_module/flutter_bloc.dart';

import 'bloc/payment_method_page_bloc.dart';
import 'bloc/payment_method_page_state.dart';
import 'widgets/payment_method_group_card.dart';

class PaymentMethodPage extends StatefulWidget {
  final PaymentDetailEntity paymentDetail;
  final Function(String paymentId) onSuccess;

  const PaymentMethodPage({
    super.key,
    required this.paymentDetail,
    required this.onSuccess,
  });

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  void initState() {
    super.initState();
    _setPaymentData();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentMethodPageBloc, PaymentMethodPageState>(
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          DSSnackBar.show(
            context: context,
            type: DSHighlightInfoType.error,
            message: state.errorMessage,
          );
          return;
        }

        String? paymentId = state.paymentId;
        if (paymentId != null) {
          widget.onSuccess.call(paymentId);
          return;
        }
      },
      builder: (context, state) {
        return DSScaffold(
          isLoading: state.isSubmitting,
          backgroundColor: AppColors.white100,
          appBar: PlainAppbar(
            context: context,
            title: locale.paymentMethodPage.title,
          ),
          body: ViewDataWidget.state(
            state: state.paymentMethods,
            onLoaded: (data) {
              return SpacedColumn(
                children: [
                  Expanded(
                    child: _buildListGroup(
                      groups: data,
                      state: state,
                    ),
                  ),
                  _buildBottomSection(state),
                ],
              );
            },
            onErrorRetry: () {
              _loadData();
            },
          ),
        );
      },
    );
  }

  Widget _buildListGroup({
    required List<PaymentMethodGroupEntity> groups,
    required PaymentMethodPageState state,
  }) {
    return ListView.separated(
      padding: const EdgeInsets.all(Gap.md),
      itemCount: groups.length,
      itemBuilder: (_, i) {
        return PaymentMethodGroupCard(
          group: groups[i],
          selectedMethodId: state.selectedPaymentMethod?.id,
          onSelect: _onSelectMethod,
        );
      },
      separatorBuilder: (_, __) {
        return const SizedBox(height: Gap.md);
      },
    );
  }

  Widget? _buildBottomSection(PaymentMethodPageState state) {
    if (!state.isShowNextButton) {
      return null;
    }

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.grey100),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Gap.md,
        vertical: Gap.xs,
      ),
      child: SpacedRow(
        space: Gap.xs,
        children: [
          Expanded(
            child: SpacedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              space: Gap.xxxs,
              children: [
                Text(
                  locale.paymentMethodPage.labels.totalPayment,
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: FontSize.xs,
                  ),
                ),
                Text(
                  state.totalAmount.currency(),
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: FontSize.md,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150,
            child: DSButton(
              size: DSButtonSizeType.small,
              title: locale.paymentMethodPage.buttons.next,
              onPressed: _onProcessPayment,
            ),
          ),
        ],
      ),
    );
  }

  void _setPaymentData() {
    context
        .read<PaymentMethodPageBloc>()
        .add(SetPaymentDetail(paymentDetail: widget.paymentDetail));
  }

  void _loadData() {
    context.read<PaymentMethodPageBloc>().add(GetPaymentMethodList());
  }

  void _onSelectMethod(PaymentMethodEntity value) {
    context
        .read<PaymentMethodPageBloc>()
        .add(SelectPaymentMethod(method: value));
  }

  void _onProcessPayment() {
    context.read<PaymentMethodPageBloc>().add(ProcessPayment());
  }
}
