function saveRoad = saveRoads(cars, nIteration, saveRoad)
    saveRoad(:,nIteration) = cars(:,2);
    save('saveRoad.mat','saveRoad','-append')
 end