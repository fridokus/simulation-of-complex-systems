function saveNextRoad = saveNextRoads(cars, nIteration,saveNextRoad)
    saveNextRoad(:,nIteration) = cars(:,8);
    save('saveNextRoad.mat','saveNextRoad','-append')
 end