declare name "Simple Iteration experiment";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

//
// This is to study how iterations work:
//
// - how can the index be controlled
//

GUI(x) = hgroup("simple_iteration", x);
process = GUI(a_simple_iterator)
  with
	{
    n_iterations = 6;
		a_simple_iterator = par(n, n_iterations, sub_iterator(n))
		with
		{
		  sub_iterator(n) = vslider("[%n] amp %f", n/10, 0, 1.2, 0.01) * _
			with
			{
		  	x(0) = 0;
		  	x(n) = x(n-1) + 2;
				f = x(n);
			};
		};
	};
