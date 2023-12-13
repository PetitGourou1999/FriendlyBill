class APIConfiguration {
  const APIConfiguration(this.debug, this.baseURL, this.headers);
  final bool debug;
  final String baseURL;
  final Map<String, String> headers;
}
