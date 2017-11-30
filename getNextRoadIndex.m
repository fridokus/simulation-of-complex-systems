function nextRoadIndex = getNextRoadIndex(currentRoad, roads)

  connectingRoads = find(roads(currentRoad,2)==roads(:,1));
  if length(connectingRoads) > 1
    r = randi(length(connectingRoads));
    nextRoadIndex = roads(r);
  else
    nextRoadIndex = connectingRoads;
  end
  
end