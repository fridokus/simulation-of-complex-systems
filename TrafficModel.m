clc
clear all

T = 100;
deltaT = 1;

ROAD_END_1 = 50;

numberOfCars = 4;
numberOfVar = 3;
cars = zeros(numberOfCars,numberOfVar);

%%% Initial conditions (lägg i funktion?)
constantVelocity = 1;
road = 1;
cars(:,1) = 1:2:numberOfCars*2;
cars(:,2) = constantVelocity; 
cars(:,3) = 1;
%%%

for t = 1:T 
    for c = 1:numberOfCars
        position = cars(c,1);
        velocity = cars(c,2);
        road = cars(c,3);
        newPosition = UppdatePosition(position,velocity,deltaT);
        cars(c,1) = newPosition;
    end
    PlotFunction(cars,ROAD_END_1);
end


  
        
