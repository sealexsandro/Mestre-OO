import 'package:jogo_mobile/src/model/DeliveryFactory.dart';
import 'package:jogo_mobile/src/model/deliverItems.dart';
import 'package:jogo_mobile/src/model/metodosDasClasses.dart';

class Metodos implements DeliveryFactory {
  @override
  DeliverItems createDelivery() {
    return MetodosDeClasse();
  }
  
}