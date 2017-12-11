function saveTargetCars = saveTargetCars(cars, nIteration,saveTargetCar)

    global targetCar;
    
    saveTargetCar(:,nIteration) = cars(:,targetCar);
    save('saveTargetCars.mat','saveTargetCar','-append')
    
end