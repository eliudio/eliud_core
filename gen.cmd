mkdir lib\model\backup
rem move lib\model\member_entity.dart lib\model\backup
rem move lib\model\member_model.dart lib\model\backup
call flutter pub get
call flutter packages pub run build_runner build --delete-conflicting-outputs 
rem move lib\model\backup\member_entity.dart lib\model
rem move lib\model\backup\member_model.dart lib\model
rmdir lib\model\backup
