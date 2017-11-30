function nextRoadIndex = getNextRoadIndex(currentRoad, roads)
  
  endNode = roads(currentRoad, 2);
  connectingRoads = find(endNode==roads(:,1));
  if length(connectingRoads) > 1
    r = randi(length(connectingRoads));
    nextRoadIndex = connectingRoads(r);
  else
    nextRoadIndex = connectingRoads;
  end
  
end