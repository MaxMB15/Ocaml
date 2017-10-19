(*FINALLY GOT MERLIN TO WORK!!!!*)

let test = 4


type 'a rlist = Empty | Rcons of 'a * ('a rlist) ref

                               

(*let rec rapp' r1 r2 = match r1 with
  | v, Empty -> v, r2
  | v, l -> v, (rapp' l r2)*)

let rec rapp r1 r2 = match r1 with
  | {contents = Empty} -> r1 := !r2
  | {contents = Rcons (x, xs)} -> rapp xs r2


type counter_obj = {tick: unit -> int ; reset : unit -> unit}
                 
let makeCounter () =                               
  let counter = ref 0 in
    {tick = (fun () -> (counter := !counter + 1; !counter)) ;
    reset = (fun () -> counter := 0) }


type counter_obj2 = {tick: unit -> int ; reset : unit -> int}
                 
let makeCounter2 () =                               
  let counter = ref 0 in
    {tick = (fun () -> (counter := !counter + 1 ; !counter)) ;
    reset = (fun () -> counter := 0 ; !counter) }
