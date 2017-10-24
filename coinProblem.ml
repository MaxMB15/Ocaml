exception Change


let rec change (coins : int list) (amt : int) : int list =
  if amt = 0 then
    []
  else
    (match coins with
     | [] -> raise Change (* Fail and raise the exception *)
     | coinHead::coinTail ->
        (if coinHead > amt then
           change coinTail amt
         else
           try coinHead::(change coins (amt - coinHead))
           with Change -> change coinTail amt
        )
    )
