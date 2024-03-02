import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/Helpers/Const/entidad_const.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_bloc.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_event.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_model.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_state.dart';

class ClienteDialog extends StatefulWidget {
  final ClienteDTO? cliente; // Cliente a editar (opcional)
  final Function(ClienteDTO) onSubmit;

  const ClienteDialog({
    Key? key,
    this.cliente,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<ClienteDialog> createState() => _ClienteDialogState();
}

class _ClienteDialogState extends State<ClienteDialog> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _tipoIdentificacionController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _razonSocialController = TextEditingController();
  final _direccionController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _companiaId = "3FA85F64-5717-4562-B3FC-2C963F66AFA6";
  
  @override
  void initState() {
    super.initState();
    if (widget.cliente != null) {
      // Si se está editando un cliente, pre-rellenar los campos del formulario
      _idController.text = widget.cliente!.identificacion;
      _tipoIdentificacionController.text = widget.cliente!.tipoIdentificacionId ?? "";
      _nombreController.text = widget.cliente!.nombre ?? "";
      _apellidoController.text = widget.cliente!.apellido ?? "";
      _razonSocialController.text = widget.cliente!.razonSocial ?? "";
      _direccionController.text = widget.cliente!.direccion ?? "";
      _emailController.text = widget.cliente!.email ?? "";
      _telefonoController.text = widget.cliente!.telefono  ?? "";
    }
    else {
      _tipoIdentificacionController.text = "04";
      context.read<ClienteBloc>().add(ChangeTipoIdentificacionEvent(_tipoIdentificacionController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClienteBloc, ClientesState>(
      builder: (context, state) {
        

        final List<Widget> children = [];
        if (state is ClienteFromApiLoadedState)
        {          
          _idController.text = state.cliente.identificacion;
          _nombreController.text = state.cliente.nombre ?? "";
          _apellidoController.text = state.cliente.apellido ?? "";
          _razonSocialController.text = state.cliente.razonSocial ?? "";
          _direccionController.text = state.cliente.direccion ?? "";
          _emailController.text = state.cliente.email ?? "";
          _telefonoController.text = state.cliente.telefono ?? "";
        }
        

        children.addAll([
          DropdownButtonFormField(
              value: _tipoIdentificacionController.text,
              items: EntidadConst.ipoIdentificacion().map((entry) {
                return DropdownMenuItem(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(), 
              onChanged: (value) {
                _tipoIdentificacionController.text = value as String;
                context.read<ClienteBloc>().add(ChangeTipoIdentificacionEvent(value));
              }
              ),
            TextFormField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'Identificacion'),
              onChanged: (value){
                if(_tipoIdentificacionController.text == "04" && value.length == 13){
                  context.read<ClienteBloc>().add(ApiFindClientEvent(value));
                }
                if(_tipoIdentificacionController.text == "05" && value.length == 10){
                   context.read<ClienteBloc>().add(ApiFindClientEvent(value));
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Identificacion es obligatorio';
                }               
                return null;
              },
            ),
        ]); 
        if (state is ClienteNombres || _tipoIdentificacionController.text == "05")
        {
            children.addAll([
              TextFormField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Nombre es obligatorio';
                }
                return null;
              },
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(labelText: 'Apellido'),
                validator: (value) {
                if (value!.isEmpty) {
                  return 'Apellido es obligatorio';
                }
                return null;
              },
              )
            ]);
        }
        if (state is ClienteRazonSocial || _tipoIdentificacionController.text == "04"){
          children.add(
            TextFormField(
              controller: _razonSocialController,
              decoration: const InputDecoration(labelText: 'Razon Social'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Razon Social es obligatorio';
                }
                return null;
              },
            )
          );
        }
        children.addAll([
          TextFormField(
              controller: _direccionController,
              decoration: const InputDecoration(labelText: 'Direccion'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'El Direccion es obligatorio';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty == false) {
                  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                    return 'El email no es válido';
                  }
                }
                return null;
              },
            ),
            TextFormField(
              controller: _telefonoController,
              decoration: const InputDecoration(labelText: 'Telefono'),
              keyboardType: TextInputType.phone
              
            )
        ]);
        return AlertDialog(
          title: Text(widget.cliente != null ? 'Editar Cliente' : 'Crear Cliente'),
          content: Form(
          key: _formKey,
          child: SingleChildScrollView(child: Column(
            mainAxisSize: MainAxisSize.min,
            children:children
          ),
      )),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child:  const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Crea un nuevo cliente con los datos del formulario
              final cliente = ClienteDTO(
                identificacion: _idController.text,
                companiaId: _companiaId,
                nombre: _nombreController.text,
                tipoIdentificacionId: _tipoIdentificacionController.text,
                apellido: _apellidoController.text,
                razonSocial: _razonSocialController.text,
                direccion: _direccionController.text,
                email: _emailController.text,
                telefono: _telefonoController.text,
                enabled: true  
              );
              // Llama a la función onSubmit con el nuevo cliente
              widget.onSubmit(cliente);
              // Cierra el diálogo
              Navigator.of(context).pop();
            }
          },
          child: const Text('Guardar'),
        ),
      ],
    );
      },
    );
  }
}