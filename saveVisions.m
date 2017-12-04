function saveVision = saveVisions(cars, nIteration,saveVision)
    saveVision(:,nIteration) = cars(:,7);
    save('saveVision.mat','saveVision','-append')
 end