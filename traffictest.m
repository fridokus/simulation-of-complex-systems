clear all
clf
clc

numberOfIterations = 9000;

nodes = [0 100;
         100 100; 
         100 0; 
         0 0];
roads = [1 2 2 1; 
          2 3 2 1; 
          3 4 2 1; 
          4 1 2 1];

cars = [0 1 20 0 2 2 3 2; 
        10 1 20 0 2 2 3 2;
        20 1 0.03 0 2 2 3 2];

global positionIndex;
positionIndex = 1;
global roadIndex;
roadIndex = 2;
global roadDirectionIndex;
roadDirectionIndex = 3;
global laneIndex;
laneIndex = 4;
global maxVelocityIndex;
maxVelocityIndex = 5;
global currentVelocityIndex;
currentVelocityIndex = 6;
global maxAccelerationIndex;
maxAccelerationIndex = 7;
global maxDeaccelerationIndex;
maxDeaccelerationIndex = 8;
global visionIndex;
visionIndex = 9;
global nextRoadIndex;
nextRoadIndex = 10
global timeStep;
timeStep = 0.1;

cars = -sortrows(-cars, [2 1]);

for i = 1:numberOfIterations
  cars = updateCars(cars, nodes, roads)
  plotCoordinates = parameterCoordinates(cars, nodes, roads);

  scatter(plotCoordinates(:,1), plotCoordinates(:,2))
  axis([-10 110 -10 110])
  drawnow
end
