// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
//
// class IsarHelper {
//   late Future<Isar> db;
//   static Isar? _isarInstance;
//
//   IsarHelper() {
//     db = _initDb();
//   }
//
//   Future<Isar> _initDb() async {
//     if (_isarInstance != null) {
//       return _isarInstance!;
//     }
//
//     final dir = await getApplicationDocumentsDirectory();
//
//     _isarInstance = await Isar.open(
//       [
//         FamilyEntitySchema,
//         FamilyMemberEntitySchema, // Yangi schema qo‘shildi
//       ],
//       directory: dir.path,
//     );
//
//     return _isarInstance!;
//   }
//
//   // Family CRUD
//
//   Future<int> addFamily(FamilyEntity family) async {
//     final isar = await db;
//     return await isar.writeTxn<int>(() async {
//       return await isar.familyEntitys.put(family);
//     });
//   }
//
//   Future<FamilyEntity?> getFamily(int id) async {
//     final isar = await db;
//     return await isar.familyEntitys.get(id);
//   }
//
//   Future<List<FamilyEntity>> getAllFamilys() async {
//     final isar = await db;
//     return await isar.familyEntitys.where().findAll();
//   }
//
//   Future<void> updateFamily(FamilyEntity family) async {
//     final isar = await db;
//     await isar.writeTxn(() async {
//       await isar.familyEntitys.put(family);
//     });
//   }
//
//   Future<void> deleteFamily(int id) async {
//     final isar = await db;
//     await isar.writeTxn(() async {
//       await isar.familyEntitys.delete(id);
//     });
//   }
//
//   // Family Member CRUD
//
//   Future<int> addFamilyMember(FamilyMemberEntity member) async {
//     final isar = await db;
//     return await isar.writeTxn<int>(() async {
//       return await isar.familyMemberEntitys.put(member);
//     });
//   }
//
//   Future<FamilyMemberEntity?> getFamilyMember(int id) async {
//     final isar = await db;
//     return await isar.familyMemberEntitys.get(id);
//   }
//
//   Future<FamilyMemberEntity?> getFamilyMemberByParentId(String parentId) async {
//     final isar = await db;
//
//     return await isar.familyMemberEntitys
//         .filter()
//         .parentIdEqualTo(parentId)
//         .findFirst();
//   }
//
//   Future<List<FamilyMemberEntity>> getChildren(int parentId) async {
//     AppRes.logger.t(parentId);
//     final isar = await db;
//     return await isar.familyMemberEntitys
//         .filter()
//         .parentIdEqualTo(parentId.toString())
//         .findAll();
//   }
//
//   Future<List<FamilyMemberEntity>> getAllFamilyMembers() async {
//     final isar = await db;
//     return await isar.familyMemberEntitys.where().findAll();
//   }
//
//   Future<void> updateFamilyMember(FamilyMemberEntity member) async {
//     final isar = await db;
//     await isar.writeTxn(() async {
//       await isar.familyMemberEntitys.put(member);
//     });
//   }
//
//   Future<void> deleteFamilyMember(int id) async {
//     final isar = await db;
//     await isar.writeTxn(() async {
//       await isar.familyMemberEntitys.delete(id);
//     });
//   }
//
//   Future<void> deleteAllFamilyMembers(List<int> ids) async {
//     final isar = await db;
//     await isar.writeTxn(() async {
//       await isar.familyMemberEntitys.deleteAll(ids);
//     });
//   }
//
//   // Close DB
//   Future<void> closeDb() async {
//     final isar = await db;
//     await isar.close();
//   }
// }
