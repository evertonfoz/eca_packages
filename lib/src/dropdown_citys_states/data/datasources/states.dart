import 'package:eca_packages/src/dropdown_citys_states/data/models/states.dart';

class StateGetAllDataSource {
  final _states = const [
    StateModel(id: 'AC', name: 'Acre'),
    StateModel(id: 'AL', name: 'Alagoas'),
    StateModel(id: 'AP', name: 'Amapá'),
    StateModel(id: 'AM', name: 'Amazonas'),
    StateModel(id: 'BA', name: 'Bahia'),
    StateModel(id: 'CE', name: 'Ceará'),
    StateModel(id: 'DF', name: 'Distrito Federal'),
    StateModel(id: 'ES', name: 'Espírito Santo'),
    StateModel(id: 'GO', name: 'Goias'),
    StateModel(id: 'MA', name: 'Maranhão'),
    StateModel(id: 'MT', name: 'Mato Grosso'),
    StateModel(id: 'MS', name: 'Mato Grosso do Sul'),
    StateModel(id: 'MG', name: 'Minas Gerais'), //
    StateModel(id: 'PA', name: 'Pará'),
    StateModel(id: 'PB', name: 'Paraíba'),
    StateModel(id: 'PR', name: 'Paraná'),
    StateModel(id: 'PE', name: 'Pernambuco'),
    StateModel(id: 'PI', name: 'Piauí'),
    StateModel(id: 'RJ', name: 'Rio de Janeiro'),
    StateModel(id: 'RN', name: 'Rio Grande do Norte'),
    StateModel(id: 'RS', name: 'Rio Grande do Sul'),
    StateModel(id: 'RO', name: 'Rondônia'),
    StateModel(id: 'RR', name: 'Roraima'),
    StateModel(id: 'SC', name: 'Santa Catarina'),
    StateModel(id: 'SP', name: 'São Paulo'), //
    StateModel(id: 'SE', name: 'Sergipe'),
    StateModel(id: 'TO', name: 'Tocantins'),
  ];

  //TODO, realizar um sort, independente da ordem estar correta
  Future<List<StateModel>> getAll() async {
    return Future.value(_states);
  }

//TODO Separar em arquivos no padrão
  Future<StateModel> getByName({required String name}) {
    var state = _states.where((element) => element.name == name).first;
    return Future.value(state);
  }
}
