# Homework 2 - MIPS Program (Simple Calculator)

### Task
* Use MIPS instructions to implement simple calculator which supports `+`, `-`, `*`, and `/` operation.
* Input : Read from `input.txt`. The input format has the form `<number1><operator><number2>`, where both number1 and number2 are 2-digit integers with 0 <= number1, number2 < 100, for example, `02+99`.
* Output : Write to `output.txt`.
  + If the operator is `+`, `-`, `*`, or `/`, then output the result as 4-digit integer. For example, if the input is `02+99`, then output `0101`.
  + If the operator is unsupported operator, or divided by 0 occurs, then output `XXXX`.
