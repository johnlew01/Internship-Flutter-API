// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer' as logDev;
import 'main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url1 =
      "http://192.168.1.24:4090/api/v1/query?query=jvm_memory_used_bytes";

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    http.Response response1 = await http.get(Uri.parse(url1));

    if (response1.statusCode == 200) {
      String data1 = response1.body;
      final parsedJSON1 = json.decode(data1);

      final results1 = APIResponse.fromJSON(parsedJSON1);

      setState(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MyFirstPage(apiResponse: results1)),
            (route) => false);
      });
    } else {
      logDev.log("Error", name: "THE LOG");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.amber,
        body: Center(child: CircularProgressIndicator(color: Colors.blueGrey)));
  }
}

// ignore: must_be_immutable
class MyFirstPage extends StatefulWidget {
  const MyFirstPage({Key? key, required this.apiResponse}) : super(key: key);
  final APIResponse apiResponse;

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  late List<Result> _heap_G1EdenSpace;
  late List<Result> _heap_oldGen;
  late List<Result> _heap_G1SurvivorSpace;
  late List<Result> _nonHeap_NonMethods;
  late List<Result> _nonHeap_NonProfiledMethods;
  late List<Result> _nonHeap_ProfiledMethods;
  late List<Result> _nonHeap_CompressedClassSpace;
  late List<Result> _nonHeap_Metaspace;
  List<Result> _GC_Memory_Allocated_Bytes = [];
  late TooltipBehavior _tooltipBehavior;
  _MyHomePageState homepage = _MyHomePageState();
  @override
  void initState() {
    _heap_G1EdenSpace = getHeap_G1EdenSpaceData();
    _heap_oldGen = getHeap_OldGenData();
    _heap_G1SurvivorSpace = getHeap_G1SurvivorSpaceData();
    _nonHeap_NonMethods = getNonHeap_NonMethodsData();
    _nonHeap_NonProfiledMethods = getNonHeap_NonProfiledMethodsData();
    _nonHeap_ProfiledMethods = getNonHeap_ProfiledMethodsData();
    _nonHeap_CompressedClassSpace = getNonHeap_CompressedClassSpaceData();
    _nonHeap_Metaspace = getNonHeap_MetaSpaceData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  List<Result> getHeap_G1EdenSpaceData() {
    final List<Result> heap_G1EdenSpace = [
      Result(
          metric: widget.apiResponse.data.result[0].metric,
          value: widget.apiResponse.data.result[0].value),
      Result(
          metric: widget.apiResponse.data.result[1].metric,
          value: widget.apiResponse.data.result[1].value),
      Result(
          metric: widget.apiResponse.data.result[2].metric,
          value: widget.apiResponse.data.result[2].value),
      Result(
          metric: widget.apiResponse.data.result[3].metric,
          value: widget.apiResponse.data.result[3].value),
      Result(
          metric: widget.apiResponse.data.result[4].metric,
          value: widget.apiResponse.data.result[4].value),
      Result(
          metric: widget.apiResponse.data.result[5].metric,
          value: widget.apiResponse.data.result[5].value),
      Result(
          metric: widget.apiResponse.data.result[6].metric,
          value: widget.apiResponse.data.result[6].value),
    ];
    return heap_G1EdenSpace;
  }

  List<Result> getHeap_OldGenData() {
    final List<Result> heap_oldGen = [
      Result(
          metric: widget.apiResponse.data.result[7].metric,
          value: widget.apiResponse.data.result[7].value),
      Result(
          metric: widget.apiResponse.data.result[8].metric,
          value: widget.apiResponse.data.result[8].value),
      Result(
          metric: widget.apiResponse.data.result[9].metric,
          value: widget.apiResponse.data.result[9].value),
      Result(
          metric: widget.apiResponse.data.result[10].metric,
          value: widget.apiResponse.data.result[10].value),
      Result(
          metric: widget.apiResponse.data.result[11].metric,
          value: widget.apiResponse.data.result[11].value),
      Result(
          metric: widget.apiResponse.data.result[12].metric,
          value: widget.apiResponse.data.result[12].value),
      Result(
          metric: widget.apiResponse.data.result[13].metric,
          value: widget.apiResponse.data.result[13].value),
    ];
    return heap_oldGen;
  }

  List<Result> getHeap_G1SurvivorSpaceData() {
    final List<Result> heap_G1SurvivorSpace = [
      Result(
          metric: widget.apiResponse.data.result[14].metric,
          value: widget.apiResponse.data.result[14].value),
      Result(
          metric: widget.apiResponse.data.result[15].metric,
          value: widget.apiResponse.data.result[15].value),
      Result(
          metric: widget.apiResponse.data.result[16].metric,
          value: widget.apiResponse.data.result[16].value),
      Result(
          metric: widget.apiResponse.data.result[17].metric,
          value: widget.apiResponse.data.result[17].value),
      Result(
          metric: widget.apiResponse.data.result[18].metric,
          value: widget.apiResponse.data.result[18].value),
      Result(
          metric: widget.apiResponse.data.result[19].metric,
          value: widget.apiResponse.data.result[19].value),
      Result(
          metric: widget.apiResponse.data.result[20].metric,
          value: widget.apiResponse.data.result[20].value),
    ];
    return heap_G1SurvivorSpace;
  }

  List<Result> getNonHeap_NonMethodsData() {
    final List<Result> nonHeap_NonMethods = [
      Result(
          metric: widget.apiResponse.data.result[21].metric,
          value: widget.apiResponse.data.result[21].value),
      Result(
          metric: widget.apiResponse.data.result[22].metric,
          value: widget.apiResponse.data.result[22].value),
      Result(
          metric: widget.apiResponse.data.result[23].metric,
          value: widget.apiResponse.data.result[23].value),
      Result(
          metric: widget.apiResponse.data.result[24].metric,
          value: widget.apiResponse.data.result[24].value),
      Result(
          metric: widget.apiResponse.data.result[25].metric,
          value: widget.apiResponse.data.result[25].value),
      Result(
          metric: widget.apiResponse.data.result[26].metric,
          value: widget.apiResponse.data.result[26].value),
      Result(
          metric: widget.apiResponse.data.result[27].metric,
          value: widget.apiResponse.data.result[27].value),
    ];
    return nonHeap_NonMethods;
  }

  List<Result> getNonHeap_NonProfiledMethodsData() {
    final List<Result> nonHeap_NonProfiledMethods = [
      Result(
          metric: widget.apiResponse.data.result[28].metric,
          value: widget.apiResponse.data.result[28].value),
      Result(
          metric: widget.apiResponse.data.result[29].metric,
          value: widget.apiResponse.data.result[29].value),
      Result(
          metric: widget.apiResponse.data.result[30].metric,
          value: widget.apiResponse.data.result[30].value),
      Result(
          metric: widget.apiResponse.data.result[31].metric,
          value: widget.apiResponse.data.result[31].value),
      Result(
          metric: widget.apiResponse.data.result[32].metric,
          value: widget.apiResponse.data.result[32].value),
      Result(
          metric: widget.apiResponse.data.result[33].metric,
          value: widget.apiResponse.data.result[33].value),
      Result(
          metric: widget.apiResponse.data.result[34].metric,
          value: widget.apiResponse.data.result[34].value),
    ];
    return nonHeap_NonProfiledMethods;
  }

  List<Result> getNonHeap_ProfiledMethodsData() {
    final List<Result> nonHeap_ProfiledMethods = [
      Result(
          metric: widget.apiResponse.data.result[35].metric,
          value: widget.apiResponse.data.result[35].value),
      Result(
          metric: widget.apiResponse.data.result[36].metric,
          value: widget.apiResponse.data.result[36].value),
      Result(
          metric: widget.apiResponse.data.result[37].metric,
          value: widget.apiResponse.data.result[37].value),
      Result(
          metric: widget.apiResponse.data.result[38].metric,
          value: widget.apiResponse.data.result[38].value),
      Result(
          metric: widget.apiResponse.data.result[39].metric,
          value: widget.apiResponse.data.result[39].value),
      Result(
          metric: widget.apiResponse.data.result[40].metric,
          value: widget.apiResponse.data.result[40].value),
      Result(
          metric: widget.apiResponse.data.result[41].metric,
          value: widget.apiResponse.data.result[41].value),
    ];
    return nonHeap_ProfiledMethods;
  }

  List<Result> getNonHeap_CompressedClassSpaceData() {
    final List<Result> nonHeap_CompressedClassSpace = [
      Result(
          metric: widget.apiResponse.data.result[42].metric,
          value: widget.apiResponse.data.result[42].value),
      Result(
          metric: widget.apiResponse.data.result[43].metric,
          value: widget.apiResponse.data.result[43].value),
      Result(
          metric: widget.apiResponse.data.result[44].metric,
          value: widget.apiResponse.data.result[44].value),
      Result(
          metric: widget.apiResponse.data.result[45].metric,
          value: widget.apiResponse.data.result[45].value),
      Result(
          metric: widget.apiResponse.data.result[46].metric,
          value: widget.apiResponse.data.result[46].value),
      Result(
          metric: widget.apiResponse.data.result[47].metric,
          value: widget.apiResponse.data.result[47].value),
      Result(
          metric: widget.apiResponse.data.result[48].metric,
          value: widget.apiResponse.data.result[48].value),
    ];
    return nonHeap_CompressedClassSpace;
  }

  List<Result> getNonHeap_MetaSpaceData() {
    final List<Result> nonHeap_MetaSpace = [
      Result(
          metric: widget.apiResponse.data.result[49].metric,
          value: widget.apiResponse.data.result[49].value),
      Result(
          metric: widget.apiResponse.data.result[50].metric,
          value: widget.apiResponse.data.result[50].value),
      Result(
          metric: widget.apiResponse.data.result[51].metric,
          value: widget.apiResponse.data.result[51].value),
      Result(
          metric: widget.apiResponse.data.result[52].metric,
          value: widget.apiResponse.data.result[52].value),
      Result(
          metric: widget.apiResponse.data.result[53].metric,
          value: widget.apiResponse.data.result[53].value),
      Result(
          metric: widget.apiResponse.data.result[54].metric,
          value: widget.apiResponse.data.result[54].value),
      Result(
          metric: widget.apiResponse.data.result[55].metric,
          value: widget.apiResponse.data.result[55].value),
    ];
    return nonHeap_MetaSpace;
  }

  List<Result> getGC_Memory_Allocated_BytesData() {
    final List<Result> _GC_Memory_Allocated_Bytes = [
      Result(
          metric: widget.apiResponse.data.result[0].metric,
          value: widget.apiResponse.data.result[0].value),
      Result(
          metric: widget.apiResponse.data.result[1].metric,
          value: widget.apiResponse.data.result[1].value),
      Result(
          metric: widget.apiResponse.data.result[2].metric,
          value: widget.apiResponse.data.result[2].value),
      Result(
          metric: widget.apiResponse.data.result[3].metric,
          value: widget.apiResponse.data.result[3].value),
      Result(
          metric: widget.apiResponse.data.result[4].metric,
          value: widget.apiResponse.data.result[4].value),
      Result(
          metric: widget.apiResponse.data.result[5].metric,
          value: widget.apiResponse.data.result[5].value),
      Result(
          metric: widget.apiResponse.data.result[6].metric,
          value: widget.apiResponse.data.result[6].value),
    ];
    return _GC_Memory_Allocated_Bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Dashboard',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            leading: IconButton(
              icon: const Icon(Icons.refresh_rounded),
              iconSize: 40,
              padding: const EdgeInsets.all(8),
              hoverColor: Colors.grey,
              color: Colors.white,
              onPressed: () {
                setState(() {
                  homepage.readJson();
                });
              },
            )),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          SizedBox(
            height: 500,
            width: 1500,
            child: SfCartesianChart(
              title: ChartTitle(
                  text: 'JVM Memory Used Bytes for All Services',
                  textStyle: const TextStyle(fontSize: 16)),
              legend: Legend(isVisible: true),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                LineSeries<Result, String>(
                    name: 'Heap, G1EdenSpace',
                    color: Colors.cyan,
                    dataSource: _heap_G1EdenSpace,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: 'Heap, OldGen',
                    color: Colors.red,
                    dataSource: _heap_oldGen,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: 'Heap, G1SurvivorSpace',
                    color: Colors.blue,
                    dataSource: _heap_G1SurvivorSpace,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: 'Non-Heap, Non-Methods',
                    color: Colors.yellow,
                    dataSource: _nonHeap_NonMethods,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: 'Non-Heap, Non-Profiled-Methods',
                    color: Colors.purple,
                    dataSource: _nonHeap_NonProfiledMethods,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: 'Non-Heap, Profiled-Methods',
                    color: Colors.green,
                    dataSource: _nonHeap_ProfiledMethods,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: 'Non-Heap, Compressed Class Space',
                    color: Colors.grey,
                    dataSource: _nonHeap_CompressedClassSpace,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: 'Non-Heap, Metaspace',
                    color: Colors.pinkAccent,
                    dataSource: _nonHeap_Metaspace,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true)
              ],
              primaryXAxis:
                  CategoryAxis(edgeLabelPlacement: EdgeLabelPlacement.none),
              primaryYAxis: NumericAxis(
                labelFormat: '{value}',
              ),
            ),

            // Expanded(
            //   child: ListView.builder(
            //       itemCount: widget.apiResponse.data.result.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //           title: Text(
            //               widget.apiResponse.data.result[index].metric.name),
            //           subtitle: Text(
            //               "${widget.apiResponse.data.result[index].metric.instance}\n${widget.apiResponse.data.result[index].metric.job}"),
            //           isThreeLine: true,
            //           trailing: Text(widget
            //               .apiResponse.data.result[index].value
            //               .toString()),
            //         );
            //       }),
            // ),
            // Padding(padding: EdgeInsets.all(10)),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 20)),
          SizedBox(
            height: 500,
            width: 1500,
            child: SfCartesianChart(
              title: ChartTitle(
                  text: 'JVM GC Memory Allocated bytes Total for All Services',
                  textStyle: const TextStyle(fontSize: 16)),
              legend: Legend(isVisible: true),
              tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[0].metric.instance,
                    color: Colors.cyan,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[1].metric.instance,
                    color: Colors.red,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[2].metric.instance,
                    color: Colors.blue,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[3].metric.instance,
                    color: Colors.yellow,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[4].metric.instance,
                    color: Colors.purple,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[5].metric.instance,
                    color: Colors.green,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[6].metric.instance,
                    color: Colors.grey,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true),
                LineSeries<Result, String>(
                    name: widget.apiResponse.data.result[7].metric.instance,
                    color: Colors.pinkAccent,
                    dataSource: _GC_Memory_Allocated_Bytes,
                    xValueMapper: (Result result, _) => result.metric.job,
                    yValueMapper: (Result result, _) =>
                        double.parse(result.value[1][1]),
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true)
              ],
            ),

            // Expanded(
            //   child: ListView.builder(
            //       itemCount: widget.apiResponse.data.result.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return ListTile(
            //           title: Text(
            //               widget.apiResponse.data.result[index].metric.name),
            //           subtitle: Text(
            //               "${widget.apiResponse.data.result[index].metric.instance}\n${widget.apiResponse.data.result[index].metric.job}"),
            //           isThreeLine: true,
            //           trailing: Text(widget
            //               .apiResponse.data.result[index].value
            //               .toString()),
            //         );
            //       }),
            // ),
            // Padding(padding: EdgeInsets.all(10)),
          ),
        ])));
  }
}
