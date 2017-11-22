function velocities = updateVelocities(cars, acceleration)
  global positionIndex;
  global roadIndex;
  global maxVelocityIndex;
  global currentVelocityIndex;
  velocities = cars(:,currentVelocityIndex) + acceleration;
  velocities = velocities .* (velocities > 0)

end
