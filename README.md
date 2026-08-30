# BranchingProcess

A Lean 4 formalisation of Galton-Watson branching processes over an `N`-ary alphabet,
built on Mathlib alone. Mathlib has no branching-process layer; this library supplies
offspring laws and their extinction probability, the genealogical tree cut out by a
field of offspring counts, the law of that tree as a measure on subtrees, and the
Harris-Sevastyanov decomposition of a supercritical sample into its surviving skeleton
and the finite bushes hanging off it.

The library is sorry-free. `BranchingProcess/AxCheck.lean` audits 94 endpoints, each
reporting `propext`, `Classical.choice`, `Quot.sound` or a subset of them.

## Layout

| Module | Contents |
|---|---|
| `Word` | The ambient `N`-ary tree, the longest common prefix, the metric `d(v,w) = \|v\| + \|w\| - 2\|v ∧ w\|`, and subtrees as terms of `Descriptive.tree (Fin N)` |
| `Offspring` | Offspring laws of bounded support, mean and criticality, the generating function, and the extinction probability as its least fixed point |
| `Sample` | The tree cut out by a field of offspring counts, the branching property at a vertex, survival, the skeleton, and the rays it carries |
| `Field` | The i.i.d. coordinate field over an arbitrary index type, on `Measure.infinitePi`, with the Bernoulli specialisation |
| `Law` | The law of a sample: the extinction probability is the probability of extinction |
| `Conditioned` | The law conditioned on survival, the surviving-child count at the root, and the conjugate tilt at the root of a dying subtree |
| `Skeleton` | Subtrees as a measurable space, the law of a sample on them, the reduced and conjugate laws, and the two halves of the decomposition |
| `Decorated` | The joint box, constraining the surviving and the dying children of a vertex at once |
| `Harris` | The joint Harris decomposition, as one identity of laws |
| `Progeny` | The point mass of a finite tree, the progeny recursion, and the exponential moment of the total progeny |
| `Geometry` | Quasi-isometries of graphs, rays, lines and hairs, with the hair separation and the three-rays obstruction |

`Word`, `Offspring`, `Field` and `Geometry` import only Mathlib.

## Headline declarations

All in the `BranchingProcess` namespace.

| Result | Declaration |
|---|---|
| The extinction probability is the probability of extinction | `sampleMeasure_not_survives` |
| The skeleton of a surviving sample is a Galton-Watson tree with the reduced law | `skeletonTreeLaw_eq_treeLaw` |
| A sample conditioned to die is a Galton-Watson tree with the conjugate law | `bushTreeLaw_eq_treeLaw` |
| The joint Harris decomposition: conditionally on the skeleton the decorations are independent conjugate samples | `survivalMeasure_decorations_treeLaw` |
| The total progeny of a subcritical law has an exponential moment | `exists_exponential_moment` |
| The progeny equation `s f(y) = y` has a solution with `s, y > 1` | `Offspring.exists_progeny_fixedPoint` |
| A tree with hairs of unbounded depth is not quasi-isometric to one within bounded distance of a line | `not_quasiIsometric_of_hair_of_line` |
| A tree carrying three rays out of one vertex is not quasi-isometric to the ray | `not_quasiIsometric_rayGraph` |
| A probability space carrying an independent Bernoulli family exists | `exists_bernoulli_field` |

## Build

The toolchain is pinned to Lean `v4.32.2`, with Mathlib pinned to the matching release
in `lakefile.toml`.

```bash
lake exe cache get
lake build
```

`lake build` compiles the library and runs the axiom check, which prints one line per
endpoint. The root module does not import `AxCheck`, so a downstream project that says
`import BranchingProcess` never compiles the audit; `lake build BranchingProcess.AxCheck`
runs it on its own.

On a machine that already holds a built Mathlib at that revision, point `.lake/packages`
at it instead of fetching a second copy:

```bash
mkdir -p .lake
ln -sfn /path/to/other/project/.lake/packages .lake/packages
```

`.lake` is not tracked, so this stays local.

## Provenance

The library was extracted from the formalisation accompanying the classification of
bounded-support Galton-Watson trees up to quasi-isometry,
[qi-trees-and-matching-lean](https://github.com/sascha2718/qi-trees-and-matching-lean),
where it is the probabilistic foundation the classification is built on. The proofs are
unchanged; the module documentation was rewritten to stand on its own.

## License

Apache License 2.0. See [`LICENSE`](LICENSE).
