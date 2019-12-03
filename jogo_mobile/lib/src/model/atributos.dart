import 'package:jogo_mobile/src/model/DeliveryFactory.dart';
import 'package:jogo_mobile/src/model/deliverItems.dart';
import 'package:jogo_mobile/src/model/atributosDasClasses.dart';

class Atributos implements DeliveryFactory {
  @override
  DeliverItems createDelivery() {
    return AtributosDeClasse();
  }
}
