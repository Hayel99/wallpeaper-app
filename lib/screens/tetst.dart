import 'package:http/http.dart' as http;

void main() async {
  final String url = 'https://api.pexels.com/v1/search?query=people';
  final String apiKey =
      'b3WwMrMkCQsgW9JBZ5NENB65tJqxAECGtXTqICybIjTUm7FiTo3PkmhC';
  final response =
      await http.get(Uri.parse(url), headers: {'Authorization': apiKey});

  print(response.body);
}
