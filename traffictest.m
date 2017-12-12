clc
clf
plotDensities(saveRoad, saveCurrentVelocity, nodes, roads);

%%
clear all
clf
clc

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
global targetCar;
targetCar = 10;
global timeStep;
timeStep = 0.1;
global maxVelocityInIntersection;
maxVelocityInIntersection = 10;


nodes = initializeNodesSquare();
roads = initializeRoadsSquare(nodes);

%nodes = initializeNodes();
numberOfNodes = size(nodes, 1);
xmax = max(nodes(:,1)) + 10;
ymax = max(nodes(:,2)) + 10;
%roads = initializeRoads();
% roads(125,3) = 42;
% roads(126,3) = 42;
% roads(149,3) = 10;
% roads(144,3) = 10;
% roads(133,3) = 15;
% roads(134,3) = 15;
numberOfRoads = size(roads, 1);

numberOfRandomCars = 100;
numberOfTargetCars = [0, 1, 2];
numberOfStandardCars = [0, 0, 2];
%numberOfTargetCars = 1*[0 1 2 3 4 5 6 7 8 9 10];
%numberOfStandardCars =1*[10 9 8 7 6 5 4 3 2 1 0];

%%% CREATE VIDEO
v = VideoWriter('DecisionTraffic.mp4'); %'MPEG-4'
v.FrameRate = 10;
v.Quality = 100;
open(v);

for rateTargetCars = 2:2%length(numberOfTargetCars)
    %%%% CREATE FIGURE
    h=figure; 
    set(h,'Color','w','Units','Pixels','Position',[0 0 xmax ymax]);
    a1=axes('Units','Pixels','Position',[400 75 500 500]);   
    hold on;
    %%%
    
    numberOfCars = numberOfRandomCars + numberOfTargetCars(rateTargetCars) + numberOfStandardCars(rateTargetCars);
    targetVector = getTargetVector(numberOfTargetCars(rateTargetCars), numberOfStandardCars(rateTargetCars));
    targetI = 1;

    cars = initializeCars(nodes, roads, numberOfCars, numberOfRandomCars);

    numberOfIterations = 2000;

    initializedCarIndices = find(sum(cars'));
    unInitializedCarIndices = find(sum(cars')==0);

    savePosition = zeros(numberOfCars,numberOfIterations);
    saveRoad = zeros(numberOfCars,numberOfIterations);
    saveCurrentVelocity = zeros(numberOfCars,numberOfIterations);
    saveTargetCar = zeros(numberOfCars,numberOfIterations);

    cars(:,positionIndex) = 0;
    routes = InizilizeRoutes(cars(initializedCarIndices,:),nodes,roads, 1, 10, length(unInitializedCarIndices));
    cars(initializedCarIndices,roadIndex) = routes(initializedCarIndices,1);
    cars(initializedCarIndices,nextRoadIndex) = routes(initializedCarIndices,2);
    cars(initializedCarIndices,nextRoadInRouteIndex) = 2;
    [cars routes] = sortwrapper(cars, routes);

    i = 0;
    parkedCarIndices = 0;
    while i < numberOfIterations && length(parkedCarIndices) <= numberOfCars
      i = i + 1;
      initializedCarIndices = find(cars(:,roadIndex)>0);
      unInitializedCarIndices = find(sum(cars')==0);
      [~, saveRoad(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveRoad(initializedCarIndices,:)); 
      [~, savePosition(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), savePosition(initializedCarIndices,:)); 
      [~, saveCurrentVelocity(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveCurrentVelocity(initializedCarIndices,:));
      [~, saveTargetCar(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveTargetCar(initializedCarIndices,:));
      [cars(initializedCarIndices,:) routes(initializedCarIndices,:)] = updateCars(cars(initializedCarIndices,:), nodes, roads,routes(initializedCarIndices,:));
      initializedCarIndices = find(sum(cars'));

      if ~isempty(unInitializedCarIndices)
        target = targetVector(targetI);
        targetI = targetI + 1;
        [routes(unInitializedCarIndices(1),:) cars(unInitializedCarIndices(1),:)] = generateNewCars(1, 100, nodes, roads, length(unInitializedCarIndices),target);
        cars(unInitializedCarIndices(1), roadIndex) = routes(unInitializedCarIndices(1),1);
        cars(unInitializedCarIndices(1), nextRoadIndex) = routes(unInitializedCarIndices(1),2);
        cars(unInitializedCarIndices(1), nextRoadInRouteIndex) = 1;
        [~, saveRoad] = sortwrapper(cars, saveRoad); 
        [~, savePosition] = sortwrapper(cars, savePosition); 
        [~, saveCurrentVelocity] = sortwrapper(cars, saveCurrentVelocity);
        [~, saveTargetCar] = sortwrapper(cars, saveTargetCar);
        [cars routes] = sortwrapper(cars, routes);
      end

      initializedCarIndices = find(cars(:,roadIndex)>0);
      randomCarIndices = find(routes(:,end) == -1);
      parkedCarIndices = find(cars(:,roadIndex) == 0);
      targetCarIndices = find(cars(:,targetCar) == 1);
      standardCarIndices = find(cars(:,targetCar) == -1);
      %plotRoute = routes(target) 

      if mod(i, 10) == 0
        route = routes(targetCarIndices,:);
        plotCoordinates = parameterCoordinates(cars(initializedCarIndices,:), nodes, roads);
        plotCoordinatesRandom = parameterCoordinates(cars(randomCarIndices,:), nodes, roads);
        plotCoordinatesTarget = parameterCoordinates(cars(targetCarIndices,:), nodes, roads);
        plotCoordinatesStandard = parameterCoordinates(cars(standardCarIndices,:), nodes, roads);
        plotRoadsAndUpdateRoute(h, a1, roads, nodes, route, i * timeStep, v, xmax, ymax, plotCoordinatesRandom, ...
                                plotCoordinatesTarget, plotCoordinatesStandard)
      end
      
      saveRoad = saveRoads(cars, i, saveRoad);
      savePosition = savePositions(cars, i, savePosition);
      saveCurrentVelocity = saveCurrentVelocities(cars, i, saveCurrentVelocity);
      
    end

    %savePosition = savePositions(cars, i, savePosition);
    %saveTargetCar = saveTargetCars(cars,i,saveTargetCar);
end


%[atimeWOS(rateTargetCars),atime(rateTargetCars)] = getAvreegeTime(savePosition);


% rateTargetCarsPlot = numberOfTargetCars/max(numberOfTargetCars);
% figure
% plot(rateTargetCarsPlot,atime)
% figure 
% plot(rateTargetCarsPlot,atimeWOS)


