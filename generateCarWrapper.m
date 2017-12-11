function [cars routes] = generateCarWrapper(cars, routes, nodes, roads, startnode, endnode, unInitializedCarIndices)
  global positionIndex;
  positionIndex = 1;
  global roadIndex;
  roadIndex = 2;
  global maxVelocityIndex;
  maxVelocityIndex = 3;
  global currentVelocityIndex;
  currentVelocityIndex = 4;
  global maxAccelerationIndex;
  maxAccelerationIndex = 5;
  global maxDeaccelerationIndex;
  maxDeaccelerationIndex = 6;
  global visionIndex;
  visionIndex = 7;
  global nextRoadIndex;
  nextRoadIndex = 8;
  global nextRoadInRouteIndex; 
  nextRoadInRouteIndex = 9;
  [routes(unInitializedCarIndices(1),:) cars(unInitializedCarIndices(1),:)] = generateNewCars(startnode, endnode, nodes, roads, length(unInitializedCarIndices));
  cars(unInitializedCarIndices(1), roadIndex) = routes(unInitializedCarIndices(1),1);
  cars(unInitializedCarIndices(1), nextRoadIndex) = routes(unInitializedCarIndices(1),2);
  cars(unInitializedCarIndices(1), nextRoadInRouteIndex) = 1;
  [cars routes] = sortwrapper(cars, routes);
  end
