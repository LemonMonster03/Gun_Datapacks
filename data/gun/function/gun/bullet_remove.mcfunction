# 添加撞击粒子效果
particle minecraft:smoke ~ ~1 ~ 0.1 0.1 0.1 2 100 normal

# 添加撞击音效
playsound block.stone.break block @a ~ ~ ~ 0.5 1
playsound entity.arrow.hit block @a ~ ~ ~ 0.5 1.5

# 在撞击点生成小型爆炸效果(可选)
# summon area_effect_cloud ~ ~ ~ {Radius:0.5f,Duration:10,Effects:[]}

# 移除子弹