import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/utils/decorator_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownFormField extends StatelessWidget {
  DropdownFormField(
      {super.key, required this.dropdownvalue, required this.dropdownItems});
  final String dropdownvalue;
  final List<String> dropdownItems;
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: PopupProps.menu(
        menuProps: _getPopUpProps(),
        showSelectedItems: true,
        fit: FlexFit.loose,
        containerBuilder: (context, popupWidget) =>
            _containerBuilder(popupWidget),
        itemBuilder: (context, item, isSelected) {
          return _itemBuilder(
            itemName: item,
            isSelected: isSelected,
          );
        },
      ),
      items: dropdownItems,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyles.graydefaultTextStyle.copyWith(fontSize: 14),
        dropdownSearchDecoration: InputDecoration(
            fillColor: AppColors.graylight,
            filled: true,
            border: fieldBorder(),
            enabledBorder: fieldBorder()),
      ),
      onChanged: print,
      selectedItem: dropdownvalue,
    );
  }

  MenuProps _getPopUpProps() {
    return MenuProps(
      backgroundColor: AppColors.transparent,
      shadowColor: AppColors.transparent,
    );
  }

  Widget _containerBuilder(Widget popupWidget) {
    return Padding(
      padding: EdgeInsets.only(top: Ui.getPadding(0.5)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Ui.getPadding(1)),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.white),
          borderRadius: BorderRadius.circular(Ui.getRadius(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: popupWidget,
      ),
    );
  }

  Widget _itemBuilder({required String itemName, required bool isSelected}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Ui.getPadding(2),
        vertical: Ui.getPadding(1.5),
      ),
      child: Text(
        itemName,
        style: isSelected
            ? TextStyles.BlackDefaultText.copyWith(
                fontSize: Ui.getFontSize(1.1),
                color: AppColors.red,
              )
            : TextStyles.BlackDefaultText.copyWith(
                fontSize: Ui.getFontSize(1.1)),
      ),
    );
  }
}
