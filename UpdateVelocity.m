function newVelocity = uppdateVelocity(oldVelocity,acceleration,timeStep)
    % Uppdate velocity
    
    newVelocity = oldVelocity + timeStep*acceleration;
     
end
