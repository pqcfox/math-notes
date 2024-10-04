#import "@preview/fractusist:0.1.0": hilbert-curve

#set par(justify: true)
#set page(margin: 1.25in)
#set text(font: "TeX Gyre Pagella", size: 10pt)
#show heading: set block(above: 2em, below: 1em)

#set heading(numbering: "1.")
#set quote(block: true)
#show quote: set pad(x: 2em, top: -0.5em)

#set page(
  header: context {
    let selector = selector(heading.where(level: 1)).before(here()) 
    let level = counter(selector)
    let headings = query(selector)
    if headings.len() != 0 {
      let body = headings.last().body
      let num = level.display(heading.numbering)
      align(center, emph(num + " " + body))
    }
  },
  numbering: "1",
)

#align(
  center,
  stack(
    dir: ttb,
    spacing: 1em,
    text(size: 17pt)[*Notes on Atiyah-MacDonald*],
    text(size: 14pt)[(Intro to Commutative Algebra)],
  )
)

#v(10pt)

#align(
  center,
  stack(
    dir: ttb,
    spacing: 0.75em,
    text[Kat Watson],
    link("https://pqcfox.dev")[`https://pqcfox.dev`],
  )
)

#v(10pt)

#align(center,
  stack(
    dir: ttb,
    spacing: 0.75em,
    text[*Abstract*],
    align(left, 
      pad(x: 5em, top: 0.25em)[
        #set par(justify: true)
        #set text(size: 9pt)
        These notes are from late 2024, and are intended as a review of commutative algebra in preparation to cover more of the in-depth sections of Hartshorne. In these notes, I make arguments from the text as explicit as possible, even when they may be "obvious" in order to get additional practice--it's been a while since my undergrad. Exercise solutions are included, and are selected to cover the material as well as possible.       ]
    ),
  )
)

#v(10pt)

#align(center, text[#sym.smash #h(0.25em) #sym.smash #h(0.25em) #sym.smash])

#v(-5pt)

= Rings and ideals

== Prime and maximal ideals (page 3)

The claim is made that for a ring $A$ with $frak(p)$ and $frak(m)$ ideals of $A$,

#quote[
  $frak(p)$ is prime $<=>$ $A\/frak(p)$ is an integral domain;\
  $frak(m)$ is maximal $<=>$ $A\/frak(m)$ is a field (by (1.1) and (1.2)). 
]

Indeed, $A\/frak(p)$ is a domain iff for all $x, y in A$, $overline(x) overline(y) = 0$ implies either $overline(x) = 0$ or $overline(y) = 0$. Since 

#align(center)[
  $overline(x) overline(y) = 0 <=> x y in frak(p), quad overline(x) = 0 <=> x in frak(p), quad overline(y) = 0 <=> y in frak(p)$
]

we have that this is equivalent to $frak(p)$ being prime. 

For the other claim, (1.2) states that $A\/frak(m)$ is a field iff the only ideals in $A$ are $0$ and $(1)$. By (1.1), there is a one-to-one order-preserving correspondence between the ideals of $A\/frak(m)$ and the ideals of $A$ containing $frak(m)$ sending $0, (1) subset.eq A\/frak(m)$ to $frak(m), (1) subset.eq A$ respectively. Thus, we have

#align(center)[
  $
    A\/frak(m) "is a field" &<=> "the only ideals of" A\/frak(m) "are" 0 "and" (1) \
    &<=> "the only ideals of" A "containing" frak(m) "are" frak(m) "and" (1) \
    &<=> frak(m) "is maximal".
  $
]

== Pullbacks of prime ideals (page 3)

The claim is also made that

#quote[
  If $f: A -> B$ is a ring homomorphism and $frak(q)$ is a prime ideal in $B$, then $f^(-1)(q)$ is a prime ideal in $A$, for $A\/f^(-1)(frak(q))$ is isomorphic to a subring of $B\/frak(q)$ and hence has no zero-divisor $eq.not 0$.
]

First, to construct this isomorphism, compose $f$ with the quotient map $pi: B -> B\/frak(q)$ to get $pi compose f: A -> B\/frak(q)$ and note that $ker (pi compose f)$ is precisely $f^(-1)(frak(q))$, so that by the first isomorphism theorem, we have an injective map $overline(pi compose f): A\/f^(-1)(frak(q)) -> B\/frak(q)$. Since the image of any ring homomorphism is a subring of the codomain, this map makes $A\/f^(-1)(frak(q))$ isomorphic to a subring of $B\/frak(q)$ as desired. 

== Every non-zero ring has a maximal ideal (Proposition 1.3)

As part of the proof, it is claimed that for a chain $(frak(a)_alpha)$ in $Sigma$, $frak(a) := union_alpha frak(a)_alpha$ is an ideal. Indeed, take $x, y in frak(a)$. We have that for some $alpha$ and $beta$, $x in frak(a)_alpha$ and $y in frak(a)_beta$. WLOG, assume $frak(a)_alpha subset.eq frak(a)_beta$. Then $x, y in frak(a)_beta$, meaning $x + y in frak(a)_beta subset.eq frak(a)$. 

Similarly, if $a in A$ is a general element of $A$ and $x in frak(a)_alpha$, then we have $a x in frak(a)_alpha subset.eq frak(a)$, so that $frak(a)$ is an ideal of $A$.

== Every ideal is contained in a maximal ideal (Corollary 1.4)

In the proof of Corollary 1.4, the full argument is

#quote[
  Apply (1.3) to $A\/frak(a)$, bearing in mind (1.1). Alternatively, modify the proof of (1.3).
]

We expand on this: applying (1.3) to $A\/frak(a)$, we get a maximal ideal of $A\/frak(a)$, which by the correspondence in (1.1) corresponds to a maximal ideal of $A$ containing $frak(a)$.

== Criterion for a ring to be local (Proposition 1.6(ii))

The proof elides the detail that for any $x, y in A$, if $x y$ is a unit then $x$ is a unit. This follows from definition: if $x y$ is a unit, then there exists $z in A$ such that $(x y) z = 1$, but then $x (y z) = 1$, meaning $x$ is a unit.

== Irreducible polynomials generate prime ideals (Example 1, page 4)

As an example of a prime ideal, page 4 gives

#quote[
  $A = k[x_1, ..., x_n]$, $k$ a field. Let $f in A$ be an irreducible polynomial. By unique factorization, the ideal $(f)$ is prime.
]

Making this explicit, assume that we have $g, h in A$ such that $g h in f$, i.e. $f bar g h$. Then since $f$ is irreducible, we have by unique factorization that either $f bar g$ or $f bar h$, i.e. $g in (f)$ or $h in (f)$, meaning $(f)$ is prime.

== Ideals of $ZZ$ are all principal (Example 2, page 4)

As another example on page 4, there is a claim that

#quote[
  Every ideal in $ZZ$ is of the form $(m)$ for some $m gt.eq 0$.
]

Indeed, take an arbitrary non-zero ideal $frak(a) subset.eq ZZ$, and take the smallest positive element of $frak(a)$: denote this as $m$. Clearly $(m) subset.eq frak(a)$. Now, take any $n in frak(a)$. By Bezout's identity, we have $gcd(m, n) in frak(a)$. Since $gcd(m, n) lt.eq m$, but $m$ is the smallest positive element of $frak(a)$, we have $gcd(m, n) = m$, i.e. $m bar n$. Thus $frak(a) subset.eq (m)$, and the two ideals are equal.

As implicitly noted in the text, a similar argument can be applied to show that $k[x]$ is a principal ideal domain, based on the Euclidean algorithm for univariate polynomials.

== The modular law for ideals (page 6)

The following is stated as the closest approximate we have in general to $sect$ and $+$ distributing over each other in a general ring:

#quote[
  $frak(a) sect (frak(b) + frak(c)) = frak(a) sect frak(b) + frak(a) sect frak(c) "if" frak(a) supset.eq frak(b) "or" frak(a) supset.eq frak(c)$
]

To see this, WLOG let $frak(a) supset.eq frak(b)$. We show each side of the desired equality contains the other.

$subset.eq$: By definition, we have $frak(a) sect (frak(b) + frak(c)) subset.eq frak(a)$, and since $frak(b) subset.eq frak(a)$, we have $frak(a) sect (frak(b) + frak(c)) subset.eq frak(b) + frak(c) subset.eq frak(a) + frak(c)$. This means that any $x in frak(a) sect (frak(b) + frak(c))$ both lies in $frak(a)$ and can be written as $x = y + z$ for some $y in frak(a)$ and some $z in frak(c)$. But then, $z = x - y in frak(a)$, meaning $z in frak(a) sect frak(c)$ and therefore 

#align(center)[
  $x = y + z in frak(a) + frak(a) sect frak(c) = frak(a) sect frak(b) + frak(a) sect frak(c)$. 
]

$supset.eq$: Any element $x in frak(a) sect frak(b) + frak(a) sect frak(c)$ can be written as $x = y + z$ for $y in frak(a) sect frak(b)$ and $z$ in $frak(a) sect frak(c)$. Since $y, z in frak(a)$, $x = y + z in frak(a)$, and since $y in frak(b)$ and $z in frak(c)$, we have $x = y + z in frak(b) + frak(c)$ as well, meaning $x in frak(a) sect (frak(b) + frak(c))$ as desired.

== End of chapter exercises

=== Exercise 1

Take $n > 0$ such that $x^n = 0$. Then $(1 + x)(1 - x + x^2 - x^3 + ... plus.minus x^(n - 1)) = 1 plus.minus x^n = 1$. #h(1fr) $square.stroked$

=== Exercise 6

By Proposition 1.9, it suffices to show that for any $x in A$, if $1 - x y$ is a unit for every $y in A$, then $x$ lies in the nilradical. Assume to a contraction that some such $x$ is not in the nilradical. By the premise of the problem, $(x)$ would then contain some non-zero idempotent $e$. Take $y$ such that $e = x y$. Then $1 - x y = 1 - e$, which is idempotent: $(1 - e)^2 = 1 - 2e + e^2 = 1 - e$. 

If $1 - e$ was a unit, then multiplying both sides of the previous equality by its inverse would give $1 - e = 1$, i.e. $e = 0$, contradicting our choice of $e$. $arrow.r.double arrow.l.double$ #h(1fr) $square.stroked$ 

=== Exercise 7

Fix an arbitrary prime ideal $frak(p) subset.eq A$, and take $x in A - frak(p)$ with image $overline(x) in A\/frak(p)$. Since $x^n = x$ for some $n > 1$, we have $(x^(n - 1) - 1)x = 0$. Passing to the quotient, this gives $(overline(x)^(n - 1) - 1) overline(x) = 0$. 

Since $x in.not frak(p)$, we have $overline(x) eq.not 0$. Because $A\/frak(p)$ is an integral domain, this means $overline(x)^(n - 1) - 1 = 0$, implying that $overline(x)$ is a unit. As $x in A - frak(p)$ was arbitrary, this means that any nonzero element of $A\/frak(p)$ is a unit, i.e. $A\/frak(p)$ is a field and thus $frak(p)$ is maximal. #h(1fr) $square.stroked$

=== Exercise 8

Let $Sigma$ be the set of all prime ideals in $A$, ordered by reverse inclusion. $Sigma$ is non-empty, since $0 in Sigma$. Moreover, if $(frak(a)_alpha)$ is a chain of ideals in $Sigma$, we claim that $sect_alpha frak(a)_alpha$ is an upper (or rather, lower) bound to $(frak(a)_alpha)$. It suffices to show that $frak(a) := sect_alpha frak(a)_alpha$ is prime, and indeed if $x, y in.not frak(a)_alpha$, then we have that there are some $alpha, beta$ such that $x in.not frak(a)_alpha$ and $y in.not frak(a)_beta$. Since $(frak(a)_alpha)$ is a chain, we can assume WLOG that $frak(a)_alpha subset.eq frak(a)_beta$. Thus, $x, y in.not frak(a)_beta$, meaning $x y in.not frak(a)_beta$ and thus $x y in.not frak(a)$, showing that $frak(a)$ is prime. 

=== Exercise 9

We handle both directions separately:

$=>$: If $frak(a) = r(frak(a))$, then any $x in A$ such that $x^n in frak(a)$ for some $n > 0$ must lie in $frak(a)$. Thus, for any $overline(x) in A\/frak(a)$ such that $overline(x)^n = 0$, we have $overline(x) = 0$, meaning in $A\/frak(a)$ that the nilradical is the zero ideal, i.e. $sect.big_(frak(p) in cal(F)) frak(p) = 0$ for a family of prime ideals $cal(F)$ in $A\/frak(a)$. Now, take $pi: A -> A\/frak(a)$ to be the natural projection of $A$ onto $A\/frak(a)$. Because taking preimages preserves intersections and sends prime ideals to prime ideals, we have that $pi^(-1) cal(F)$ is a family of prime ideals whose intersection is $pi^(-1)(0) = frak(a)$, i.e. $frak(a)$ is an intersection of prime ideals. 

$arrow.l.double$: Let $frak(a)$ be the intersection of some family $cal(F)$ of prime ideals in $A$. If $x^n in frak(a)$ for some $n > 0$, then $x^n in frak(p)$ for each $frak(p) in cal(F)$. Since prime ideals are radical, this means that $x in frak(p)$ for each $frak(p) in cal(F)$, and thus $x in frak(a)$ as desired. #h(1fr) $square.stroked$

=== Exercise 10

We prove a cycle of implications.

(i) $=>$ (ii): If $A$ has exactly one prime ideal, then it must equal $frak(N)$, being the intersection of every prime ideal. Because $frak(N)$ is the maximal ideal in a local ring, every element not in $frak(N)$ must be a unit, i.e. every element is nilpotent or a unit.
 
(ii) $=>$ (iii): Since every non-nilpotent element of $A$ is a unit, we have that $frak(N)$ is maximal by Proposition 1.6(i) and thus $A\/frak(N)$ is a field.

(iii) $=>$ (i): If $A\/frak(N)$ is a field, then $frak(N)$ is maximal. For any prime ideal $frak(p) subset.eq A$, we have $frak(N) subset.eq frak(p)$ as the nilpotent is the intersection of all prime ideals, but then by maximality of $frak(N)$ we must have $frak(N) = frak(p)$. Thus, there can only be one prime ideal in $A$. #h(1fr) $square.stroked$

=== Exercise 11

#set enum(numbering: "(i)")
+ For any $x in A$, we have $x + 1 = (x + 1)^2 = x^2 + 2x + 1 = 3x + 1$, meaning $2x = 0$.
+ For a given prime ideal $frak(p) subset.eq A$, take any $overline(x) in A\/frak(p)$. Since $x^2 = x$ in $A$, i.e. $x(x - 1) = 0$, we have $overline(x)(overline(x) - 1) = 0$ in $A\/frak(p)$, meaning either $overline(x) = 0$ or $overline(x) = 1$ as $A\/frak(p)$ is a domain. Thus, $A\/frak(p)$ is a field with two elements, implying $frak(p)$ is maximal. 
+ Take an arbitrary finitely generated ideal $frak(a) = (x_1, x_2, ..., x_n) subset.eq A$. Let $y = ...$. 

TODO: finish this! 

=== Exercise 12

Let $frak(m)$ be the maximal ideal of a local ring $A$. Note that any $x in.not frak(m)$ must be a unit, otherwise by Corollary 1.5 it would lie in a maximal ideal distinct from $frak(m)$. 

We show that the only idempotent element of $frak(m)$ is $0$. Assume some $e in frak(m)$ satisfies $e^2 = e$. Then $1 - e in.not frak(m)$, otherwise we would have $1 - e + e = 1 in frak(m)$. Thus $1 - e$ is a unit. But $(1 - e)^2 = 1 - 2e + e^2 = 1 - e$, so then multiplying both sides by $(1 - e)^(-1)$, we get $1 - e = 1$, i.e. $e = 0.$

The only idempotent $e in.not frak(m)$ is $1$, since $e in.not frak(m)$ implies $e$ is a unit, meaning $e^2 = e$ implies $e = 1$. Since either $e in frak(m)$ or $e in.not frak(m)$, our only options for an idempotent $e in A$ are $0$ and $1$. #h(1fr) $square.stroked$

= Modules
