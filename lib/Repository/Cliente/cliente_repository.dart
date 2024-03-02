import 'package:drift/drift.dart';
import 'package:pos/Database/Context/app_db.dart';
import 'package:pos/Database/Tables/cliente.dart';
import 'package:pos/Repository/base_repository.dart';

class ClientesRepository extends BaseRepository<Cliente, ClienteData> {
  ClientesRepository(AppDb db) : super(db, db.cliente);

  // Método específico para buscar un cliente por su ID
  Future<ClienteData?> get(Expression<bool> Function(Cliente) expression) async {
    //expression (Cliente table) => table.id.equals(id);
    return await firstOrDefaultAsync(expression);
  }

  // Método para obtener todos los Clientes
  Future<List<ClienteData>> getAll(Expression<bool> Function(Cliente)? expression) async {
    return await getAllAsync(expression);
  }

  // Método para insertar un nuevo cliente
  Future<int> insert(ClienteData cliente) async {
    return await insertAsync(cliente);
  }

  // Método para actualizar un cliente
  Future update(String id, ClienteData cliente) async {
    try {
      await updateAsync((Cliente table) => table.id.equals(cliente.id), cliente);
    } catch (e) {
      throw Exception("Error al actualizar");
    }

    /*
      
      expression (Cliente table) => table.id.equals(id);
      var obj = await firstOrDefaultAsync(expression);
      if(obj != null) {
        obj.copyWith(
          nombre: Value(cliente.nombre),
          apellido : Value(cliente.apellido),
          razonSocial: Value(cliente.razonSocial),
          tipoIdentificacion: Value(cliente.tipoIdentificacion),
          direccion: Value(cliente.direccion),          
          email: Value(cliente.email),
          telefono: Value(cliente.telefono),
          enabled: Value(cliente.enabled),
          updateAt: Value(DateTime.now()),
          updateById: Value(cliente.updateById),
          synchronized:Value(cliente.synchronized)
          );
             
        await updateAsync((Cliente table) => table.id.equals(obj.id), obj);
      } else {
        throw Exception("El registro no existe");
      }*/
  }

  // Método para eliminar un cliente por su ID
  Future delete(Expression<bool> Function(Cliente) expression) async {
    //expression (Cliente table) => table.id.equals(id);
    var obj = await firstOrDefaultAsync(expression);
    if(obj != null)
    {
        obj.copyWith(
          deleted: const Value(true),
          deleteAt: Value(DateTime.now())
        );
         await updateAsync((Cliente table) => table.id.equals(obj.id), obj);
    }
    else {
        throw Exception("El registro no existe");
    }
        
  }


}
