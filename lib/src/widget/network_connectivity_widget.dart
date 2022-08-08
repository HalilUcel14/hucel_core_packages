import 'package:flutter/material.dart';

import '../../hucel_core.dart';

class ConnectivityWidget extends StatefulWidget {
  const ConnectivityWidget({Key? key, this.networkChild}) : super(key: key);

  final Widget? networkChild;

  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget>
    with StateMixin {
  //
  late final NetworkConnectivityManager _connectivityManager;
  ConnectedResult? _connectedResult;
  //
  @override
  void initState() {
    super.initState();
    _connectivityManager = NetworkConnectivityManager();
    _fetchFirstResult();
    _connectivityManager.handleConnectivityChange((result) {
      _updateView(result);
    });
  }

  //
  Future<void> _fetchFirstResult() async {
    // Ekran Çizilmesi Bittikten sonra iç atama gerçekleştirir
    // Performans Kazandırır. Tekrar Çizimi önler
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _connectedResult = await _connectivityManager.checkFirstConnectivity();
      _updateView(_connectedResult!); // 36.31
    });
    setState(() {});
  }

  void _updateView(ConnectedResult result) {
    setState(() {
      _connectedResult = result;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: widget.networkChild ?? _connectedWidget(),
      secondChild: const SizedBox(),
      crossFadeState: _connectedResult == ConnectedResult.off
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 250),
    );
  }

  Widget _connectedWidget() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(12.0),
          height: 150,
          alignment: Alignment.center,
          width: double.infinity > 400 ? 400 : double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.red,
          ),
          child: const Text(
            'Not Connected Internet',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onCompleted) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onCompleted.call();
    });
  }
}
