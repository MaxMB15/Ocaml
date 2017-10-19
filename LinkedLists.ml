(*FINALLY GOT MERLIN TO WORK!!!!*)

let test = 4


type 'a rlist = Empty | Rcons of 'a * ('a rlist) ref

                               

let rec rapp' r1 r2 = match r1 with
  | v, Empty -> v, r2
  | v, l -> v, (rapp' l r2)

let rec rapp r1 r2 = match r1 with
  | {contents = Empty} -> r1 := !r2
  | {contents = RCons (x, xs)} -> rapp xs r2
