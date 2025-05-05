# 移除新子弹标签
tag @s remove new_bullet

# 添加粒子效果(制造枪口火焰)
particle flame ~ ~ ~ 0 0 0 0.01 5
particle smoke ~ ~ ~ 0.1 0.1 0.1 0.01 10

# 保存射击者信息(用于伤害归属)
data modify entity @s data.Owner set from entity @p UUID

# 立即开始子弹飞行
function gun:gun/bullet_travel