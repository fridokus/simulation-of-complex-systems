function saveMaxAcceleration = saveMaxAccelerations(cars, nIteration,saveMaxAcceleration)
    saveMaxAcceleration(:,nIteration) = cars(:,5);
    save('saveMaxAcceleration.mat','saveMaxAcceleration','-append')
 end