import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:pos/Database/Context/app_db.dart';
import 'package:pos/Database/Tables/cliente.dart';
import 'package:pos/Helpers/services_route.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_model.dart';
import 'package:pos/Repository/Cliente/cliente_repository.dart';

class TasksBackground { 
  
  final ClientesRepository _repository;

  TasksBackground() : _repository = ClientesRepository(AppDb());


  Future<void> task1() async {
  final headers = {'Content-Type': 'application/json'};
    var data = await _repository.getAll((Cliente table) => table.synchronized.equals(false));
    for (var element in data) {
        
        try {
          ClienteDTO cliente = ClienteDTO(identificacion: element.id,companiaId: element.companiaId, nombre: element.nombre,apellido: element.apellido, razonSocial: element.razonSocial, tipoIdentificacionId: element.tipoIdentificacion, direccion: element.direccion, email: element.email,telefono: element.telefono, enabled: true);

          var response = await http.get(Uri.parse(ClienteServicesRoute.findId(element.id)), headers: headers);
          var exist = ClienteDTO.fromJson(jsonDecode(response.body));
          if (exist != null) {          
            var rput = await http.put(Uri.parse(ClienteServicesRoute.findId(element.id)),headers: headers, body: jsonEncode(cliente.toJson()) );
            if(rput.statusCode == 204){
              await _repository.update(element.id, element.copyWith(synchronized: const Value(true)));
            }
          }
          else{
            var rpost = await http.post(Uri.parse(ClienteServicesRoute.find), headers: headers, body: jsonEncode(cliente.toJson()));
            if(rpost.statusCode == 201){
              await _repository.update(element.id, element.copyWith(synchronized: const Value(true)));
            }
          }
        } catch (e) {
          print(e.toString());
        }
             
      }
    }
    

}
