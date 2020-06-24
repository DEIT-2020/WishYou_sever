
import 'harness/app.dart';
import 'dart:async';
import "package:heroes/model/hero.dart";
Future main() async{ 
  final harness = Harness()..install();
  final query = Query<Hero>(harness.context)
      ..values.name = "Bob";

    await query.insert();

    final response = await harness.agent.get("/heroes");
    expectResponse(response, 200,
        body: allOf([
          hasLength(greaterThan(0)),
          everyElement({
            "id": greaterThan(0),
            "name": isString,
          })
        ]));
  
}