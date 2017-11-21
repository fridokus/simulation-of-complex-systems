clc
clear all

T = 10000;
deltaT = 1;

ROAD_END_1 = 50;

numberOfCars = 2;
numberOfVar = 3;
numberOfRoads = 1;
nuberOfCarsAtRoad = zeros(numberOfRoads,1);

cars = zeros(numberOfCars,numberOfVar);

%%% Initial conditions (lägg i funktion?)
constantVelocity = 1;

nuberOfCarsAtRoad(:) = 2;
cars(:,1) = 1:5:numberOfCars*5;
cars(2,2) = 0.01;
cars(1,2) = 0.1;
cars(:,3) = ones(numberOfCars,1);
%%%

for t = 1:T 
    for c = 1:numberOfCars
        position = cars(c,1);
        velocity = cars(c,2);
        road = cars(c,3);
        newPosition = UppdatePosition(position,velocity,deltaT);
        cars(c,1) = newPosition;
    end
    r = 1;
    i = 0;
    for s = 1:numberOfRoads
        r = r + i;
        i = i + nuberOfCarsAtRoad(r);
        carsAtRoad = cars(r:i,1:2);
        carsAtRoad = Collision(carsAtRoad);
        cars(r:i,1:2) = carsAtRoad;
    end    
    PlotFunction(cars,ROAD_END_1);
end


  
        
