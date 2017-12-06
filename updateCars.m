
function [cars routes] = updateCars(cars, nodes, roads, routes)
  global positionIndex;
  global roadIndex;
  global maxVelocityIndex;
  global currentVelocityIndex;
  global maxAccelerationIndex;
  global maxDeacelerationIndex;
  global visionIndex;
  global nextRoadIndex;
  global nextRoadInRouteIndex;


  [cars routes]= sortwrapper(cars, routes);
  roadLengths = calculateRoadLength(nodes, roads);
  
  acceleration = updateAcceleration(cars, nodes, roads);%checkCollision(cars);
  
  %carsAtIntersection = intersection(cars, roadLengths);

  cars = updateVelocity(cars,acceleration);
  
  cars = updatePosition(cars,nodes,roads,routes);

  
end
