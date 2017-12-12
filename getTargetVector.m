function targetVector = getTargetVector(numberOfTargetCars,numberOfStandardCars)

    targetVector = zeros(1,numberOfTargetCars+numberOfStandardCars);
    t1 = ones(1,numberOfTargetCars);
    t2 = -1*ones(1,numberOfStandardCars);
    
    if numberOfTargetCars == 0
        targetVector = t2;
    elseif numberOfStandardCars == 0 
        targetVector = t1;
    else
        t = 0;
        s = 0;
        f = numberOfTargetCars/(numberOfTargetCars+numberOfStandardCars);
        for i = 1:(numberOfTargetCars+numberOfStandardCars)
            r = rand;
            if r < f && t < numberOfTargetCars
                targetVector(i) = 1;
                t =t + 1;
            elseif s >= numberOfStandardCars
                targetVector(i) = 1;
            else
                targetVector(i) = -1;
            end
        end
    end
end
