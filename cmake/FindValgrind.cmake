find_program(VALGRIND_EXECUTABLE valgrind)
mark_as_advanced(VALGRIND_EXECUTABLE)
include(CMakeDependentOption)
cmake_dependent_option(TEST_VALGRIND "Running tests using valgrind" OFF "VALGRIND_EXECUTABLE" OFF)
mark_as_advanced(TEST_VALGRIND)

function(valgrind_test NAME COMMAND)
	if(TEST_VALGRIND)
		add_test(${NAME}[valgrind] ${VALGRIND_EXECUTABLE} --leak-check=full --quiet --error-exitcode=1 ${COMMAND})
	endif()
	add_test(${NAME} ${COMMAND})
endfunction()

