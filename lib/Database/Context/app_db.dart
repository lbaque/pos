import 'package:drift/drift.dart';
import 'package:pos/Database/Context/connection_db.dart';
import 'package:pos/Database/Tables/cliente.dart';
part 'app_db.g.dart'; 


@DriftDatabase(tables: [Cliente])
class AppDb extends _$AppDb {
  AppDb() : super(DbConnection.openConnection());
  
  @override 
  int get schemaVersion => 1;  
}




