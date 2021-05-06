# The AllocateArray subprogram is incorrect in that the allocation can fall on any boundary.
# This is a problem if the array is of elements that must fall on a specific boundary. For
# example, if the array is contains ints, the array allocation must fall on full word boundary.
# a) Using the PromptString and AllocateArray subprograms, show how this problem can
# 	occur.
# b) Change the AllocateArray program to always do allocations on a double word boundary