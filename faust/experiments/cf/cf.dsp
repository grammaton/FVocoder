//
// testing pattern matching capabilities of faust
// in building the filter bank.
//
// Getting the center frequency right.
//

number_of_filters = 48; 
process = par(n, number_of_filters, cf(n)) :> !
  with
  {
    cf(0) = 65.4;
    cf(n) = cf(n-1) * pow(2, 1/6);
  };
