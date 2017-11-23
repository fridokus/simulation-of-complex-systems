function newVelocity = UpdateVelocity(oldVelocity,acceleration)
    % Update velocity
    global timeStep;
    newVelocity = oldVelocity + timeStep*acceleration;
end
