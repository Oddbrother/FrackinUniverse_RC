function init()
  animator.setParticleEmitterOffsetRegion("drips", mcontroller.boundBox())
  animator.setParticleEmitterActive("drips", true)
  effect.setParentDirectives("fade=8a6818=0.2")
  script.setUpdateDelta(5)
  self.tickDamagePercentage = 0.03
  self.tickTime = 1.0
  self.tickTimer = self.tickTime
end



function update(dt)
  mcontroller.controlModifiers({
      groundMovementModifier = -0.15,
      runModifier = -0.15,
      jumpModifier = -0.15
    })
    
  self.tickTimer = self.tickTimer - dt
  if self.tickTimer <= 0 then
    self.tickTimer = self.tickTime
    status.applySelfDamageRequest({
        damageType = "IgnoresDef",
        damage = math.floor(status.resourceMax("health") * self.tickDamagePercentage) + 2,
        damageSourceKind = "poison",
        sourceEntityId = entity.id()
      })
  end
end

function uninit()

end