class Customer {
  const Customer(
      {required this.id,
      required this.name,
      this.email,
      this.phone,
      this.address});

  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? address;
}
