clear all
clf
clc

numberOfIterations = 9000;

nodes = [0 100;
         100 100; 
         100 0; 
         0 0];
roads = [ 1 2; 
          2 3; 
          3 4; 
          4 1];

cars = [0 1 20 0 2 2 3 2 1; 
        10 1 20 0 2 2 3 2 1;
        20 1 0.03 0 2 2 3 2 1];
    
routes = [1 2 3 4 1 2 3 4 0;1 2 3 4 1 2 3 4 0;1 2 3 4 1 2 3 4 0];
% nbrOfCars = 3;
% parkingNodes =[1,5];
% routes =InizilizeRoutes(parkingNodes,nbrOfCars)

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
global timeStep;
timeStep = 0.1;

cars = -sortrows(-cars, [2 1]);

for i = 1:numberOfIterations
  cars = updateCars(cars, nodes, roads,routes)
  plotCoordinates = parameterCoordinates(cars, nodes, roads);

  scatter(plotCoordinates(:,1), plotCoordinates(:,2))
  axis([-10 110 -10 110])
  drawnow
end
