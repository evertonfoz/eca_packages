import 'package:eca_packages/eca_packages.dart';
import 'package:eogas/core/constants/app_colors.dart';
import 'package:eogas/features/dropdown_citys_states/data/models/cities_model.dart';
import 'package:eogas/features/dropdown_citys_states/data/models/states_model.dart';
import 'package:eogas/features/dropdown_citys_states/mobx_stores/mobx_controller.dart';
import 'package:eogas/generators/sizedbox_generators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class DropDownCitiesStates extends StatefulWidget {
  const DropDownCitiesStates({Key? key}) : super(key: key);

  @override
  State<DropDownCitiesStates> createState() => _DropDownCitiesStates();
}

class _DropDownCitiesStates extends State<DropDownCitiesStates> {
  var controller = MobxController();
  GlobalKey key = GlobalKey();

  List<ReactionDisposer> disposers = [];
  @override
  void initState() {
    super.initState();
    controller.findStates();
    disposers = [
      reaction((_) => controller.stateSelected, (_) => controller.findCities()),
    ];
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        rowHeightDividerSizedBox(times: 1),
        Observer(builder: (context) {
          return DropDown<StateModel>(
            selectedItem: controller.stateSelected,
            hintText: 'Selecione um Estado',
            selectedColorItem: kBrandColor,
            items: controller.states!,
            compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
            onChanged: (value) => controller.selectState(value!),
            itemAsString: (value) =>
                value!.toString(), // value.modelAsString(),
          );
        }),
        rowHeightDividerSizedBox(times: 2),
        Observer(builder: (context) {
          return DropDown<CityModel>(
            selectedItem: controller.citySelected,
            hintText: 'Selecione uma Cidade',
            selectedColorItem: kBrandColor,
            items: controller.cities ?? [],
            compareFn: (item, selectedItem) => item?.name == selectedItem?.name,
            onChanged: (value) => controller.selectCity(value!),
            itemAsString: (value) =>
                value!.toString(), // value.modelAsString(),
          );
        }),
        rowHeightDividerSizedBox(times: 1),
      ],
    );

    //         DropDown<CylinderTypeModel>(
    //   selectedItem: _cylindersStore.typeCylinderModel,
    //   hintText: 'Selecione o tipo do seu botijão',
    //   selectedColorItem: kBrandColor,
    //   items: list,
    //   compareFn: (item, selectedItem) =>
    //       item?.cylinderTypeID == selectedItem?.cylinderTypeID,
    //   onChanged: (value) => _cylindersStore.registerTypeCylinder(value!),
    //   itemAsString: (value) => value.toString(), // value.modelAsString(),
    // ),
  }
}
