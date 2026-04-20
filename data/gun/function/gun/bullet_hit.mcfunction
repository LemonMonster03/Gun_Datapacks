# 对命中的实体造成伤害（动态伤害，归属于最近玩家，无视盾牌）
$execute as @e[type=#gun:hostile,distance=..1.3,sort=nearest,limit=1] run damage @s $(damage) gun:bullet by @p

# 命中粒子（小范围暴击星星）
particle minecraft:crit ~ ~ ~ 0.1 0.2 0.1 0.1 5 normal

# 命中音效
playsound minecraft:entity.arrow.hit_player player @a ~ ~ ~ 1 1
playsound minecraft:entity.player.hurt neutral @a ~ ~ ~ 0.5 1
