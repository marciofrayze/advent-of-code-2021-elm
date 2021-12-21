module Main exposing (..)

import Html exposing (text)

main =
   text (Debug.toString awnser)

awnser = 
    let 
        pairs = 
           parsedInput
               |> List.map2(\n1 n2 -> (n1, n2)) (List.drop 1 parsedInput)
    in 
        pairs
            |> List.map toDelta
            |> List.filter isIncreased
            |> List.length
   
type Delta = Increased | Decreased | NoChange

toDelta(n1, n2) =
    if n1 == n2 then
        NoChange
    else 
        if n1 > n2 then
            Increased
        else
            Decreased

isIncreased delta =
    delta == Increased

parsedInput =
    input
        |> String.lines
        |> List.filterMap String.toInt

        
input : String
input =
    """
199
200
208
210
200
207
240
269
260
263
"""
