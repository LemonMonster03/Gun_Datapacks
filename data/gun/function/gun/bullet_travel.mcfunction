# 向前移动一小段距离
tp @s ^ ^ ^0.5

# 添加子弹飞行粒子
particle dust{color: [0.0, 0.0, 1.0], scale: 1.0} ~ ~1 ~ 0.1 0.1 0.1 1 10
particle crit ~ ~1 ~ 0 0 0 0 1

# 检测碰撞实体(mob、player等)
execute positioned ~ ~ ~ if entity @e[type=#gun:hostile,distance=..4.7,sort=nearest,limit=1] run function gun:gun/bullet_hit

# 检测碰撞方块(实心方块)
execute unless block ~ ~ ~ #gun:non_solid run function gun:gun/bullet_remove

# 如果没有碰撞，且飞行距离未达上限，继续飞行
# 注意：这是递归调用，确保有终止条件防止无限循环
execute positioned ~ ~ ~ unless entity @e[type=#gun:hostile,distance=..0.7] if block ~ ~ ~ #gun:non_solid positioned ^ ^ ^0.5 if entity @s[distance=..30] run function gun:gun/bullet_travel

# 如果已飞行足够远，移除子弹
execute if entity @s[distance=30..] run kill @s