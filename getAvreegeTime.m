function [atimeWOS,atime,atimeTarget,atimeStandard] = getAvreegeTime(saveTargetCar,nbrTCars)

    global timeStep;
    
    nbrCars = size(saveTargetCar,1);
    nbrSCars = nbrCars - nbrTCars;
%     timeWithoutStop = zeros(1,nbrCars);
%     pos = [];
%     for i = 1:nbrCars
%         pos1 = saveTargetCar(i,:); 
%         here = find(saveTargetCar(i,:) ~= 0);
%         pos2 = pos1(here(1):here(end));
%         pos(1) = pos2(1);
%         pos(2) = pos2(2);
%         k = 3;
%         for j = 1:length(pos2)-2
%             if pos(k-2) ~= pos2(j+2)
%                 pos(k) = pos2(j+2);
%                 k = k +1;
%             end
%         end
%         timeWithoutStop(i) = length(pos); 
%     end
    
    time = zeros(1,nbrCars);
    timeTarget = [];
    timeStandard = [];
    for i = 1:nbrCars
        here = find(saveTargetCar(i,:) ~= 0);
        time(i) = here(end) - here(1);
        if saveTargetCar(i,here(1)) == 1
            timeTarget(end + 1) = time(i);
        elseif saveTargetCar(i,here(1)) == -1
            timeStandard(end + 1) = time(i);
        end
    end
    
    
    atimeWOS = 1;
    atime = timeStep*sum(time)/nbrCars;
    atimeTarget = timeStep*sum(timeTarget)/nbrTCars;
    atimeStandard = timeStep*sum(timeStandard)/nbrSCars;
end


