// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $ClienteTable extends Cliente with TableInfo<$ClienteTable, ClienteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClienteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companiaIdMeta =
      const VerificationMeta('companiaId');
  @override
  late final GeneratedColumn<String> companiaId = GeneratedColumn<String>(
      'compania_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _apellidoMeta =
      const VerificationMeta('apellido');
  @override
  late final GeneratedColumn<String> apellido = GeneratedColumn<String>(
      'apellido', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _razonSocialMeta =
      const VerificationMeta('razonSocial');
  @override
  late final GeneratedColumn<String> razonSocial = GeneratedColumn<String>(
      'razon_social', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tipoIdentificacionMeta =
      const VerificationMeta('tipoIdentificacion');
  @override
  late final GeneratedColumn<String> tipoIdentificacion =
      GeneratedColumn<String>('tipo_identificacion', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _direccionMeta =
      const VerificationMeta('direccion');
  @override
  late final GeneratedColumn<String> direccion = GeneratedColumn<String>(
      'direccion', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _telefonoMeta =
      const VerificationMeta('telefono');
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
      'telefono', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedMeta =
      const VerificationMeta('deleted');
  @override
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
      'deleted', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("deleted" IN (0, 1))'));
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
      'enabled', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("enabled" IN (0, 1))'));
  static const VerificationMeta _deleteAtMeta =
      const VerificationMeta('deleteAt');
  @override
  late final GeneratedColumn<DateTime> deleteAt = GeneratedColumn<DateTime>(
      'delete_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deletedByIdMeta =
      const VerificationMeta('deletedById');
  @override
  late final GeneratedColumn<String> deletedById = GeneratedColumn<String>(
      'deleted_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updateAtMeta =
      const VerificationMeta('updateAt');
  @override
  late final GeneratedColumn<DateTime> updateAt = GeneratedColumn<DateTime>(
      'update_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _updateByIdMeta =
      const VerificationMeta('updateById');
  @override
  late final GeneratedColumn<String> updateById = GeneratedColumn<String>(
      'update_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _synchronizedMeta =
      const VerificationMeta('synchronized');
  @override
  late final GeneratedColumn<bool> synchronized = GeneratedColumn<bool>(
      'synchronized', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("synchronized" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companiaId,
        nombre,
        apellido,
        razonSocial,
        tipoIdentificacion,
        direccion,
        email,
        telefono,
        deleted,
        enabled,
        deleteAt,
        deletedById,
        createdAt,
        createdById,
        updateAt,
        updateById,
        synchronized
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cliente';
  @override
  VerificationContext validateIntegrity(Insertable<ClienteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('compania_id')) {
      context.handle(
          _companiaIdMeta,
          companiaId.isAcceptableOrUnknown(
              data['compania_id']!, _companiaIdMeta));
    } else if (isInserting) {
      context.missing(_companiaIdMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    }
    if (data.containsKey('apellido')) {
      context.handle(_apellidoMeta,
          apellido.isAcceptableOrUnknown(data['apellido']!, _apellidoMeta));
    }
    if (data.containsKey('razon_social')) {
      context.handle(
          _razonSocialMeta,
          razonSocial.isAcceptableOrUnknown(
              data['razon_social']!, _razonSocialMeta));
    }
    if (data.containsKey('tipo_identificacion')) {
      context.handle(
          _tipoIdentificacionMeta,
          tipoIdentificacion.isAcceptableOrUnknown(
              data['tipo_identificacion']!, _tipoIdentificacionMeta));
    }
    if (data.containsKey('direccion')) {
      context.handle(_direccionMeta,
          direccion.isAcceptableOrUnknown(data['direccion']!, _direccionMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('telefono')) {
      context.handle(_telefonoMeta,
          telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta));
    }
    if (data.containsKey('deleted')) {
      context.handle(_deletedMeta,
          deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta));
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    if (data.containsKey('delete_at')) {
      context.handle(_deleteAtMeta,
          deleteAt.isAcceptableOrUnknown(data['delete_at']!, _deleteAtMeta));
    }
    if (data.containsKey('deleted_by_id')) {
      context.handle(
          _deletedByIdMeta,
          deletedById.isAcceptableOrUnknown(
              data['deleted_by_id']!, _deletedByIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('update_at')) {
      context.handle(_updateAtMeta,
          updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta));
    }
    if (data.containsKey('update_by_id')) {
      context.handle(
          _updateByIdMeta,
          updateById.isAcceptableOrUnknown(
              data['update_by_id']!, _updateByIdMeta));
    }
    if (data.containsKey('synchronized')) {
      context.handle(
          _synchronizedMeta,
          synchronized.isAcceptableOrUnknown(
              data['synchronized']!, _synchronizedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ClienteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClienteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      companiaId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}compania_id'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre']),
      apellido: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}apellido']),
      razonSocial: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}razon_social']),
      tipoIdentificacion: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}tipo_identificacion']),
      direccion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direccion']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      telefono: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefono']),
      deleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}deleted']),
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enabled']),
      deleteAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delete_at']),
      deletedById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deleted_by_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      updateAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_at']),
      updateById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}update_by_id']),
      synchronized: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synchronized']),
    );
  }

  @override
  $ClienteTable createAlias(String alias) {
    return $ClienteTable(attachedDatabase, alias);
  }
}

class ClienteData extends DataClass implements Insertable<ClienteData> {
  final String id;
  final String companiaId;
  final String? nombre;
  final String? apellido;
  final String? razonSocial;
  final String? tipoIdentificacion;
  final String? direccion;
  final String? email;
  final String? telefono;
  final bool? deleted;
  final bool? enabled;
  final DateTime? deleteAt;
  final String? deletedById;
  final DateTime? createdAt;
  final String? createdById;
  final DateTime? updateAt;
  final String? updateById;
  final bool? synchronized;
  const ClienteData(
      {required this.id,
      required this.companiaId,
      this.nombre,
      this.apellido,
      this.razonSocial,
      this.tipoIdentificacion,
      this.direccion,
      this.email,
      this.telefono,
      this.deleted,
      this.enabled,
      this.deleteAt,
      this.deletedById,
      this.createdAt,
      this.createdById,
      this.updateAt,
      this.updateById,
      this.synchronized});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['compania_id'] = Variable<String>(companiaId);
    if (!nullToAbsent || nombre != null) {
      map['nombre'] = Variable<String>(nombre);
    }
    if (!nullToAbsent || apellido != null) {
      map['apellido'] = Variable<String>(apellido);
    }
    if (!nullToAbsent || razonSocial != null) {
      map['razon_social'] = Variable<String>(razonSocial);
    }
    if (!nullToAbsent || tipoIdentificacion != null) {
      map['tipo_identificacion'] = Variable<String>(tipoIdentificacion);
    }
    if (!nullToAbsent || direccion != null) {
      map['direccion'] = Variable<String>(direccion);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    if (!nullToAbsent || deleted != null) {
      map['deleted'] = Variable<bool>(deleted);
    }
    if (!nullToAbsent || enabled != null) {
      map['enabled'] = Variable<bool>(enabled);
    }
    if (!nullToAbsent || deleteAt != null) {
      map['delete_at'] = Variable<DateTime>(deleteAt);
    }
    if (!nullToAbsent || deletedById != null) {
      map['deleted_by_id'] = Variable<String>(deletedById);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || updateAt != null) {
      map['update_at'] = Variable<DateTime>(updateAt);
    }
    if (!nullToAbsent || updateById != null) {
      map['update_by_id'] = Variable<String>(updateById);
    }
    if (!nullToAbsent || synchronized != null) {
      map['synchronized'] = Variable<bool>(synchronized);
    }
    return map;
  }

  ClienteCompanion toCompanion(bool nullToAbsent) {
    return ClienteCompanion(
      id: Value(id),
      companiaId: Value(companiaId),
      nombre:
          nombre == null && nullToAbsent ? const Value.absent() : Value(nombre),
      apellido: apellido == null && nullToAbsent
          ? const Value.absent()
          : Value(apellido),
      razonSocial: razonSocial == null && nullToAbsent
          ? const Value.absent()
          : Value(razonSocial),
      tipoIdentificacion: tipoIdentificacion == null && nullToAbsent
          ? const Value.absent()
          : Value(tipoIdentificacion),
      direccion: direccion == null && nullToAbsent
          ? const Value.absent()
          : Value(direccion),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
      deleted: deleted == null && nullToAbsent
          ? const Value.absent()
          : Value(deleted),
      enabled: enabled == null && nullToAbsent
          ? const Value.absent()
          : Value(enabled),
      deleteAt: deleteAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deleteAt),
      deletedById: deletedById == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedById),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      updateAt: updateAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updateAt),
      updateById: updateById == null && nullToAbsent
          ? const Value.absent()
          : Value(updateById),
      synchronized: synchronized == null && nullToAbsent
          ? const Value.absent()
          : Value(synchronized),
    );
  }

  factory ClienteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClienteData(
      id: serializer.fromJson<String>(json['id']),
      companiaId: serializer.fromJson<String>(json['companiaId']),
      nombre: serializer.fromJson<String?>(json['nombre']),
      apellido: serializer.fromJson<String?>(json['apellido']),
      razonSocial: serializer.fromJson<String?>(json['razonSocial']),
      tipoIdentificacion:
          serializer.fromJson<String?>(json['tipoIdentificacion']),
      direccion: serializer.fromJson<String?>(json['direccion']),
      email: serializer.fromJson<String?>(json['email']),
      telefono: serializer.fromJson<String?>(json['telefono']),
      deleted: serializer.fromJson<bool?>(json['deleted']),
      enabled: serializer.fromJson<bool?>(json['enabled']),
      deleteAt: serializer.fromJson<DateTime?>(json['deleteAt']),
      deletedById: serializer.fromJson<String?>(json['deletedById']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      updateAt: serializer.fromJson<DateTime?>(json['updateAt']),
      updateById: serializer.fromJson<String?>(json['updateById']),
      synchronized: serializer.fromJson<bool?>(json['synchronized']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'companiaId': serializer.toJson<String>(companiaId),
      'nombre': serializer.toJson<String?>(nombre),
      'apellido': serializer.toJson<String?>(apellido),
      'razonSocial': serializer.toJson<String?>(razonSocial),
      'tipoIdentificacion': serializer.toJson<String?>(tipoIdentificacion),
      'direccion': serializer.toJson<String?>(direccion),
      'email': serializer.toJson<String?>(email),
      'telefono': serializer.toJson<String?>(telefono),
      'deleted': serializer.toJson<bool?>(deleted),
      'enabled': serializer.toJson<bool?>(enabled),
      'deleteAt': serializer.toJson<DateTime?>(deleteAt),
      'deletedById': serializer.toJson<String?>(deletedById),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'createdById': serializer.toJson<String?>(createdById),
      'updateAt': serializer.toJson<DateTime?>(updateAt),
      'updateById': serializer.toJson<String?>(updateById),
      'synchronized': serializer.toJson<bool?>(synchronized),
    };
  }

  ClienteData copyWith(
          {String? id,
          String? companiaId,
          Value<String?> nombre = const Value.absent(),
          Value<String?> apellido = const Value.absent(),
          Value<String?> razonSocial = const Value.absent(),
          Value<String?> tipoIdentificacion = const Value.absent(),
          Value<String?> direccion = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> telefono = const Value.absent(),
          Value<bool?> deleted = const Value.absent(),
          Value<bool?> enabled = const Value.absent(),
          Value<DateTime?> deleteAt = const Value.absent(),
          Value<String?> deletedById = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> updateAt = const Value.absent(),
          Value<String?> updateById = const Value.absent(),
          Value<bool?> synchronized = const Value.absent()}) =>
      ClienteData(
        id: id ?? this.id,
        companiaId: companiaId ?? this.companiaId,
        nombre: nombre.present ? nombre.value : this.nombre,
        apellido: apellido.present ? apellido.value : this.apellido,
        razonSocial: razonSocial.present ? razonSocial.value : this.razonSocial,
        tipoIdentificacion: tipoIdentificacion.present
            ? tipoIdentificacion.value
            : this.tipoIdentificacion,
        direccion: direccion.present ? direccion.value : this.direccion,
        email: email.present ? email.value : this.email,
        telefono: telefono.present ? telefono.value : this.telefono,
        deleted: deleted.present ? deleted.value : this.deleted,
        enabled: enabled.present ? enabled.value : this.enabled,
        deleteAt: deleteAt.present ? deleteAt.value : this.deleteAt,
        deletedById: deletedById.present ? deletedById.value : this.deletedById,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        createdById: createdById.present ? createdById.value : this.createdById,
        updateAt: updateAt.present ? updateAt.value : this.updateAt,
        updateById: updateById.present ? updateById.value : this.updateById,
        synchronized:
            synchronized.present ? synchronized.value : this.synchronized,
      );
  @override
  String toString() {
    return (StringBuffer('ClienteData(')
          ..write('id: $id, ')
          ..write('companiaId: $companiaId, ')
          ..write('nombre: $nombre, ')
          ..write('apellido: $apellido, ')
          ..write('razonSocial: $razonSocial, ')
          ..write('tipoIdentificacion: $tipoIdentificacion, ')
          ..write('direccion: $direccion, ')
          ..write('email: $email, ')
          ..write('telefono: $telefono, ')
          ..write('deleted: $deleted, ')
          ..write('enabled: $enabled, ')
          ..write('deleteAt: $deleteAt, ')
          ..write('deletedById: $deletedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdById: $createdById, ')
          ..write('updateAt: $updateAt, ')
          ..write('updateById: $updateById, ')
          ..write('synchronized: $synchronized')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      companiaId,
      nombre,
      apellido,
      razonSocial,
      tipoIdentificacion,
      direccion,
      email,
      telefono,
      deleted,
      enabled,
      deleteAt,
      deletedById,
      createdAt,
      createdById,
      updateAt,
      updateById,
      synchronized);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClienteData &&
          other.id == this.id &&
          other.companiaId == this.companiaId &&
          other.nombre == this.nombre &&
          other.apellido == this.apellido &&
          other.razonSocial == this.razonSocial &&
          other.tipoIdentificacion == this.tipoIdentificacion &&
          other.direccion == this.direccion &&
          other.email == this.email &&
          other.telefono == this.telefono &&
          other.deleted == this.deleted &&
          other.enabled == this.enabled &&
          other.deleteAt == this.deleteAt &&
          other.deletedById == this.deletedById &&
          other.createdAt == this.createdAt &&
          other.createdById == this.createdById &&
          other.updateAt == this.updateAt &&
          other.updateById == this.updateById &&
          other.synchronized == this.synchronized);
}

class ClienteCompanion extends UpdateCompanion<ClienteData> {
  final Value<String> id;
  final Value<String> companiaId;
  final Value<String?> nombre;
  final Value<String?> apellido;
  final Value<String?> razonSocial;
  final Value<String?> tipoIdentificacion;
  final Value<String?> direccion;
  final Value<String?> email;
  final Value<String?> telefono;
  final Value<bool?> deleted;
  final Value<bool?> enabled;
  final Value<DateTime?> deleteAt;
  final Value<String?> deletedById;
  final Value<DateTime?> createdAt;
  final Value<String?> createdById;
  final Value<DateTime?> updateAt;
  final Value<String?> updateById;
  final Value<bool?> synchronized;
  final Value<int> rowid;
  const ClienteCompanion({
    this.id = const Value.absent(),
    this.companiaId = const Value.absent(),
    this.nombre = const Value.absent(),
    this.apellido = const Value.absent(),
    this.razonSocial = const Value.absent(),
    this.tipoIdentificacion = const Value.absent(),
    this.direccion = const Value.absent(),
    this.email = const Value.absent(),
    this.telefono = const Value.absent(),
    this.deleted = const Value.absent(),
    this.enabled = const Value.absent(),
    this.deleteAt = const Value.absent(),
    this.deletedById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.updateById = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClienteCompanion.insert({
    required String id,
    required String companiaId,
    this.nombre = const Value.absent(),
    this.apellido = const Value.absent(),
    this.razonSocial = const Value.absent(),
    this.tipoIdentificacion = const Value.absent(),
    this.direccion = const Value.absent(),
    this.email = const Value.absent(),
    this.telefono = const Value.absent(),
    this.deleted = const Value.absent(),
    this.enabled = const Value.absent(),
    this.deleteAt = const Value.absent(),
    this.deletedById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.updateAt = const Value.absent(),
    this.updateById = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        companiaId = Value(companiaId);
  static Insertable<ClienteData> custom({
    Expression<String>? id,
    Expression<String>? companiaId,
    Expression<String>? nombre,
    Expression<String>? apellido,
    Expression<String>? razonSocial,
    Expression<String>? tipoIdentificacion,
    Expression<String>? direccion,
    Expression<String>? email,
    Expression<String>? telefono,
    Expression<bool>? deleted,
    Expression<bool>? enabled,
    Expression<DateTime>? deleteAt,
    Expression<String>? deletedById,
    Expression<DateTime>? createdAt,
    Expression<String>? createdById,
    Expression<DateTime>? updateAt,
    Expression<String>? updateById,
    Expression<bool>? synchronized,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companiaId != null) 'compania_id': companiaId,
      if (nombre != null) 'nombre': nombre,
      if (apellido != null) 'apellido': apellido,
      if (razonSocial != null) 'razon_social': razonSocial,
      if (tipoIdentificacion != null) 'tipo_identificacion': tipoIdentificacion,
      if (direccion != null) 'direccion': direccion,
      if (email != null) 'email': email,
      if (telefono != null) 'telefono': telefono,
      if (deleted != null) 'deleted': deleted,
      if (enabled != null) 'enabled': enabled,
      if (deleteAt != null) 'delete_at': deleteAt,
      if (deletedById != null) 'deleted_by_id': deletedById,
      if (createdAt != null) 'created_at': createdAt,
      if (createdById != null) 'created_by_id': createdById,
      if (updateAt != null) 'update_at': updateAt,
      if (updateById != null) 'update_by_id': updateById,
      if (synchronized != null) 'synchronized': synchronized,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClienteCompanion copyWith(
      {Value<String>? id,
      Value<String>? companiaId,
      Value<String?>? nombre,
      Value<String?>? apellido,
      Value<String?>? razonSocial,
      Value<String?>? tipoIdentificacion,
      Value<String?>? direccion,
      Value<String?>? email,
      Value<String?>? telefono,
      Value<bool?>? deleted,
      Value<bool?>? enabled,
      Value<DateTime?>? deleteAt,
      Value<String?>? deletedById,
      Value<DateTime?>? createdAt,
      Value<String?>? createdById,
      Value<DateTime?>? updateAt,
      Value<String?>? updateById,
      Value<bool?>? synchronized,
      Value<int>? rowid}) {
    return ClienteCompanion(
      id: id ?? this.id,
      companiaId: companiaId ?? this.companiaId,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      razonSocial: razonSocial ?? this.razonSocial,
      tipoIdentificacion: tipoIdentificacion ?? this.tipoIdentificacion,
      direccion: direccion ?? this.direccion,
      email: email ?? this.email,
      telefono: telefono ?? this.telefono,
      deleted: deleted ?? this.deleted,
      enabled: enabled ?? this.enabled,
      deleteAt: deleteAt ?? this.deleteAt,
      deletedById: deletedById ?? this.deletedById,
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById ?? this.createdById,
      updateAt: updateAt ?? this.updateAt,
      updateById: updateById ?? this.updateById,
      synchronized: synchronized ?? this.synchronized,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (companiaId.present) {
      map['compania_id'] = Variable<String>(companiaId.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (apellido.present) {
      map['apellido'] = Variable<String>(apellido.value);
    }
    if (razonSocial.present) {
      map['razon_social'] = Variable<String>(razonSocial.value);
    }
    if (tipoIdentificacion.present) {
      map['tipo_identificacion'] = Variable<String>(tipoIdentificacion.value);
    }
    if (direccion.present) {
      map['direccion'] = Variable<String>(direccion.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (deleteAt.present) {
      map['delete_at'] = Variable<DateTime>(deleteAt.value);
    }
    if (deletedById.present) {
      map['deleted_by_id'] = Variable<String>(deletedById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    if (updateById.present) {
      map['update_by_id'] = Variable<String>(updateById.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<bool>(synchronized.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClienteCompanion(')
          ..write('id: $id, ')
          ..write('companiaId: $companiaId, ')
          ..write('nombre: $nombre, ')
          ..write('apellido: $apellido, ')
          ..write('razonSocial: $razonSocial, ')
          ..write('tipoIdentificacion: $tipoIdentificacion, ')
          ..write('direccion: $direccion, ')
          ..write('email: $email, ')
          ..write('telefono: $telefono, ')
          ..write('deleted: $deleted, ')
          ..write('enabled: $enabled, ')
          ..write('deleteAt: $deleteAt, ')
          ..write('deletedById: $deletedById, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdById: $createdById, ')
          ..write('updateAt: $updateAt, ')
          ..write('updateById: $updateById, ')
          ..write('synchronized: $synchronized, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $ClienteTable cliente = $ClienteTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cliente];
}
