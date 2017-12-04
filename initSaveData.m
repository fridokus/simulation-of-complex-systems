function initSaveData(savePosition,saveRoad,saveMaxVelocity,saveCurrentVelocity,...
    saveMaxAcceleration,saveMaxDeacceleration,saveVision,saveNextRoad)
    save('savePosition.mat','savePosition')
    save('saveRoad.mat', 'saveRoad')
    save('saveMaxVelocity.mat', 'saveMaxVelocity')
    save('saveCurrentVelocity.mat', 'saveCurrentVelocity')
    save('saveMaxAcceleration.mat', 'saveMaxAcceleration')
    save('saveMaxDeacceleration.mat', 'saveMaxDeacceleration')
    save('saveVision.mat', 'saveVision')
    save('saveNextRoad.mat', 'saveNextRoad')
end
