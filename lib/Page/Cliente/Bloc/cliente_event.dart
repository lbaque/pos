import 'package:pos/Page/Cliente/Bloc/cliente_model.dart';

abstract class ClientesEvent {}

class FetchClientesEvent extends ClientesEvent {} // Evento para cargar los clientes

class AddClienteEvent extends ClientesEvent {
  final ClienteDTO cliente;

  AddClienteEvent(this.cliente); // Evento para añadir un cliente
}

class UpdateClienteEvent extends ClientesEvent {
  final ClienteDTO cliente;

  UpdateClienteEvent(this.cliente); // Evento para actualizar un cliente
}

class DeleteClienteEvent extends ClientesEvent {
  final ClienteDTO cliente;

  DeleteClienteEvent(this.cliente); // Evento para eliminar un cliente
}

class ChangeTipoIdentificacionEvent extends ClientesEvent {
  final String tipoIdentificacion;

  ChangeTipoIdentificacionEvent(this.tipoIdentificacion);
} // Evento para cargar los clientes

class ApiFindClientEvent extends ClientesEvent {
  final String identificacion;

  ApiFindClientEvent(this.identificacion);
} // Evento para cargar los clientes
