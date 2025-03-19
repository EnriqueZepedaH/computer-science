;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname other_figures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

; 3D Spoon
(overlay ( ellipse 5 20 "solid" "light gray")
         ( ellipse 15 30 "solid" "silver")
         ( ellipse 25 40 "solid" "gray")
         ( ellipse 35 50 "solid" "dark gray")
         ( ellipse 45 60 "solid" "dim gray")
         ( rectangle 8 90 "solid" "grey") )


; (require 2htdp/image)
; Little Cottage
(above (triangle 40 "solid" "gray")
       (overlay (rectangle 10 20 "solid" "white")
                (square 40 "solid" "black"))
       (square 40 "solid" "transparent"))

; A man doing a wow face with hexagonal eyes and yellow pupils
(overlay (circle 100 "outline" "red")
         (above (beside (overlay (circle 8 "solid" "yellow")
                                 (regular-polygon 20 6 "solid" "blue"))
                        (rectangle 40 20 "solid" "white")
                        (overlay (circle 8 "solid" "yellow")
                                 (regular-polygon 20 6 "solid" "blue")))
                (rectangle 40 50 "solid" "white")
                (ellipse 50 15 "solid" "black")))