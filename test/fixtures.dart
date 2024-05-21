import 'dart:io';

String fixtures(String name) => File('test/$name').readAsStringSync();