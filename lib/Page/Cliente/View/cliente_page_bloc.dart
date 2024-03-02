import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/Page/Cliente/Bloc/cliente_bloc.dart';
import 'package:pos/Page/Cliente/View/cliente_page.dart';

class ClientePage extends StatelessWidget {
  const ClientePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClienteBloc(),
      child: const ClienteView(),
    );
  }
}