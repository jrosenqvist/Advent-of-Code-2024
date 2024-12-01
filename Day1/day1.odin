package day1

import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"

input := #load("input", string)

left_values: [dynamic]int
right_values: [dynamic]int

main :: proc() {
	for str in strings.split_lines_iterator(&input) {
		str_slice := strings.fields(str)
		left, _ := strconv.parse_int(str_slice[0])
		right, _ := strconv.parse_int(str_slice[1])
		append(&left_values, left)
		append(&right_values, right)
	}

	fmt.printfln("First part: %v", solve_first_part())
	fmt.printfln("Second part: %v", solve_second_part())
}

solve_first_part :: proc() -> int {
	slice.sort(left_values[:])
	slice.sort(right_values[:])

	total_distance: int

	for i in 0 ..< len(left_values) do total_distance += abs(left_values[i] - right_values[i])

	return total_distance
}

solve_second_part :: proc() -> int {
	similarity_score: int

	for elem in left_values {
		count := slice.count(right_values[:], elem)
		similarity_score += count * elem
	}

	return similarity_score
}
