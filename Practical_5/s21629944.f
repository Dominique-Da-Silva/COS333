        ! Dominique Da Silva 21629944
        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        program statistics
                implicit none
                ! Note to self that all variable declarations muct be done before executable statements such as print/ call or any subroutines/functions are called.
                integer, parameter :: n = 5
                ! number of elements in the array
                integer :: arr(n)
                ! declare an array of integers in which to store the values
                integer :: small, large, modeValue
                ! declare variables to store the smallest, largest, and mode values

                ! notify the compiler of the suroutines to be called
                interface
                        subroutine readData(arr)
                        integer, dimension(:), intent(inout) :: arr
                        end subroutine readData

                        function findSmallest(arr)
                        integer, dimension(:), intent(in) :: arr
                        integer :: findSmallest
                        end function findSmallest

                        function findLargest(arr)
                        integer, dimension(:), intent(in) :: arr
                        integer :: findLargest
                        end function findLargest

                        function findMode(arr)
                        integer, dimension(:), intent(in) :: arr
                        integer :: findMode
                        end function findMode
                end interface


                !call the subroutine to read in the data into the declared array
                call readData(arr)
                ! print *, "The array you entered is: ", arr

                !call the subroutines to find the smallest, largest, and mode values
                small = findSmallest(arr)
                large = findLargest(arr)
                modeValue = findMode(arr)

                !print the results to the screen
                print *, "The smallest value is:", small
                print *, "The largest value is:", large
                print *, "The mode value is:", modeValue
        end program statistics


        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ! subroutine to read in the data into the declared array that the user has entered
        subroutine readData(arr)
                implicit none
                integer, dimension(:), intent(inout) :: arr
                integer :: i
            
                print *, "Enter value for arr & press enter:"
                ! Note to self that the fortran compiler does not like long sentences, keep ot short and sweet when printing to the screen
                do i = 1, size(arr)
                    read *, arr(i)
                end do
        end subroutine readData
            

        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ! subroutine to find the smallest value in the array
        function findSmallest(arr) result(small)
                implicit none
                integer, dimension(:), intent(in) :: arr
                integer :: small
            
                small = minval(arr)
        end function findSmallest
            


        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ! subroutine to find the largest value in the array
        function findLargest(arr) result(large)
                implicit none
                integer, dimension(:), intent(in) :: arr
                integer :: large
            
                large = maxval(arr)
        end function findLargest



        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ! subroutine to find the mode value in the array
        ! had to change the function name as mode is a reserved word in fortran
        function findMode(arr) result(modeValue)
                implicit none
                integer, dimension(:), intent(in) :: arr
                integer :: modeValue, i, j, maxCount, count
            
                maxCount = -1
                modeValue = arr(1)
            
                do i = 1, size(arr)
                    count = 0
                    do j = 1, size(arr)
                        if (arr(i) == arr(j)) then
                            count = count + 1
                        end if
                    end do
                    if (count > maxCount) then
                        maxCount = count
                        modeValue = arr(i)
                    end if
                end do
        end function findMode



        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
        ! Test cases for demo:
        !
        !
        !