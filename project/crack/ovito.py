import ovito
from ovito.io import import_file
pipeline =  import_file("logs/mass_0.5/dump.crack")
data=pipeline.compute()
# Модифицируем нашу загруженную систему
import ovito.modifiers as md
pipeline.add_to_scene()

# Создаем видео

import math
import ovito.vis as vis
import math
import numpy as np

# Извлекаем размер ячейки
wall=data.cell[0][0]

# Создаем объект визуализации
vp = vis.Viewport()
vp.camera_pos = (55.5797, 40.2117, -200)
vp.camera_dir = (0, 0, 1)
vp.type = vis.Viewport.Type.Perspective
vp.zoom_all()
vp.render_image(size=(400,300), filename="animation.png",
renderer=vis.TachyonRenderer())
#vp.render_anim(size=(640, 480), filename="animation.mp4",
# renderer=vis.TachyonRenderer(), range=(0,10))