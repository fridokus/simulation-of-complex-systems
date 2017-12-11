function [cars, routes] = updatNextRoadInRouteIndex(cars,routes,roadDecision, roads)

    global nextRoadInRouteIndex;
    global nextRoadIndex;
    global roadIndex;
    
    nbrOfCars = size(cars,1);
    cars(:,nextRoadInRouteIndex) = cars(:,nextRoadInRouteIndex) + roadDecision;
    
    for i = 1:nbrOfCars
        if (routes(i,cars(i,nextRoadInRouteIndex)) == 0)
            cars(i,:) = [1e8 0 0 0 0 0 0 0 0];
        elseif (routes(i,cars(i,nextRoadInRouteIndex)) == -1)
                cars(i,nextRoadInRouteIndex) = 3;
                currentRoad = cars(i,roadIndex);
                cars(i,nextRoadIndex) = getNextRoadIndex(currentRoad, roads);
                routes(i,3) = cars(i,nextRoadIndex);
        else
            cars(i,nextRoadIndex) = routes(i,cars(i,nextRoadInRouteIndex));
        end
        
    end
    
end
