function cars = updatNextRoadInRouteIndex(cars,routes,roadDecision)

    global nextRoadInRouteIndex;
    global nextRoadIndex;
    
    nbrOfCars = size(cars,1);
    cars(:,nextRoadInRouteIndex) = cars(:,nextRoadInRouteIndex) + roadDecision;
    
    for i = 1:nbrOfCars
        if (routes(i,cars(i,nextRoadInRouteIndex)) == 0)
            cars(i,nextRoadInRouteIndex) = 1;
        else
            cars(i,nextRoadIndex) = routes(i,cars(i,nextRoadInRouteIndex));
        end
        
    end
    
end