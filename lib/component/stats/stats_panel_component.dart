library stats_panel;

import 'package:angular/angular.dart';
import 'package:daviscru_web/service/authentication.dart';
import "dart:convert";

part 'package:daviscru_web/service/repositories/stats_repository.dart';

part 'package:daviscru_web/models/stat.dart';

@Component(
    selector: 'stats-panel',
    templateUrl: '/packages/daviscru_web/component/stats/stats_panel.html',
    useShadowDom: false)
class StatsPanelComponent {
  final StatsRepository _repo;
  List<Stat> stats;
  String loadStatus = "loading";

  StatsPanelComponent(this._repo){
    _repo.getStats().then((returnedStats){
      stats = returnedStats;
      loadStatus = "success";
    }).catchError((_) => loadStatus = "error");
  }

  void save(){
    stats.forEach((stat) => stat.value += (stat.newRecordValue as int));
    clear();
  }

  void clear(){
    stats.forEach((stat) => stat.newRecordValue = 0);
  }
}