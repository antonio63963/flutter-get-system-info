import 'package:flutter/material.dart';
import 'dart:io';
import "package:system_info/system_info.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _platform;
  late String _totalPhisicalMemory;
  late String _freePhisicalMemory;
  late String _totalVirtualMemory;
  late String _freeVirtualMemory;

  String getPlatform() {
    if (Platform.isAndroid) {
      return 'Android';
    }
    if (Platform.isFuchsia) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'Android';
    } else if (Platform.isLinux) {
      return 'Android';
    } else if (Platform.isMacOS) {
      return 'Android';
    } else if (Platform.isWindows) {
      return 'Android';
    } else {
      return 'Platform is undefined';
    }
  }

  @override
  void initState() {
    super.initState();
    _platform = getPlatform();

    _totalPhisicalMemory = '${SysInfo.getTotalPhysicalMemory()} MB';
    _freePhisicalMemory = '${SysInfo.getFreePhysicalMemory()} MB';
    _totalVirtualMemory = '${SysInfo.getTotalVirtualMemory()} MB';
    _freeVirtualMemory = '${SysInfo.getFreeVirtualMemory()} MB';
    _totalVirtualMemory = '${SysInfo.getVirtualMemorySize()} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _titleBuilder('Platform'),
              Text(_platform),
              const SizedBox(height: 15),
              const Divider(height: 2),
              _titleBuilder('Phisical Memory'),
              _rowInfoBuilder(label: 'Total', value: _totalPhisicalMemory),
              _rowInfoBuilder(label: 'Free', value: _freeVirtualMemory),
              const SizedBox(height: 15),
              const Divider(height: 2),
              _titleBuilder('Virtual memory'),
              _rowInfoBuilder(label: 'Total', value: _totalVirtualMemory),
              _rowInfoBuilder(label: 'Free', value: _freeVirtualMemory),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _titleBuilder(String title) {
  return Column(
    children: [
      const SizedBox(height: 15),
      Text(
        title,
        style: TextStyle(
          color: Colors.blueGrey.shade300,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 15),
    ],
  );
}

Widget _rowInfoBuilder({label, value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(label, style: TextStyle(color: Colors.blueGrey.shade900)),
      const SizedBox(width: 15),
      Text(value, style: const TextStyle(color: Colors.blueGrey)),
      const SizedBox(height: 20),
    ],
  );
}
