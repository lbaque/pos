import 'package:pos/Page/Cliente/Bloc/cliente_model.dart';

abstract class ClientesState {}

class ClientesInitialState extends ClientesState {}

class ClientesLoadingState extends ClientesState {}

class ClientesLoadedState extends ClientesState {
  final List<ClienteDTO> clientes;

  ClientesLoadedState(this.clientes);
}

class ClienteFromApiLoadedState extends ClientesState {
  final ClienteDTO cliente;

  ClienteFromApiLoadedState(this.cliente);
}

class ClientesErrorState extends ClientesState {

  final error;

  ClientesErrorState(this.error);
}

class ClienteNombres extends ClientesState {}
class ClienteRazonSocial extends ClientesState {}