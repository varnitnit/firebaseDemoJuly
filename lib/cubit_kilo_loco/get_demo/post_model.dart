class PostModel{
  final int userId;
  final int id;
  final String title;
  final String body;
  PostModel({required this.body,required this.title,required this.id,required this.userId});
  factory PostModel.fromJson(Map<String,dynamic>json)=>PostModel(
      body: json['body'], title: json['title'], id: json['id'], userId: json['userId']);
}