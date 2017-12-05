clear all
clf
clc

numberOfIterations = 700;

nodes = initializeNodes();
%parkingNodeIndices = [length(nodes)-1:length(nodes)];
roads = initializeRoads();
%parkingRoads = [length(roads) - 1:length(roads)];

roads = roads(1:length(roads)-1,:);

cars = initializeCars(nodes, roads);

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
global maxVelocityInIntersection;
maxVelocityInIntersection = 15;

nIteration = 0;
nbrOfCars = size(cars, 1);

cars(:,positionIndex) = 0;
routes = InizilizeRoutes(cars,nodes,roads);
cars(:,roadIndex) = routes(:,1);
cars(:,nextRoadIndex) = routes(:,2);
cars(:,nextRoadInRouteIndex) = 2;

cars = -sortrows(-cars, [2 1]);


% savePosition = zeros(nbrOfCars,numberOfIterations);
% saveRoad = zeros(nbrOfCars,numberOfIterations);
% saveMaxVelocity = zeros(nbrOfCars,numberOfIterations);
% saveCurrentVelocity = zeros(nbrOfCars,numberOfIterations);
% saveMaxAcceleration = zeros(nbrOfCars,numberOfIterations);
% saveMaxDeacceleration = zeros(nbrOfCars,numberOfIterations);
% saveVision = zeros(nbrOfCars,numberOfIterations);
% saveNextRoad = zeros(nbrOfCars,numberOfIterations);

% initSaveData(savePosition,saveRoad,saveMaxVelocity, saveCurrentVelocity, ...
%     saveMaxAcceleration, saveMaxDeacceleration, saveVision, saveNextRoad);

for i = 1:numberOfIterations
  nIteration = nIteration + 1;
  initializedCarIndices = find(sum(cars'));
  unInitializedCarIndices = find(sum(cars')==0);
  cars(initializedCarIndices,:) = updateCars(cars(initializedCarIndices,:), nodes, roads,routes);
%   
%   savePosition = savePositions(cars, nIteration, savePosition);
%   saveRoad = saveRoads(cars, nIteration, saveRoad);
%   saveMaxVelocity = saveMaxVelocities(cars, nIteration, saveMaxVelocity);
%   saveCurrentVelocity = saveCurrentVelocities(cars, nIteration, saveCurrentVelocity);
%   saveMaxAcceleration = saveMaxAccelerations(cars, nIteration, saveMaxAcceleration);
%   saveMaxDeacceleration = saveMaxDeaccelerations(cars, nIteration, saveMaxDeacceleration);
%   saveVision = saveVisions(cars, nIteration, saveVision);
%   saveNextRoad = saveNextRoads(cars, nIteration, saveNextRoad); 
  
  
%   if ~isempty(unInitializedCarIndices)
% %    roads(unInitializedCarIndices(1),:)
%     cars(unInitializedCarIndices(1),:) = generateNewCars(parkingRoads(1));
%   end
    if mod(i, 5) == 0
        plotCoordinates = parameterCoordinates(cars(initializedCarIndices,:), nodes, roads);
        clf;
        scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
        hold on
        %text(-5, 102, num2str(velocities));
        %text(-5, 10, num2str(positions, 4));
        text(0, 190, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
        %axis([-10 510 -10 510])
        plotRoads(roads, nodes);
        %cars(:,currentVelocityIndex)
        drawnow
    end
end


