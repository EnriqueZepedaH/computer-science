# BSL (Beginning Student Language)

### Constant Definition

In this section you will learn about constant definitions, forming constant definitions and rules for evaluating constants. 

**Syntax:**
```
(define <name> <expression>)
```

**Example**
```
; We are defining variables for widht, height and area of a 200x300 rectangle

(define WIDTH 300)
(define HEIGTH 200)

(define AREA (* WIDTH HEIGHT))

AREA

-----
Output: 600
```

### Function Definitions

This section covers function definitions, as well as the rules for forming function definitions and rules for evaluating function calls.

**Syntax:**
```
(define <function_name> <parameter>)
    (<function_body>)
```

**Example1**
```
; Function Definitions Starter

(define (twice num)
    (* 2 num))

(twice 15)

-----
Output: 30
```

**Example2**
```
(require 2htdp/image)

(define (bulb c)
    (circle 40 "solid" c))

(define TRAFFIC_LIGHT (above (bulb "red")
                             (bulb "yellow")
                             (bulb "green")
                        )
)

-----
Output: 30
```