# How to Design Data

In this module we begin learning how to design data representations of problem domain information. While systems tend to have more function designs than data designs, the design of the data turns out to drive the design of the functions. So data design is a critical part of program design.

## Learning Goals
- Be able to use the How to Design Data Definitions (HtDD) recipe to design data definitions for atomic data.
- Be able to identify problem domain information that should be represented as simple atomic data, intervals, enumerations, itemizations and mixed data itemizations.
- Be able to use the Data Driven Templates recipe to generate templates for functions operating on atomic data.
- Be able to use the How to Design Functions (HtDF) recipe to design functions operating on atomic data.

## Data definitions

Data definitions explain how information is represented as data. This is a crucial part of program design and has a significant effect on the design of every function that operates on that data.


## How to Design Data (HtDD)
Data definitions are a driving element in the design recipes.

A data definition establishes the represent/interpret relationship between information and data:

- Information in the program's domain is represented by data in the program.
- Data in the program can be interpreted as information in the program's domain.

A data definition must describe how to form (or make) data that satisfies the data definition and also how to tell whether a data value satisfies the data definition. It must also describe how to represent information in the program's domain as data and interpret a data value as information.

So, for example, one data definition might say that numbers are used to represent the Speed of a ball. Another data definition might say that numbers are used to represent the Height of an airplane. So given a number like 6, we need a data definition to tell us how to interpret it: is it a Speed, or a Height or something else entirely? Without a data definition, the 6 could mean anything.

**Steps**

The first step of the recipe is to identify the inherent structure of the information.

Once that is done, a data definition consists of four or five elements:

1. A possible structure definition (not until compound data)
1. A type comment that defines a new type name and describes how to form data of that type.
1. An interpretation that describes the correspondence between information and data.
1. One or more examples of the data.
1. A template for a 1 argument function operating on data of this type.

In the first weeks of the course we also ask you to include a list of the template rules used to form the template.

### What is the Inherent Structure of the Information?

| Information to be represented...| Data definition type       |
|---------------------------------|----------------------------|
| is atomic                       | Simple Atomic Data         |
| is numbers within a certain range | Interval                 |
| consists of a fixed number of distinct items | Enumeration  |
| is comprised of 2 or more subclasses, at least one of which is not a distinct item | Itemization   |
| consists of two or more items that belong together  | Compound data |
| is naturally composed of different parts   | References to other defined type  |
| is of arbitrary (unknown) size   | self-referential or mutually referential |

## Common Data Representations / Information Structure

### Simple Atomic Data
Use simple atomic data when the information to be represented is itself atomic in form, such as the elapsed time since the start of the animation, the x coordinate of a car or the name of a cat.

```
;; Time is Natural
;; interp. number of clock ticks since start of game

(define START-TIME 0)
(define OLD-TIME 1000)

#;
(define (fn-for-time t)
  (... t))

;; Template rules used:
;;  - atomic non-distinct: Natural
```

**Forming the Template**

As noted below the template, it is formed according to the [Data Driven Templates](#data-driven-templates) recipe using the right hand column of the atomic non-distinct rule.


**Guidance on Data Examples and Function Example/Tests**

One or two data examples are usually sufficient for simple atomic data.

When creating example/tests for a specific function operating on simple atomic data at least one test case will be required. Additional tests are required if there are multiple cases involved. If the function produces Boolean there needs to be at least a true and false test case. Also be on the lookout for cases where a number of some form is an interval in disguise, for example given a type comment like Countdown is Natural, in some functions 0 is likely to be a special case.

### Intervals
Use an interval when the information to be represented is numbers within a certain range. `Integer[0, 10]` is all the integers from 0 to 10 inclusive; `Number[0, 10)` is all the numbers from 0 inclusive to 10 exclusive. (The notation is that [ and ] mean that the end of the interval includes the end point; ( and ) mean that the end of the interval does not include the end point.)

Intervals often appear in [itemizations](#itemizations), but can also appear alone, as in:
```
;; Countdown is Integer[0, 10]
;; interp. the number of seconds remaining to liftoff
(define C1 10)  ; start
(define C2 5)   ; middle
(define C3 0)   ; end
 
#;
(define (fn-for-countdown cd)
  (... cd))

;; Template rules used:
;;  - atomic non-distinct: Integer[0, 10]
```
**Forming the Template**

As noted below the template, it is formed according to the [Data Driven Templates](#data-driven-templates) recipe using the right hand column of the atomic non-distinct rule.

**Guidance on Data Examples and Function Example/Tests**

For data examples provide sufficient examples to illustrate how the type represents information. The three data examples above are probably more than is needed in that case.

When writing tests for functions operating on intervals be sure to test closed boundaries as well as midpoints. As always, be sure to include enough tests to check all other points of variance in behaviour across the interval.

### Enumerations

### Itemizations

### Compound Data Structures

### References to other data definitions

## Data Driven Templates
Templates are the core structure that we know a function must have, independent of the details of its definition. In many cases the template for a function is determined by the type of data the function consumes. We refer to these as data driven templates. The recipe below can be used to produce a data driven template for any type comment.

For a given type `TypeName` the data driven template is:

```
(define (fn-for-type-name x)
  <body>)
```

Where x is an appropriately chosen parameter name (often the initials of the type name) and the body is determined according to the table below. To use the table, start with the type of the parameter, i.e. TypeName, and select the row of the table that matches that type. The first row matches only primitive types, the later rows match parts of type comments.

<iframe src="./resources/data-driven-templates.html" width="100%" height="500px"></iframe>
