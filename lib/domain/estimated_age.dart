class EstimatedAge {
  final int count;
  final String name;
  final int age;

  EstimatedAge({required this.count, required this.name, required this.age});

  factory EstimatedAge.fromJson(Map<String, dynamic> json) {
    return EstimatedAge(
      count: json['count'],
      name: json['name'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'name': name,
      'age': age,
    };
  }
}
