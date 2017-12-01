clear all
clf
clc

numberOfIterations = 9000;

nodes = [0 100;
         100 100; 
         100 0; 
         0 0;
         50 50;
         25 50;
         0 150;
         50 150;
         100 150;
         100 200;
         50 200;
         50 125;
         50 75;
         ];
roads = [ 1 2; 
          2 3; 
          3 4; 
          4 1;
          6 1;
          5 6;
          1 7;
          7 8;
          8 9;
          9 10;
          10 11;
          11 8;
          8 12;
          12 1;
          1 13;
          13 5;
          ];

cars = [10  1 20 0 2 -2 3 2; 
        20  1 30 0 2 -2 3 2;
        30  1 10 0 2 -2 3 2;
        0   3 20 0 2 -2 3 4;
        10  3 10 0 2 -2 3 4;
        0   4 10 0 2 -2 3 1;
        10  4 10 0 2 -2 3 1;
        0   5 30 0 2 -2 3 1;
        10  5 10 0 2 -2 3 1;
        20  5 10 0 2 -2 3 1;
        0   6 40 0 2 -2 3 5;
        0   7 10 0 2 -2 3 8;
        10  7 10 0 2 -2 3 8;
        0   8 10 0 2 -2 3 9;
        0  10 20 0 2 -2 3 11;
        10 10 10 0 2 -2 3 11;
        20 10 10 0 2 -2 3 11;
        0  11 10 0 2 -2 3 12;
        6  11 10 0 2 -2 3 12;];

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
global maxVelocityInIntersection;
maxVelocityInIntersection = 15;

cars = -sortrows(-cars, [2 1]);

for i = 1:numberOfIterations
  cars = updateCars(cars, nodes, roads);
  plotCoordinates = parameterCoordinates(cars, nodes, roads);
  

  velocities = cars(:,currentVelocityIndex);
  positions = cars(:,positionIndex);
  clf;
  scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
  hold on
  %text(-5, 102, num2str(velocities));
  %text(-5, 10, num2str(positions, 4));
  text(0, 190, strcat('Time:   ',num2str(i*timeStep)), 'fontsize', 18);
  axis([-10 110 -10 210])
  plotRoads(roads, nodes);
  drawnow
end





