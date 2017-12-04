function saveCurrentVelocity = saveCurrentVelocities(cars, nIteration,saveCurrentVelocity)
    saveCurrentVelocity(:,nIteration) = cars(:,4);
    save('saveCurrentVelocity.mat','saveCurrentVelocity','-append')
 end