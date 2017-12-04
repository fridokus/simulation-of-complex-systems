%% Testa funktioner
clear all
clc

nbrOfCars = 4;
nbrOfParameters = 8;
cars = zeros(nbrOfCars,nbrOfParameters);
acceleration = ones(nbrOfCars,1);

nodes = [100,0;0,100;100,100;0,0];
roads = [4,2;2,3;3,1;1,4];

cars(1:2,2) = 1; 
cars(3:4,2) = 2;

velocity = cars(:,4);
newVelocity = uppdateVelocity(velocity,acceleration);
cars(:,4) = newVelocity;

roadDecision = [0;1;1;0];

cars = uppdatePosition(cars,roadDecision,nodes,roads)

%%

route = [1,2,3,4,4,3,2,1,0;
         2,3,4,1,1,4,3,2,0;
         4,3,2,1,1,2,3,4,0];
     
 nextRoadIndex = [1,2,9]

 for i = 1:3
    if route(i,nextRoadIndex(i)) == 0
        nextRoadIndex(i) = 1;
    end
 end

route(:,nextRoadIndex)


