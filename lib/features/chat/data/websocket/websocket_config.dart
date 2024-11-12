class WebSocketConfig {
  static final String _url = "192.168.0.178";
  // static final String _url = 'v2.api.math_app';
  static final int _port = 6001;
  // static final int _port = 8443;
  static final bool _useSSL = false;
  // static final bool _useSSL = true;

  static Uri getUrl() {
    const _suffix =
        'app/local?protocol=7&client=dart&version=2.9.0&flash=false';
        
    String url = "";
    if (_useSSL) {
      url = "wss://$_url:$_port/$_suffix";
    } else {
      url = "ws://$_url:$_port/$_suffix";
    }

    return Uri.parse(url);
  }
}
