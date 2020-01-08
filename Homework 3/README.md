# Homework 3 - MIPS Program (Recurrence Equation)

### Task
* Use MIPS instructions to calculate recurrence equation as follow :
  + T(n) = 2 * T(n / 2) + c, if n >= 2.
  + T(n) = c, if n < 2.
* Input : Read from `input.txt`. The input format has the form `<n>,<c>`, where both n and c are 2-digit integers, with
  + n = 2, 4, 8, 16, 32, 64.
  + 1 <= c <= 20.
  + For example, `04,03` and `32,15`.
* Output : Write to `output.txt`. Output the result as 4-digit integer. For example, if the input is `04,03`, then output `0036`. If the input is `32,15`, then output `2880`.
