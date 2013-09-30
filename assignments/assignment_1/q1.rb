# This code works under the following assumptions:

# 1/ Every column of pixel in the fill area must be continuous.
# That means if two to-be-filled vertically continuous set of pixels
# in the same column is separated by a vertically continuous set of
# not-to-be-filled pixels then that two set of pixels are treated as
# two columns of pixel in the fill area

# 2/ The area outside of the canvas/fill area (x>x_max || x<0 || y>y_max || y<0)
# always has different color compared to the color of the canvas

# 3/ Other given assumption from the question:
# 	a. original filling point is inside the canvas with height of y_max and width of x_max
# 	b. fill color is always different from original color

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
		# get coordinate of the surrounding point
		surround_x = points[i][0]
		surround_y = points[i][1]

		# get the color of the surrounding point with color(x,y) method
		surround_color = color(surround_x, surround_y)
		# get the color of the current point
		current_color = color(x,y)

		# compare if color of the surrounding point is different form that of current point
		# if true, the surrounding point is a boundary point
		# if false, call the recursive method
		if surround_color != current_color
			# check to fill current point
			if current_color == fill_color
				# do nothing
			else
				# fill the current's cell with the set_color(x,y,fill_color) method
				set_color(x,y,fill_color)
			end
		else
			fill_area(surround_x,surround_y,fill_color,ori_color)
		end
	end
end