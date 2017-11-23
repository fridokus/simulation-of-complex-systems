function newVelocity = UpdateVelocity(oldVelocity,acceleration,timeStep)
    % Update velocity
    newVelocity = oldVelocity + timeStep*acceleration;
end
