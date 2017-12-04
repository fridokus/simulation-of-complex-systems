function savePosition = savePositions(cars, nIteration,savePosition)
    savePosition(:,nIteration) = cars(:,1);
    save('savePosition.mat','savePosition','-append')
 end