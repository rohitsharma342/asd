class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final bool isStaff;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.isStaff = false,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileImage,
    bool? isStaff,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      isStaff: isStaff ?? this.isStaff,
    );
  }
}