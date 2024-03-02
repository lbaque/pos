import 'package:drift/drift.dart';

class Cliente extends Table {
  TextColumn get id => text()();
  TextColumn get companiaId => text()();
  TextColumn get nombre => text().nullable()();
  TextColumn get apellido => text().nullable()();
  TextColumn get razonSocial => text().nullable()(); 
  TextColumn get tipoIdentificacion => text().nullable()();
  TextColumn get direccion => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get telefono => text().nullable()();  
  BoolColumn get deleted => boolean().nullable()();
  BoolColumn get enabled => boolean().nullable()();
  DateTimeColumn get deleteAt => dateTime().nullable()();
  TextColumn get deletedById => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get createdById => text().nullable()(); 
  DateTimeColumn get updateAt => dateTime().nullable()();
  TextColumn get updateById => text().nullable()();
  BoolColumn get synchronized => boolean().nullable()();
}