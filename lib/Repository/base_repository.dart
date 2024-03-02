// repositories/Base_repository.dart
import 'package:drift/drift.dart';
import 'package:pos/Database/Context/app_db.dart';

class BaseRepository<T extends Table, D extends DataClass> {
  final TableInfo<T, D> table;
  AppDb db;

  BaseRepository(this.db, this.table);


  Future<List<D>> getAllAsync(Expression<bool> Function(T)? expression) async {
  final Future<List<D>> query;
  
  if (expression == null) {
    query = db.select(table).get();
  } else {
    query = (db.select(table)..where(expression)).get();
  }

  return query;
}


  // Método para obtener un registro por ID
  Future<D?> firstOrDefaultAsync(Expression<bool> Function(T) expression) async {
    return await (db.select(table)..where(expression)).getSingleOrNull();
  }

  // Método para insertar un nuevo registro
  Future<int> insertAsync(Insertable<D> data) async {
    var datdeta =  await db.into(table).insert(data);
    return datdeta;
  }

  // Método para actualizar un registro
  Future updateAsync(Expression<bool> Function(T) expression,Insertable<D> data) async {
   return await (db.update(table)..where(expression))
          .write(data);
  }

  /*// Método para eliminar un registro por ID
  Future<int> deleteAsync(Expression<bool> Function(T) expression) async {
    return await (db.delete(table)..where(expression)).go();
  }

  // Método para eliminar todos los registros
  Future<int> deleteAll() async {
    return await db.delete(table).go();
  }*/
}