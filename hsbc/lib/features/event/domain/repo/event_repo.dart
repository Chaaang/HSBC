import 'package:hsbc/features/event/domain/entities/event.dart';

abstract class EventRepo {
  Future<List<Event>> getEventItems(String uuid);
}
