clear all
clf
clc



numberOfIterations = 7000;

nodes = initializeNodesSquare();
roads = initializeRoadsSquare(nodes);

% nodes = initializeNodes();
xmax = max(nodes(:,1));
ymax = max(nodes(:,2));
% roads = initializeRoads();
% roads(125,3) = 42;
% roads(126,3) = 42;
% roads(149,3) = 10;
% roads(144,3) = 10;
% roads(133,3) = 15;
% roads(134,3) = 15;

%%%%% If you want same velocitie evrywhere
%roads(:,3) = 14;

numberOfRandomCars =0;
p1 = 0:1:10;
p2 = 10:-1:0;
numberOfTargetCars = 10*p1;
numberOfStandardCars =10*p2;

nbrRuns = 10;

atime = zeros(nbrRuns,length(numberOfTargetCars));
atimeWOS = zeros(nbrRuns,length(numberOfTargetCars));
atimeTarget = zeros(nbrRuns,length(numberOfTargetCars));
atimeStandard = zeros(nbrRuns,length(numberOfTargetCars));




for run = 1:nbrRuns

for rateTargetCars = 1:length(numberOfTargetCars)

numberOfCars = numberOfRandomCars + numberOfTargetCars(rateTargetCars) + numberOfStandardCars(rateTargetCars);
targetVector = getTargetVector(numberOfTargetCars(rateTargetCars), numberOfStandardCars(rateTargetCars));
targetI = 1;


cars = initializeCars(nodes, roads, numberOfCars, numberOfRandomCars);

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

nIteration = 0;
nbrOfCars = size(cars, 1);

initializedCarIndices = find(sum(cars'));
unInitializedCarIndices = find(sum(cars')==0);

savePosition = zeros(nbrOfCars,numberOfIterations);
saveRoad = zeros(nbrOfCars,numberOfIterations);
saveCurrentVelocity = zeros(nbrOfCars,numberOfIterations);
saveTargetCar = zeros(nbrOfCars,numberOfIterations);



cars(:,positionIndex) = 0;
routes = InizilizeRoutes(cars(initializedCarIndices,:),nodes,roads, 1, 16, length(unInitializedCarIndices));
cars(initializedCarIndices,roadIndex) = routes(initializedCarIndices,1);
cars(initializedCarIndices,nextRoadIndex) = routes(initializedCarIndices,2);
cars(initializedCarIndices,nextRoadInRouteIndex) = 2;
[cars routes] = sortwrapper(cars, routes);

i = 0;
parkedCarIndices = 0;
while i < numberOfIterations && length(parkedCarIndices) < nbrOfCars
  i = i + 1;
  nIteration = nIteration + 1;
  initializedCarIndices = find(cars(:,roadIndex)>0);
  unInitializedCarIndices = find(sum(cars')==0);
  [~, saveRoad(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveRoad(initializedCarIndices,:)); 
  [~, savePosition(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), savePosition(initializedCarIndices,:)); 
  [~, saveCurrentVelocity(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveCurrentVelocity(initializedCarIndices,:));
  [~, saveTargetCar(initializedCarIndices,:)] = sortwrapper(cars(initializedCarIndices,:), saveTargetCar(initializedCarIndices,:));
  [cars(initializedCarIndices,:) routes(initializedCarIndices,:)] = updateCars(cars(initializedCarIndices,:), nodes, roads,routes(initializedCarIndices,:));
  initializedCarIndices = find(sum(cars'));

  if ~isempty(unInitializedCarIndices)
    size(cars(unInitializedCarIndices(1),:));
    size(routes(unInitializedCarIndices(1),:));
    target = targetVector(targetI);
    targetI = targetI + 1;
    [routes(unInitializedCarIndices(1),:) cars(unInitializedCarIndices(1),:)] = generateNewCars(1, 16, nodes, roads, length(unInitializedCarIndices),target);
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
  targetCarIndies = find(cars(:,targetCar) == 1);
  standardCarIndies = find(cars(:,targetCar) == -1);
  %plotRoute = routes(target) 
    
%     if mod(i, 5) == 0
%         plotCoordinates = parameterCoordinates(cars(initializedCarIndices,:), nodes, roads);
%         plotCoordinatesRandom = parameterCoordinates(cars(randomCarIndices,:), nodes, roads);
%         plotCoordinatesTarget = parameterCoordinates(cars(targetCarIndies,:), nodes, roads);
%         plotCoordinatesStandard = parameterCoordinates(cars(standardCarIndies,:), nodes, roads);
%         clf;
%         scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
%         hold on
%         scatter(plotCoordinatesRandom(:,1), plotCoordinatesRandom(:,2), 'filled','red')
%         hold on 
%         scatter(plotCoordinatesTarget(:,1), plotCoordinatesTarget(:,2), 'filled','blue')
%         hold on
%         scatter(plotCoordinatesStandard(:,1), plotCoordinatesStandard(:,2), 'filled','green')
%         hold on
%         text(0, 190, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
%         axis([-10, xmax+50, -10, ymax + 50])
%         plotRoads(roads, nodes);
%         drawnow
%     end
    
    savePosition(:,i) = cars(:,1);
    saveTargetCar(:,i) = cars(:,targetCar);

    
end

rateTargetCars
run

nbrTCars = numberOfTargetCars(rateTargetCars);
[atimeWOS(run,rateTargetCars),atime(run,rateTargetCars),atimeTarget(run,rateTargetCars),atimeStandard(run,rateTargetCars)] = getAvreegeTime(saveTargetCar,nbrTCars);
end

end

%%


rateTargetCarsPlot = numberOfTargetCars/max(numberOfTargetCars);
figure
plot(rateTargetCarsPlot,sum(atime)/nbrRuns,'-*b')
hold on
plot(rateTargetCarsPlot,sum(atimeTarget)/nbrRuns,'-ob')
hold on
plot(rateTargetCarsPlot,sum(atimeStandard)/nbrRuns,'-.b')
legend('average time for all cars','average time for cars with DRG system','average time for cars without DRG system')
title('Average route time in square zity with diffrent velocities, whitout random cars')
xlabel('proporion of cars using DRG system')
ylabel('average route time')
% figure 
% plot(rateTargetCarsPlot,atimeWOS,'o')
% title('Without stop')

