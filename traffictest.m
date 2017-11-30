clear all
clf
clc

numberOfIterations = 9000;

nodes = [0 100;
         100 100; 
         100 0; 
         0 0;
         50 50;
         25 50];
roads = [ 1 2; 
          2 3; 
          3 4; 
          4 1
          6 1];

cars = [10 1 20 0 2 -2 3 2; 
        20 1 30 0 2 -2 3 2;
        30 1 10 0 2 -2 3 2;
        0 5 10 0 2 -2 3 1;
        10 5 10 0 2 -2 3 1;
        50 5 10 1 2 -2 3 1;
        0 4 10 0 2 -2 3 1;
        94.1 4 10 1 2 -2 3 1];

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
global timeStep;
timeStep = 0.1;

cars = sortrows(cars, [2 1], 'descend');

for i = 1:numberOfIterations
  cars = updateCars(cars, nodes, roads);
  plotCoordinates = parameterCoordinates(cars, nodes, roads);
  

  velocities = cars(:,currentVelocityIndex);
  positions = cars(:,positionIndex);
  clf;
  scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
  hold on
  text(-5, 102, num2str(velocities));
  text(-5, 10, num2str(positions, 4));
  axis([-10 110 -10 110])
  plotRoads(roads, nodes);
  drawnow
end





