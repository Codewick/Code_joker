require 'catpix'

Catpix::print_image "2.jpg",
  :limit_x => 1.0,
  :limit_y => 1.0,
  :center_x => true,
  :center_y => true,
  :bg => "white",
  :bg_fill => true
