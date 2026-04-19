# 射线超出最大距离（15格）则终止
execute unless entity @s[distance=..15] run return 0

# 检查是否命中实体 → 造成伤害并终止（不触发墙壁撞击效果）
execute positioned ~ ~-0.6 ~ if entity @e[type=#gun:hostile,distance=..1.3,sort=nearest,limit=1] run function gun:gun/bullet_hit
execute positioned ~ ~-0.6 ~ if entity @e[type=#gun:hostile,distance=..1.3,sort=nearest,limit=1] run return 0

# 飞行粒子
particle crit ~ ~ ~ 0 0 0 0 1

# 碰到实心方块 → 墙壁撞击效果并终止
execute unless block ~ ~ ~ #gun:non_solid run function gun:gun/bullet_remove
execute unless block ~ ~ ~ #gun:non_solid run return 0

# 继续前进0.5格递归检测
execute positioned ^ ^ ^0.5 run function gun:gun/bullet_raycast
