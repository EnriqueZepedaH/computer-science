;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname wk1-3-function_definitions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Function Definitions Starter

;Example1
(define (twice num)
    (* 2 num))

(twice 15)

;Example2
(require 2htdp/image)

(define (bulb c)
    (circle 40 "solid" c))

(define TRAFFIC_LIGHT (above (bulb "red")
                             (bulb "yellow")
                             (bulb "green")
                        )
)

TRAFFIC_LIGHT