import 'package:bloc/bloc.dart';
import 'package:firebase_demo/cubit_dbestech/pages/detail_pages/cubit/store_page_info_state_db.dart';

class StorePageInfoCubits extends Cubit<List<StorePageInfoState>>{
  StorePageInfoCubits():super([]);

  addPageInfo(String? name,int? index){
    emit([StorePageInfoState(name: name,index: index)]);
  }


}
