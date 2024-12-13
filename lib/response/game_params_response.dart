class GameCreateResponse{
  final int id;
  final String name;
  final String price;

  GameCreateResponse({
    required this.id, required this.name, required this.price});
  factory GameCreateResponse.fromJson(Map<String, dynamic> json) {
    return GameCreateResponse(
        id: json['id'], name: json['name'], price: json['price']
    );
  }
}