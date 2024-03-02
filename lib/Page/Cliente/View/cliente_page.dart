
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_bloc.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_event.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_state.dart';
import 'package:pos/Page/Cliente/View/cliente_dialog.dart';


class ClienteView extends StatefulWidget {
  const ClienteView({super.key});

  @override
  State<ClienteView> createState() => _ClienteViewState();
}

class _ClienteViewState extends State<ClienteView> {
  @override
  void initState() {
    // Your initialization logic here
    super.initState();
    context.read<ClienteBloc>().add(FetchClientesEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Clientes'),
        ),
        body: BlocBuilder<ClienteBloc, ClientesState>(
          builder: (context, state) {
            if (state is ClientesLoadingState) {
              // Muestra un indicador de carga mientras se cargan los clientes
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ClientesLoadedState) {
              // Muestra la lista de clientes
              return ListView.builder(
                itemCount: state.clientes.length,
                itemBuilder: (context, index) {
                  final cliente = state.clientes[index];
                  return ListTile(
                    title: Text('${cliente.identificacion} ${cliente.nombre} ${cliente.apellido}'),
                    // Aquí puedes agregar más detalles o acciones para cada cliente
                  );
                },
              );
            } else if (state is ClientesErrorState) {
              // Muestra un mensaje de error en caso de que ocurra un error
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              // Muestra un mensaje por defecto si el estado es desconocido
              return const Center(
                child: Text('Estado desconocido'),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          // Abre el diálogo de creación de cliente
              showDialog(
                context: context, // Utiliza el contexto original
                builder: (cc) => BlocProvider<ClienteBloc>(
                  create: (dd) => ClienteBloc(), // Crea una instancia del Bloc
                  child: ClienteDialog(
                    onSubmit: (newCliente) {
                      context.read<ClienteBloc>().add(AddClienteEvent(newCliente));
                    },
                  ),
                ),
              );
            
          },
          tooltip: 'Cargar Clientes',
          child: const Icon(Icons.refresh),
        ),
      );
  }


}


