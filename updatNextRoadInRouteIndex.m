function cars = updatNextRoadInRouteIndex(cars,routes,roadDecision)

    global nextRoadInRouteIndex;
    global nextRoadIndex;
    
    nbrOfCars = size(cars,1);
    cars(:,nextRoadInRouteIndex) = cars(:,nextRoadInRouteIndex) + roadDecision;
    
    for i = 1:nbrOfCars
        if (routes(i,cars(i,nextRoadInRouteIndex)) == 0)
            cars(i,:) = [1e8 0 0 0 0 0 0 0 0];
        else if (routes(i,cars(i,nextRoadInRouteIndex)) == -1)
                cars(i,nextRoadInRouteIndex) = 2;
                cars(i,nextRoadIndex) = getNextRoadIndex(currentRoad, roads);
                routes(i,2) = cars(i,nextRoadIndex);
        else
            cars(i,nextRoadIndex) = routes(i,cars(i,nextRoadInRouteIndex));
        end
        
    end
    
end
