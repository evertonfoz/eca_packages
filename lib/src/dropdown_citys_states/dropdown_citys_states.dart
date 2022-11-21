import 'package:eca_packages/eca_packages.dart';
import 'package:eca_packages/src/dropdown_citys_states/mobx_stores/mobx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'data/models/cities.dart';
import 'data/models/states.dart';

class DropDownCitiesStates extends StatefulWidget {
  final Color? selectedColorItem;
  final String? stateName;
  final String? cityName;
  final Function(String)? updateState;
  final Function(String)? updateCity;
  final List<dynamic>? externalData;

  const DropDownCitiesStates({
    Key? key,
    this.selectedColorItem,
    this.stateName,
    this.cityName,
    this.updateState,
    this.updateCity,
    this.externalData,
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
    _controller.getStates(externalData: widget.externalData).then((value) {
      if (widget.stateName != null &&
          widget.stateName!.isNotEmpty &&
          _controller.states.isNotEmpty) {
        var foundState = _controller.states
            .where((element) =>
                (element.name == widget.stateName) ||
                (element.id == widget.stateName))
            .first;
        _controller.registerState(foundState);
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          if (widget.cityName != null &&
              widget.cityName!.isNotEmpty &&
              _controller.cities.isNotEmpty) {
            var foundCity = _controller.cities
                .where((element) => element.name == widget.cityName)
                .first;
            _controller.registerCity(foundCity);
          }
        });
      }
    });
  }

  // @override
  @override
  Widget build(BuildContext context) {
    if (_controller.states.isNotEmpty &&
        widget.stateName!.isNotEmpty &&
        widget.stateName != _controller.stateSelected.name) {
      var foundState = _controller.states
          .where((element) =>
              (element.name == widget.stateName) ||
              (element.id == widget.stateName))
          .first;
      _controller.registerState(foundState);
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        if (widget.cityName!.isNotEmpty &&
            widget.cityName != _controller.citySelected.name) {
          var foundCity = _controller.cities
              .where((element) => element.name == widget.cityName)
              .first;
          _controller.registerCity(foundCity);
        }
      });
    }
    return Column(
      children: [
        const SizedBox(height: 5),
        Observer(builder: (context) {
          print(widget.stateName);
          return DropDown<StateModel>(
            selectedItem: _controller.stateSelected,
            hintText: 'Selecione um Estado',
            selectedColorItem: widget.selectedColorItem ?? Colors.red,
            items: _controller.states,
            compareFn: (item, selectedItem) => item?.id == selectedItem?.id,
            onChanged: (value) {
              _controller.registerState(value,
                  externalData: widget.externalData);
              if (widget.updateState != null) {
                widget.updateState!(value!.name);
              }
            },
            itemAsString: (value) =>
                value!.toString(), // value.modelAsString(),showSearchBox: true,
            searchHintText: 'Digite o nome do estado', showSearchBox: true,
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
            onChanged: (value) {
              _controller.registerCity(value!);
              if (widget.updateCity != null) {
                widget.updateCity!(value.name);
              }
            },
            itemAsString: (value) =>
                value!.toString(), // value.modelAsString(),showSearchBox: true,
            searchHintText: 'Digite o nome da cidade', showSearchBox: true,
            filterFn: (item, text) =>
                item.name.toString().toLowerCase().contains(text.toLowerCase()),
          );
        }),
        const SizedBox(height: 5),
      ],
    );
  }
}
