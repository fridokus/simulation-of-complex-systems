function newVelocity = updateVelocity(oldVelocity,acceleration)
    % Update velocity
    global timeStep;
    newVelocity = oldVelocity + timeStep*acceleration;
end
