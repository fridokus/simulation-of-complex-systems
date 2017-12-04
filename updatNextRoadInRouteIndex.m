function cars = updatNextRoadInRouteIndex(cars,routes,roadDecision)

    global nextRoadInRouteIndex;
    global nextRoadIndex;
    
    nbrOfCars = size(cars,1);
    cars(:,nextRoadInRouteIndex) = cars(:,nextRoadInRouteIndex) + roadDecision;
    
    for i = 1:nbrOfCars
        if (routes(i,cars(i,nextRoadInRouteIndex)) == 0)
            cars(i,nextRoadInRouteIndex) = 1;
        end
         cars(i,nextRoadIndex) = cars(i,nextRoadIndex)*(1-roadDecision(i)) + routes(i,cars(i,nextRoadInRouteIndex))*(roadDecision(i));
    end
    
end