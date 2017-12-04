function saveMaxDeacceleration = saveMaxDeaccelerations(cars, nIteration,saveMaxDeacceleration)
    saveMaxDeacceleration(:,nIteration) = cars(:,6);
    save('saveMaxDeacceleration.mat','saveMaxDeacceleration','-append')
 end