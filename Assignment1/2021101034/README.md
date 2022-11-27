# CSO Assignment 1
# Name: Abhinav Reddy Boddu
# Roll Number: 2021101034
# File Structure:
```
2021101034
├── q1
│   ├── q1.c
│   └── q1.s
├── q2
│   ├── q2.c
│   └── q2.s
├── q3
│   ├── q3.c
│   └── q3.s
├── q4
│   ├── q4.c
│   └── q4.s
└── q5
    ├── q5.c
    └── q5.s
```

# Q1:
* if denominator is 0 , returning -1
* Calculating the quotient and remainder such that remainder is always positive
* used the function name `"remaindr"` instead of `"remainder"` because of conflict with the inbuilt `"remainder"` function

# Q2:
* assuming `gcd(a,b)=gcd(|a|,|b|)` and `gcd(a,0)=|a|`

# Q3:
* if `N<=1` returing `-1` (Note: the main code is written to print "False" irrespective of the function returing 0 or -1)
* if N is Prime returing 1
* if N is Not Prime returing 0

# Q4:
* Reusing the code from Q3 to check prime.
* Prints 1 for `n=1` (special case)
* Prints -1 if `n<=0`
  
# Q5:
* if `N<=0` Prints -1
* Taken Care of Overflow cases.