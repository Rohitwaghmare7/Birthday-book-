class friends {
  final String name;
  final String message;
  final int no;
  final String dt;

  const friends(
      {required this.name,
      required this.no,
      required this.message,
      required this.dt});
  Map<String, dynamic> toMap() {
    return {'name': name, 'no': no, 'message': message, 'dt': dt};
  }
}
