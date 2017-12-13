function [velocityTargetCars, velocityStandardCars] = getAverageVelocity(velocityMatrix, targetMatrix, roadIndices)
    
    numberOfCars = size(velocityMatrix, 1);
    velocityTargetCars = 0;
    velocityStandardCars = 0;
    numberOfTargetCars = 0;
    targets = sum(targetMatrix,2);
    for i=1:numberOfCars
        velocities = velocityMatrix(i,roadIndices(i,:) ~= 0);
        if targets(i,1) > 0
            numberOfTargetCars = numberOfTargetCars + 1;
            velocityTargetCars = velocityTargetCars + mean(velocities);
        else
            velocityStandardCars = velocityStandardCars + mean(velocities);
        end
    end
    disp(velocityTargetCars)
    disp(velocityStandardCars)
    if numberOfTargetCars > 0
        velocityTargetCars = velocityTargetCars / numberOfTargetCars
    end
    if numberOfCars - numberOfTargetCars > 0
        velocityStandardCars = velocityStandardCars / (numberOfCars - numberOfTargetCars)
    end
    
    
end