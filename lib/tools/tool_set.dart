String process(String template, { Map<String, String> parameters }) {
  if (parameters != null) {
    String processed = template;
    parameters.forEach((key, value) {
      processed = processed.replaceAll(key, value);
    });
    return processed;
  } else {
    return template;
  }
}
