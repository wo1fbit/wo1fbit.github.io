---
layout: page
title: Go
permalink: /golang/
---

# golang
### IMPORTANT

1. "package main" is a must, tells the Go compiler that the package should compile as an executable program instead of a shared library
2. The "main()" function is a must, when the program is executed, it is the entry point.
3. All variables, constants, arrays, slices, maps etc.. and their datatypes must be declared before usage

# Print to output

```
package main
import "fmt"

// 1st method
func main() {
  fmt.Println("Hello world") //this is a comment
  fmt.Printf("Hello world")
}

// 2nd method
func main() {
  x := "Hello world"
  fmt.Printf("%s", x)
}

```

# Declare variables

```
package main
import "fmt"

func main(){
  // 1st method
  var x string = "Hello World"
  var y int = 156
  fmt.Println(x)
  fmt.Println(y)
  
  // 2nd method
  var x string
  x = "Hello World"
  var y int
  y = 1
  fmt.Println(x)
  fmt.Println(y)
  
  // 3rd method
  x := "Hello World"
  y := 5
  fmt.Println(x)
  fmt.Println(y)
  
  //4th method
  var (
      a = 5
      b = "Hello World"
  )
}
```

# Set Constants
```
package main
import "fmt"

func main() {
  const x = "Hello World"
  const y = 5
  fmt.Println(x)
  fmt.Println(y)
}
```
---

# Functions
```
// To create a function you use "func" followed by the function name i.e

func hello(){
}
```

# Function with no arguments
```
package main
import fmt

func hello_function(){
  fmt.Println("Hello World")
}

func main(){
  hello_function()
}
```
---
# Function with arguments
```
package main
import "fmt"

func say_hello(p string) {
  fmt.Println(p)
}

func main(){
  say_hello("Hello World")
}
```
---
# Function with multiple arguments
```
package main
import "fmt"

func say_hello_and_print_number(p string, x int){
  fmt.Println(p)
  fmt.Println(x)
}

func main() {
  say_hello_and_print_number("Hello World", 15)
}
```
---
# Functions with arbitrary number of arguments/Variadic functions
```
package main
import "fmt"

func arb_args(nums ...int){
  fmt.Print(nums, " ")
}
func main() {
  arb_args(1, 2)
  arb.args(1, 56, 78, 90)
}
```
---

# Loops
~~~
Technically golang has only one loop - the "for" loop that can also act as a while loop.
~~~

```
package main
import "fmt"

// 1st method 
func main() {
  x := 0
  for x<= 100 {
    fmt.Println(x)
    x++
  }
}

// 2nd method
func main() {
  for i := 0; i<=100 ; i++ {
    fmt.Println(i)
  }
}
```

# If statements

```
package main
import "fmt"

func main(){
  x := 1
  
  //if
  if x == 1{
    fmt.Println("X is equal to 1")
  } 
  
  //if else
  if x == 1 {
    fmt.Println("X is equal to 1")
  } else {
    fmt.Println("X is not equal to 1")
  }
  
  // else if
  if x == 1 {
    fmt.Println("X is equal to 1")
  } else if x != 1 {
    fmt.Println("X is not equal to one")
  }  else {
    fmt.Println("I don't know waht X is equal to")
  }
}
```
# Switch ..Case
```
package main
import "fmt"

func main() {
  x := 1
  switch x {
   case 0:
    fmt.Println("x is 0")
   case 1:
    fmt.Println("x is 1")
   case 2:
    fmt.Println("x is 2")
   default:
    fmt.Println("X is a number :)")
  }
}

```
# Read / Write files

```
package main
import (
  "fmt"
  "os"
)

func main() {
// WRITE TO FILE
 file, err := os.Create("Filename")
 if err == nil {
  _, err := file.WriteString("What to write") **add contents to the file**
  if err != nil {
   fmt.Println("Failed to write to file")
  }
 }

 // READ FROM FILE
 data, err := os.ReadFile("Filename")
 if err == nil {
  fmt.Println(string(data))
 }
}
```
