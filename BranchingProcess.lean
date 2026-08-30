/-
Galton-Watson branching processes over an `N`-ary alphabet: offspring laws and
their extinction probability, the genealogical tree cut out by a field of
offspring counts, the law of that tree, and the decomposition of a supercritical
sample into its surviving skeleton and the finite bushes hanging off it.

The library builds on Mathlib alone.

* `Word`: the ambient `N`-ary tree, its longest common prefix and metric, and
  subtrees as terms of `Descriptive.tree (Fin N)`.
* `Offspring`: offspring laws of bounded support, their mean and criticality,
  the generating function, and the extinction probability as its least fixed
  point.
* `Sample`: the genealogical tree cut out by a field of offspring counts, the
  branching property of the subtree at a vertex, survival, the skeleton of
  vertices with infinite progeny, and the rays it carries.
* `Field`: the i.i.d. coordinate field over an arbitrary index type, built on
  `Measure.infinitePi`, with the Bernoulli specialisation.
* `Law`: the law of a sample, tying the two halves together. The extinction
  probability of `Offspring` is the probability that the sample of `Sample` is
  finite, provided the alphabet carries the support.
* `Conditioned`: the law conditioned on survival, the law of the root's
  surviving-child count, which is the Harris-Sevastyanov transform, and the
  conjugate tilt at the root of a subtree conditioned to die.
* `Skeleton`: trees as a measurable space, the law of a sample as a measure on
  them, the reduced law as an `Offspring`, and the skeleton as a measurable map
  with the branching property at one surviving child.
* `Decorated`: the joint box, constraining the surviving and the dying children
  of a vertex at once.
* `Harris`: the joint Harris decomposition. Conditioned on the skeleton, the
  decorations are independent conjugate samples, as one identity of laws.
* `Progeny`: the point mass of a finite tree, the progeny recursion
  `F_{k+1}(s) = s f(F_k(s))`, and the exponential moment of the total progeny
  of a subcritical law.
* `Geometry`: the coarse geometry of trees on `SimpleGraph`, with the hair
  separation and the three-rays obstruction.

`AxCheck` is a separate target: it prints the axioms of the endpoints above,
which must be `propext`, `Classical.choice`, `Quot.sound` or a subset.
-/
import BranchingProcess.Word
import BranchingProcess.Offspring
import BranchingProcess.Sample
import BranchingProcess.Law
import BranchingProcess.Conditioned
import BranchingProcess.Skeleton
import BranchingProcess.Decorated
import BranchingProcess.Harris
import BranchingProcess.Progeny
import BranchingProcess.Field
import BranchingProcess.Geometry
