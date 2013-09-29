# this code working under the assumption that every column of pixel
# in the fill area must be continuous. That means if two to-be-filled
# vertically continuous set of pixels in a same column is separated
# by a vertically continuous set of not-to-be-filled pixels then that
# two set of pixels are treated as two columns of pixel in the
# fill area

def fill_area(x,y,fill_color, ori_color)
	points = []
	# nearest up point
	points[0] = [x, y-1]
	# nearest down point
	points[1] = [x, y+1]
	# nearest left point
	points[2] = [x-1, y]
	# nearest right point
	points[3] = [x+1, y]

	for i in 0..points.length-1

		surround_x = points[i][0]
		surround_y = points[i][1]
		# get the color of the surrounding point with color(x,y) method
		surround_color = color(surround_x, surround_y)
		# get the color of the current point
		current_color = color(x,y)

		# compare color of the surrounding point with current point
		# if return true, the surrounding point is a boundary point
		# if false then call the recursive method
		if surround_color != current_color
			# check to fill current point
			if current_color == fill_color
				# do nothing
			else
				# fill color with the set_color(x,y,fill_color) method
				set_color(x,y,fill_color)
			end
		else
			fill_area(surround_x,surround_y,fill_color,ori_color)
		end
	end
end