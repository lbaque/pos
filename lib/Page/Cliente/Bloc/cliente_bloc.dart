import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/Database/Context/app_db.dart';
import 'package:pos/Database/Tables/cliente.dart';
import 'package:pos/Helpers/services_route.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_event.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_model.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_state.dart';
import 'package:pos/Repository/Cliente/cliente_repository.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;


class ClienteBloc extends Bloc<ClientesEvent, ClientesState> {
  
  final ClientesRepository _repository;
  final _companiaId = "3FA85F64-5717-4562-B3FC-2C963F66AFA6";
  ClienteBloc() : _repository = ClientesRepository(AppDb()) , super(ClientesInitialState())
  {

    on<FetchClientesEvent>((event, emit) async {
      await _mapFetchClientesEventToState(emit);
    });
    on<AddClienteEvent>((event, emit) async {
      await _mapAddClienteEventToState(event.cliente,emit);
    });
    on<UpdateClienteEvent>((event, emit) async {
      await _mapUpdateClienteEventToState(event.cliente,emit);
    });
    on<DeleteClienteEvent>((event, emit) async {
      await _mapDeleteClienteEventToState(event.cliente,emit);
    });

    on<ChangeTipoIdentificacionEvent>((event, emit) {
      _mapTipoIdentificacionClienteEventToState(event.tipoIdentificacion,emit);
    });
    
    on<ApiFindClientEvent>((event, emit) async {
      await _mapApiFindClientEventToState(event.identificacion,emit);
    });
  }


  _mapFetchClientesEventToState(Function(ClientesState) emit) async {
    emit(ClientesLoadingState());
    try {
      List<ClienteDTO>clientes = await _fetchClientesFromDatabase();
      emit(ClientesLoadedState(clientes));
    } catch (e) {
      emit(ClientesErrorState("Error al cargar los clientes: $e"));
    }
  }

  _mapAddClienteEventToState(ClienteDTO cliente, Function(ClientesState) emit) async {
    emit(ClientesLoadingState());
    try {
      await _addClienteToDatabase(cliente);
      emit(ClientesLoadedState(await _fetchClientesFromDatabase()));
    } catch (e) {
      emit(ClientesErrorState("Error al añadir el cliente: $e")) ;
    }
  }

  _mapUpdateClienteEventToState(ClienteDTO cliente, Function(ClientesState) emit) async {
    emit(ClientesLoadingState());
    try {
      await _updateClienteInDatabase(cliente);
      emit(ClientesLoadedState(await _fetchClientesFromDatabase()));
    } catch (e) {
      emit(ClientesErrorState("Error al actualizar el cliente: $e"));
    }
  }

  _mapDeleteClienteEventToState(ClienteDTO cliente, Function(ClientesState) emit) async {
    emit(ClientesLoadingState());
    try {
      await _deleteClienteFromDatabase(cliente);
      emit(ClientesLoadedState(await _fetchClientesFromDatabase()));
    } catch (e) {
      emit(ClientesErrorState("Error al eliminar el cliente: $e"));
    }
  }

  _mapTipoIdentificacionClienteEventToState(String tipoIdentificacion, Function(ClientesState) emit) {
    if(tipoIdentificacion == "05") {
      emit(ClienteNombres());
    } else {
      emit(ClienteRazonSocial());
    }
  }

  _mapApiFindClientEventToState(String identificacion, Function(ClientesState) emit) async {
    try {  
      ClienteDTO cliente = await _fetchClientesFromApi(identificacion);
      emit(ClienteFromApiLoadedState(cliente));
    } catch (e) 
    {
      //emit(ClientesErrorState("Error al añadir el cliente: $e")) ;
    }
  }

  // Métodos para interactuar con la fuente de datos (simulados en este ejemplo)
  Future<List<ClienteDTO>> _fetchClientesFromDatabase() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulamos una demora de 1 segundo
    var data = await _repository.getAll((Cliente table) => table.deleted.equals(false));
    List<ClienteDTO> response = []; 
    for (var element in data) {  
      response.add(
        ClienteDTO(
          identificacion: element.id,
          companiaId: element.companiaId, 
          nombre: element.nombre, 
          apellido: element.apellido, 
          razonSocial: element.razonSocial,
          tipoIdentificacionId: element.tipoIdentificacion,
          direccion: element.direccion, 
          email: element.email, 
          telefono: element.telefono,
          enabled: element.enabled));
      }
    return response;
    
  }

  Future<void> _addClienteToDatabase(ClienteDTO cliente) async {
    await _repository.insertAsync(
      ClienteData(
        id: cliente.identificacion,
        companiaId: cliente.companiaId ?? "",
        tipoIdentificacion: cliente.tipoIdentificacionId,
        nombre: cliente.nombre,
        apellido: cliente.apellido,
        razonSocial: cliente.razonSocial,
        direccion: cliente.direccion,
        telefono: cliente.telefono,
        email: cliente.email,
        deleted: false,
        enabled: true,
        createdAt: DateTime.now(),
        createdById: const Uuid().v1(),
        synchronized: false
        )
      );
  }

  Future<void> _updateClienteInDatabase(ClienteDTO cliente) async {

    await _repository.update(
      cliente.identificacion,
      ClienteData(id: cliente.identificacion, companiaId: cliente.companiaId ?? "",nombre: cliente.nombre,apellido: cliente.apellido,razonSocial: cliente.razonSocial,tipoIdentificacion: cliente.tipoIdentificacionId,direccion: cliente.direccion,email: cliente.email, telefono: cliente.telefono )
      );
  }

  Future<void> _deleteClienteFromDatabase(ClienteDTO cliente) async {
    // Simulamos una operación asincrónica de eliminar un cliente de una base de datos
    await Future.delayed(const Duration(seconds: 1)); // Simulamos una demora de 1 segundo
    // En una aplicación real, aquí se eliminaría el cliente de la base de datos
  }
  
  Future<ClienteDTO> _fetchClientesFromApi(String identificacion) async {
    final response = await http.get(
        Uri.parse(ClienteServicesRoute.findId(identificacion)).replace(queryParameters: { 'companiaId': _companiaId }),
        headers: {
          'Content-Type': 'application/json', // Establecer el tipo de medio JSON
        },
        
      );

      if (response.statusCode == 200) { 
        ClienteDTO clienteDTO = ClienteDTO.fromJson(jsonDecode(response.body));    
        return clienteDTO;
      } else {
        throw(response.body);
      }
      
  }
  
  
}


