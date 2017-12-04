function saveMaxVelocity = saveMaxVelocities(cars, nIteration,saveMaxVelocity)
    saveMaxVelocity(:,nIteration) = cars(:,3);
    save('saveMaxVelocity.mat','saveMaxVelocity','-append')
 end