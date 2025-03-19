;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mexican-flag) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; File to draw Mexican Flag
(require 2htdp/image)

(define flag-width 300)
(define flag-height 200)

; Define colors
(define white (rectangle (/ flag-width 3) flag-height "solid" "white"))
(define green (rectangle (/ flag-width 3) flag-height "solid" "darkgreen"))
(define red (rectangle (/ flag-width 3) flag-height "solid" "firebrick"))

; Define replacement for eagle
(define brown-circle (circle 30 "solid" "brown"))

; Define the flag
(define mexican-flag (overlay brown-circle (beside green white red)))

;Show the flag
mexican-flag
