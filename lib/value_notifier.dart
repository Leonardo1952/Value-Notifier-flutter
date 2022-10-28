import 'package:flutter/material.dart';
import 'package:value_notifier/personagem.dart';

final counterNotifier = ValueNotifier<int>(0);
final darkNotifier = ValueNotifier<bool>(false);
final personagemNotifier = ValueNotifier<Personagem>(const Personagem());
