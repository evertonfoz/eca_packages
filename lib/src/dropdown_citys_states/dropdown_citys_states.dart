import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/mobx_stores/mobx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'data/models/cities.dart';
import 'data/models/states.dart';

class DropDownCitiesStates extends StatefulWidget {
  final Color? selectedColorItem;

  const DropDownCitiesStates({
    Key? key,
    this.selectedColorItem,
  }) : super(key: key);

  @override
  State<DropDownCitiesStates> createState() => _DropDownCitiesStates();
}

class _DropDownCitiesStates extends State<DropDownCitiesStates> {
  final StateAndCityController _controller = StateAndCityController();

  // List<ReactionDisposer> disposers = [];
  @override
  void initState() {
    super.initState();
    _controller.getStates();
    // disposers = [
    //   reaction((_) => _controller.stateSelected,
    //       (_) => _controller.getCitiesBySelectedState()),
    // ];
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Observer(builder: (context) {
          return DropDown<StateModel>(
            selectedItem: _controller.stateSelected,
            hintText: 'Selecione um Estado',
            selectedColorItem: widget.selectedColorItem ?? Colors.red,
            items: _controller.states,
            compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
            onChanged: (value) => _controller.registerState(value),
            itemAsString: (value) =>
                value!.toString(), // value.modelAsString(),showSearchBox: true,
            searchHintText: 'Digite o nome do estado',
            filterFn: (item, text) =>
                item.name.toString().toLowerCase().contains(text.toLowerCase()),
          );
        }),
        const SizedBox(height: 5),
        Observer(builder: (context) {
          return DropDown<CityModel>(
            selectedItem: _controller.citySelected,
            hintText: 'Selecione uma Cidade',
            selectedColorItem: widget.selectedColorItem ?? Colors.red,
            items: _controller.cities,
            compareFn: (item, selectedItem) => item?.name == selectedItem?.name,
            onChanged: (value) => _controller.registerCity(value!),
            itemAsString: (value) =>
                value!.toString(), // value.modelAsString(),showSearchBox: true,
            searchHintText: 'Digite o nome da cidade',
            filterFn: (item, text) =>
                item.name.toString().toLowerCase().contains(text.toLowerCase()),
          );
        }),
        const SizedBox(height: 5),
      ],
    );
  }
}
