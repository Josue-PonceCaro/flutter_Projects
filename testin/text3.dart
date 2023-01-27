//verificar que un usuario este dentro de una ruta

import 'dart:math';

class TrackingPoint{
  final double x,y;
  TrackingPoint(
    this.x,
    this.y,
  );
  double distance(TrackingPoint op){
    return sqrt(pow(op.x- x, 2)+pow(op.y - y, 2));
  }
}

class TrackingSegment{
  late double x,y;
  late num l2Norm;
  late TrackingPoint startPoint;
  TrackingSegment(TrackingPoint p1,TrackingPoint p2){
    startPoint = p1;
    x = p2.x-p1.x;
    y = p2.y-p1.y;
    l2Norm = pow(x, 2)+pow(y, 2);
  }

  double minDistanceToPoint(TrackingPoint p){
    //get the closest point to p on segment
    TrackingPoint closestPoint;
    if(l2Norm==0.0) {
      closestPoint = startPoint; //the segment has len 0, start_point == end_point
      }
    else{
      double aX = p.x - startPoint.x;
      double aY = p.y - startPoint.y;
      double k = max(0,min((aX*x+aY*y)/l2Norm,1));
      closestPoint =  TrackingPoint(startPoint.x + k*x,startPoint.y + k*y);
    }
    return p.distance(closestPoint);
  }
}

class TrackingRoute{
  late List<TrackingPoint> pointList;
  late int lenPoints;
  TrackingRoute(List<TrackingPoint> pointList){
    this.pointList = pointList;
    this.lenPoints = pointList.length;
  }
  Map<String,dynamic> getMinDistances(TrackingPoint p){
    double gMinDistance = double.maxFinite;
    int iGMinDistance = -1;
    //se pueden tener los segmentos en memoria
    for(int i=0;i<lenPoints-1;i++){
      TrackingPoint currentPoint = pointList[i], nextPoint = pointList[i+1]; 
      TrackingSegment currentSegment = TrackingSegment(currentPoint, nextPoint);
      double minDistance = currentSegment.minDistanceToPoint(p);
      print("segment $i -> min_distance_to_point: $minDistance");
      if(minDistance<gMinDistance) {
        gMinDistance = minDistance;
        iGMinDistance = i;
      }
    }
    print("global_min_distance_to_point: $gMinDistance");

    return {
      "global_min_distance": gMinDistance,
      "segment": [iGMinDistance,iGMinDistance+1]
    };
  }
}


void main(){
  List<List<double>> planned_route_raw_points = [[1,1],[1,3],[0,3]];
  List<List<double>> real_route_raw_points = [[0,0],[0,2],[0,4]];

  List<TrackingPoint> planned_route_points = [];
  planned_route_raw_points.forEach((raw_point) {planned_route_points.add(new TrackingPoint(raw_point[0],raw_point[1]));});
  TrackingRoute planned_route = new TrackingRoute(planned_route_points);

  List<TrackingPoint> real_route_points = [];
  real_route_raw_points.forEach((raw_point) {real_route_points.add(new TrackingPoint(raw_point[0],raw_point[1]));});

  real_route_points.forEach((point) { print(planned_route.getMinDistances(point)); });
  Map<String, String> oldMap = {
    'a':'aa',
    'b':'aa',
    };
  Map<String,String> newMap = Map.from(oldMap);
  newMap['a'] = 'AA';
  print(oldMap);
  print(newMap);

}