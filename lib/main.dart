// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/Background/base.dart';
import 'package:pos/Page/app.dart';
import 'package:pos/app_bloc_observer.dart';

void main() {
  
  Bloc.observer = const AppBlocObserver();
  runApp(const App());
  startBackgroundTask();
}

  
void startBackgroundTask() {
  RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
  Isolate.spawn(_isolateMain, rootIsolateToken);
}
Future<void> _isolateMain(RootIsolateToken rootIsolateToken) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

  const Duration interval = Duration(seconds: 10);
  Timer.periodic(interval, (Timer timer) async {
    await TasksBackground().task1();      
  });
}







