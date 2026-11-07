class Run {
  //ตัวแปรตั้งชื่อล้อกับชื่อคอลัมน์ในตาราง
  String? id;
  String? created_at;
  String? runWhere;
  String? runPerson;
  int? runDistance;
  String? runImageUrl;

  //Constructor
  Run({
    this.id,
    this.created_at,
    this.runWhere,
    this.runPerson,
    this.runDistance,
    this.runImageUrl,
  });

  //การแปลงข้อมูลฝั่ง mobile เป็น JSON เพื่อส่งไปยัง Supabase : toJson
  Map<String, dynamic> toJson() => {
    "runWhere": runWhere,
    "runPerson": runPerson,
    "runDistance": runDistance,
    "runImageUrl": runImageUrl,
  };

  //การแปลงข้อมูลฝั่ง Supabase มาใช้ในฝั่ง mobile : fromJson
  factory Run.fromJson(Map<String, dynamic> json) => Run(
    id: json["id"] as String?,
    created_at: json["created_at"] as String?,
    runWhere: json["runWhere"] as String?,
    runPerson: json["runPerson"] as String?,
    runDistance: json["runDistance"] as int?,
    runImageUrl: json["runImageUrl"] as String?,
  );
}
