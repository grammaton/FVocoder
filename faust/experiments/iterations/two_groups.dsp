declare name "Iteration experiment";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

//
// This is to study how iterations work:
//
// - how can the index be controlled
// - how can iterations be subdivided in subgroups
//

GUI(x,y) = hgroup("iterations", vgroup("1", x), vgroup("2", y));
process = GUI(one_iterator(1, (n_iterations/2), 0, 1), one_iterator(1, (n_iterations/2), (n_iterations/2), 2))
  with
	{
    n_iterations = 6;
		a = 0;
		one_iterator(num, n_iters, offset, group) = par(m, n_iters, sub_iterators(m))
		with
		{
		  sub_iterators(m) = checkbox("[%a][/h:iterations/v:%g][tooltip: m=%m, a=%a, offset=%o] %2a") * _
			with
			{
  		  f(m) = m;
  		  a = f(m) + offset + 1;
  			g = group;
  			o = offset;
			};
		};
	};
