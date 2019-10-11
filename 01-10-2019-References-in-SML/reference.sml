signature COUNTER = sig
      val incr : unit->unit
      val get : unit->int
      val set : int -> unit
end


structure countme: COUNTER = struct
     
     val x = ref 0;
     fun incr () = x:= (!x+1);
     fun get ()  = (!x);
     fun set y   =  x := y;
end


functor funcount(): COUNTER  = struct
     
     val x = ref 0;
     fun incr () = x:= (!x+1);
     fun get ()  = (!x);
     fun set y   =  x := y;
end
