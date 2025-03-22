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
(define <function_name> <parameter1> <parameter2> ... )
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

### Booleans and if Expressions

#### Booleans

This section introduces a new kind of primitive value called a Boolean. Booleans represent the answer to true/false questions. You will also learn about if expressions which allow us to make decisions based on the result of such questions.

```
true    ;a true expression evaluates to this
false   ;a false expression evaluates to this

```

**Predicates** are primitives or functions that produce a boolean value (true or false)

**Predicate Examples**
```
(= 1 2) ;false
(= 1 1) ;true
(> 3 9) ;false
(string=? "foo" "bar")  ;false - since strings are not equal
```

Some boolean primitives are

```
(and <expression> <expression> ...)
(or  <expression> <expression> ...)
(not <expression>)
```

#### if Expressions

**if** Expressions are conditional statements. If a predicate or question evaluates to true then a `<true_answer_expression>` is executed otherwise a `<false_answer_expression>` is executed.

**Syntax**
```
(if <question/predicate_expression>
    <true_answer_expression>
    <false_answer_expression>)
```

