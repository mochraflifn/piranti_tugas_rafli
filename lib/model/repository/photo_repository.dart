import 'package:dio/dio.dart';
import 'package:piranti_tugas_rafli/core/api_provider.dart';
import 'package:piranti_tugas_rafli/model/data/photo.dart';

class PhotoRepository extends ApiProvider {
  Future<List<Photo>> photos({required int page}) async {
    try {
      print('Debug page: $page');
      Response response = await dio.get('photos?page=$page');
      List<dynamic> listData = response.data;
      return listData.map((element) => Photo.fromJson(element)).toList();
    } on DioException catch (_) {
      return [];
    }
  }
}
