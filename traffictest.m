clear all
clf
clc

numberOfIterations = 9000;

nodes = [4 1; 4 30; 30 30; 30 1];
roads = [1 2; 2 3; 3 4; 4 1];

cars = [0 1 0.035 0 0.002 0.1 3 2; 
  6 1 0.03 0 0.002 0.1 3 2;
  2 1 0.03 0 0.004 0.1 3 2];

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

  scatter(plotCoordinates(:,1), plotCoordinates(:,2))
  axis([0 40 0 40])
  drawnow
end
