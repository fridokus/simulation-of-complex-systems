function saveTargetCar = saveTargetCars(cars, nIteration,saveTargetCar)

    global targetCar;
    
    saveTargetCar(:,nIteration) = cars(:,targetCar);
    save('saveVision.mat','saveTargetCar','-append')
    
end