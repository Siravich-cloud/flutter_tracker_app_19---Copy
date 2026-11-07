//ไฟล์นี้จะประกอบด้วยโค้ดตคำสั่งการทำงานตต่างๆกับ Supabase
//เช่นอัปโหลดไฟล์มเพิ่ม ลบ เเก้ไข ค้นหา/ตรวจสอบ/ดึง/ดู ข้อมูลในตาราง
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tracker_app/models/run.dart';

class SupabaseServices {
  //**สิ่งสำคัญจะต้องสร้าง instance/object/ตัวแทน ที่จะทำงานกับ Supabase **//
  final supabase = Supabase.instance.client;

  //----ต่อจากนี้จะเป็นส่วนของเมธอดการทำงานต่างๆ กับ Supabase -----
  //เมธอดอัปโหลดไฟล์ไปยัง Bucket ที่อยู่ใน Storage ของ Supabase ---------------------------------
  Future<String> uploadImageFile(XFile xfile) async {
    //ตั้งชื่อไฟล์เพื่อไม่ให้ซ้ำกันเวลาอยู่ใน Bucket
    final newFileName =
        '${DateTime.now().millisecondsSinceEpoch}.${xfile.name}';

    //upload ไฟล์
    await supabase.storage
        .from('run_bk')
        .uploadBinary(
          newFileName,
          await xfile.readAsBytes(),
          fileOptions: FileOptions(contentType: xfile.mimeType),
        );

    //คืนค่าที่อยู่ของไฟล์ที่อัปโหลดไปใน Bucket ของ Supabase เพื่อเอาไปบันทึกลง table
    return supabase.storage.from('run_bk').getPublicUrl(newFileName);
  }

  //เมธอดเพิ่มไปยัง table ที่อยู่ใน database ของ Supabase ------------------------------------------
  Future<void> insertRun(Run run) async {
    await supabase.from('run_tb').insert(run.toJson());
  }
}
