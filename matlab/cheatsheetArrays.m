% MATLAB Training Notes

row_vector1 = [1, 2, 3, 4, 5, 6]
row_vector2 = [1 2 3 4 5 6]
column_vector = [1 2; 3 4; 5 6]

vector_with_specific_interval = 1:2:10
vector_of_set_number_of_elements = linspace(1,10,5)

matrix_with_uni_dist_rand_numbers = rand(3,5)
matrix_with_norm_dist_rand_numbers = randn(3,5)
matrix_with_norm_dist_rand_integers_maxValue10 = randi(10,3,5)
matrix_with_norm_dist_rand_integers_maxValue10minValue2 = randi([2 10],3,5)
matrix_with_uni_dist_rand_numbers_maxValue10minValue2 = 2 + (10-2)*rand(3,5)
matrix_with_norm_dist_rand_numbers_mean10sd3 = 10 + 3*randn(3,5)

vertical_concatenation = [row_vector1;row_vector2]
horizontal_concatenation = [row_vector1, row_vector2]

reshape_vector_to_matrix_columnwise = reshape(row_vector1, 2, 3)
reshape_vector_to_matrix_columnwise_autodim = reshape(row_vector1, [], 3)
reshape_matrix_to_column_vector = reshape_vector_to_matrix_columnwise(:)