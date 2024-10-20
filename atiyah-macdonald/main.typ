#import "@preview/fractusist:0.1.0": hilbert-curve

#let done = [#h(1fr) $square.stroked$]

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

$supset.eq$: Any element $x in frak(a) sect frak(b) + frak(a) sect frak(c)$ can be written as $x = y + z$ for $y in frak(a) sect frak(b)$ and $z$ in $frak(a) sect frak(c)$. Since $y, z in frak(a)$, $x = y + z in frak(a)$, and since $y in frak(b)$ and $z in frak(c)$, we have $x = y + z in frak(b) + frak(c)$ as well, meaning $x in frak(a) sect (frak(b) + frak(c))$ as desired. #done

== Ideals lying in the union of prime ideals (Proposition 1.11(i))

The part of the proof beginning with "...then for each $i$ there exists $x_i in frak(a)$ such that $x_i in.not frak(p)_j$ whenever $j eq.not i$..." could use clarification. We paraphrase the argument below.

If $n > 1$ and the result is true for $n - 1$, assume the premise $frak(a) subset.eq.not union.big_(i = 1)^n frak(p)_i space.punct (1 lt.eq i lt.eq n)$ and note that for each $1 lt.eq j lt.eq n$ we then have $frak(a) subset.eq.not frak(p)_i$ for $1 lt.eq i lt.eq n$, $i eq.not j$.

Since our desired result holds for $n - 1$, this in turn implies $frak(a) subset.eq.not union.big_(1 lt.eq i lt.eq n; space.punct i eq.not j) frak(p)_i$ for each such $j$, meaning that for each $j$ we have some $x_j in.not frak(a)$ such that $x_j in.not frak(p)_k$ when $j eq.not k$.

Now, if by chance we also have $x_j in.not frak(p)_j$ for some $j$, then $x_j in.not union.big_(i = 1)^n frak(p)_i$ meaning $frak(a) subset.eq.not union.big_(i = 1)^n frak(p)_i$, our desired result. Otherwise, i.e. if $x_j in frak(p)_j$ for every $j$, then we consider

#align(center)[
  $y = sum_(i=1)^n x_1 x_2 dots.h.c hat(space.thin x_i space.thin) dots.h.c x_n$
]

where the "hat" indicates the omission of $x_i$ from the product, i.e. each summand is missing one of ${x_1, x_2, dots.h.c x_n}$. For each $j$, we note that all summands but one will contain $x_j$ and thus lie in $frak(p)_j$. The remaining summand is a product of elements not in $frak(p)_j$ and thus by primality doesn't lie in $frak(p)_j$, meaning the whole sum doesn't lie in $frak(p)_j$. Since this argument applies for all $j$, we have $y in.not union.big_(i = 1)^n frak(p)_i$, meaning that $frak(a) subset.eq.not union.big_(i=1)^n frak(p)_i.$ #done

== Ideals whose intersection lies in a prime ideal (Proposition 1.11(ii))

This part of the proof contains a typo: the part which says

#quote[
  Suppose $frak(p) subset.eq.not frak(a)_i$ for all $i$...
]

should actually begin "Suppose $frak(p) supset.eq.not frak(a)_i$ for all $i$," assuming the desired conclusion is false to show a contradiction. The proof can be summarized as

#quote[
  If each ideal $frak(a)_i$ has an element not in $frak(p)$, then the product of those elements is in all $frak(a)_i$ but not in $frak(p)$ (by primality).
]

The equality case boils down to $frak(p) = sect frak(a)_i => frak(p) subset.eq frak(a)_i "for every" i$, and since $frak(p) supset.eq frak(a)_i "for some" i$, we have that $frak(p)$ must equal that particular $frak(a)_i$. 

== Ideal quotients in $ZZ$ (Example, page 8)

TODO: write out why this works.

== Various statements about ideal quotients (Exercise 1.12)

#set enum(numbering: "(i)")

The proofs for the provided statements are as follows:

+ For each $x in frak(a)$, we have by the definition of an ideal that $x frak(b) subset.eq frak(a)$, i.e. $x in (frak(a) : frak(b))$.
+ If $x in (frak(a) : frak(b))$, then $x frak(b) subset.eq frak(a)$, meaning $(frak(a) : frak(b)) frak(b) subset.eq frak(a)$.
+ For $x in A$ to be in $((frak(a) : frak(b)) : frak(c))$, that means that $x frak(c) subset.eq (frak(a) : frak(b))$, i.e. for any $y in x frak(c)$, $y frak(b) subset.eq frak(a)$. This in turn is the same as saying $(x frak(c)) frak(b) subset.eq frak(a)$. Since $(x frak(c)) frak(b) = x (frak(b) frak(c))$, that in turn is equivalent to the statement $x in (frak(a) : frak(b) frak(c))$. Thus, $((frak(a) : frak(b)) : frak(c)) = (frak(a) : frak(b) frak(c))$. Reversing the roles of $frak(b)$ and $frak(c)$, the remaining equality follows.
+ For any $x in A$, $x in (sect_i frak(a)_i : frak(b))$ is the same as saying $x frak(b) in frak(a)_i "for all" i$. This in turn is equivalent to $x in (frak(a)_i : frak(b)) "for all" i$, i.e. $x in sect_i (frak(a)_i : frak(b))$.
+ If $x in (frak(a) : sum_i frak(b)_i)$, then $x sum_i frak(b)_i subset.eq frak(a)$, meaning $x frak(b)_i subset.eq frak(a) "for each" i$, i.e. $sect_i (frak(a) : frak(b)_i)$. In the reverse direction, if $x frak(b)_i subset.eq frak(a) "for each" i$, then $x sum_i frak(b)_i subset.eq frak(a)$, i.e. $(frak(a) : sum_i frak(b)_i)$. #done 

== $r(frak(a))$ is an ideal (page 8)

On page 8 just after the definition of the radical of an ideal, the following claim is made:

#quote[
  If $phi.alt: A -> A\/frak(a)$ is the standard homomorphism, then $r(frak(a)) = phi.alt^(-1)(frak(N)_(A\/frak(a)))$ and hence $r(frak(a))$ is an ideal by (1.7). 
 ]

TODO: elaborate on this.

== Various statements about radicals of ideals (Exercise 1.13)

#set enum(numbering: "(i)")

The proofs for the provided statements are as follows:

+ If $x in frak(a)$, then in particular $x^1 in frak(a)$, so $x in r(frak(a))$.
+ From the previous statement, $r(r(frak(a)) supset.eq r(frak(a))$. We show the reverse inclusion: if $x in r(r(frak(a))$, then there exist $m, n > 0$ such that $(x^m)^n in frak(a)$. But then $x^(m n) in frak(a)$ with $m n > 0$, so $x in r(frak(a))$.
+ We show a cycle of inclusions:
  + $r(frak(a) frak(b)) subset.eq r(frak(a) sect frak(b))$: If $x$ in $r(frak(a) frak(b))$, then $x^n in frak(a) frak(b)$ for some $n > 0$. Since $frak(a) frak(b) subset.eq frak(a)$ and $frak(a) frak(b) subset.eq frak(b)$, this means $x^n in frak(a) sect frak(b)$. 
  + $r(frak(a) sect frak(b)) subset.eq r(frak(a)) sect r(frak(b))$: If $x$ in $r(frak(a) sect frak(b))$, then $x^n in frak(a) sect frak(b)$ for some $n > 0$. Since $frak(a) sect frak(b) subset.eq frak(a)$ and $frak(a) sect frak(b) subset.eq frak(b)$, we have $x in r(frak(a)) sect r(frak(b)).$ 
  + $r(frak(a)) sect r(frak(b)) subset.eq r(frak(a) frak(b))$: If $x in r(frak(a)) sect r(frak(b))$, then we have that for some $m, n > 0$ that $x^m in frak(a)$ and $x^n in frak(b)$. This means that $x^(m + n) in frak(a) frak(b)$, and since $m + n > 0$, we have $x in r(frak(a) frak(b)).$
+ We handle this in two directions:
  + $=>$: If $r(frak(a)) = (1)$, then in particular $1 in r(frak(a))$, i.e. $1^n in frak(a)$ for some $n > 0$. Since $1^n = 1$ for any such $n$, we have $1 in frak(a)$, i.e. $frak(a) = (1)$. 
  + $arrow.l.double$: If $frak(a) = (1)$, then since $r(frak(a)) supset.eq frak(a)$, we must have $r(frak(a)) = (1)$.
+ TODO 
+ TODO

== End of chapter exercises

=== Exercise 1

Take $n > 0$ such that $x^n = 0$. Then $(1 + x)(1 - x + x^2 - x^3 + dots.h.c plus.minus x^(n - 1)) = 1 plus.minus x^n = 1$. #done

=== Exercise 6

By Proposition 1.9, it suffices to show that for any $x in A$, if $1 - x y$ is a unit for every $y in A$, then $x$ lies in the nilradical. Assume to a contraction that some such $x$ is not in the nilradical. By the premise of the problem, $(x)$ would then contain some non-zero idempotent $e$. Take $y$ such that $e = x y$. Then $1 - x y = 1 - e$, which is idempotent: $(1 - e)^2 = 1 - 2e + e^2 = 1 - e$. 

If $1 - e$ was a unit, then multiplying both sides of the previous equality by its inverse would give $1 - e = 1$, i.e. $e = 0$, contradicting our choice of $e$. $arrow.r.double arrow.l.double$ #done

=== Exercise 7

Fix an arbitrary prime ideal $frak(p) subset.eq A$, and take $x in A - frak(p)$ with image $overline(x) in A\/frak(p)$. Since $x^n = x$ for some $n > 1$, we have $(x^(n - 1) - 1)x = 0$. Passing to the quotient, this gives $(overline(x)^(n - 1) - 1) overline(x) = 0$. 

Since $x in.not frak(p)$, we have $overline(x) eq.not 0$. Because $A\/frak(p)$ is an integral domain, this means $overline(x)^(n - 1) - 1 = 0$, implying that $overline(x)$ is a unit. As $x in A - frak(p)$ was arbitrary, this means that any nonzero element of $A\/frak(p)$ is a unit, i.e. $A\/frak(p)$ is a field and thus $frak(p)$ is maximal. #done

=== Exercise 8

Let $Sigma$ be the set of all prime ideals in $A$, ordered by reverse inclusion. $Sigma$ is non-empty, since $0 in Sigma$. Moreover, if $(frak(a)_alpha)$ is a chain of ideals in $Sigma$, we claim that $sect_alpha frak(a)_alpha$ is an upper (or rather, lower) bound to $(frak(a)_alpha)$. It suffices to show that $frak(a) := sect_alpha frak(a)_alpha$ is prime, and indeed if $x, y in.not frak(a)_alpha$, then we have that there are some $alpha, beta$ such that $x in.not frak(a)_alpha$ and $y in.not frak(a)_beta$. Since $(frak(a)_alpha)$ is a chain, we can assume WLOG that $frak(a)_alpha subset.eq frak(a)_beta$. Thus, $x, y in.not frak(a)_beta$, meaning $x y in.not frak(a)_beta$ and thus $x y in.not frak(a)$, showing that $frak(a)$ is prime. 

=== Exercise 9

We handle both directions separately:

$=>$: If $frak(a) = r(frak(a))$, then any $x in A$ such that $x^n in frak(a)$ for some $n > 0$ must lie in $frak(a)$. Thus, for any $overline(x) in A\/frak(a)$ such that $overline(x)^n = 0$, we have $overline(x) = 0$, meaning in $A\/frak(a)$ that the nilradical is the zero ideal, i.e. $sect.big_(frak(p) in cal(F)) frak(p) = 0$ for a family of prime ideals $cal(F)$ in $A\/frak(a)$. Now, take $pi: A -> A\/frak(a)$ to be the natural projection of $A$ onto $A\/frak(a)$. Because taking preimages preserves intersections and sends prime ideals to prime ideals, we have that $pi^(-1) cal(F)$ is a family of prime ideals whose intersection is $pi^(-1)(0) = frak(a)$, i.e. $frak(a)$ is an intersection of prime ideals. 

$arrow.l.double$: Let $frak(a)$ be the intersection of some family $cal(F)$ of prime ideals in $A$. If $x^n in frak(a)$ for some $n > 0$, then $x^n in frak(p)$ for each $frak(p) in cal(F)$. Since prime ideals are radical, this means that $x in frak(p)$ for each $frak(p) in cal(F)$, and thus $x in frak(a)$ as desired. #done

=== Exercise 10

We prove a cycle of implications.

(i) $=>$ (ii): If $A$ has exactly one prime ideal, then it must equal $frak(N)$, being the intersection of every prime ideal. Because $frak(N)$ is the maximal ideal in a local ring, every element not in $frak(N)$ must be a unit, i.e. every element is nilpotent or a unit.
 
(ii) $=>$ (iii): Since every non-nilpotent element of $A$ is a unit, we have that $frak(N)$ is maximal by Proposition 1.6(i) and thus $A\/frak(N)$ is a field.

(iii) $=>$ (i): If $A\/frak(N)$ is a field, then $frak(N)$ is maximal. For any prime ideal $frak(p) subset.eq A$, we have $frak(N) subset.eq frak(p)$ as the nilpotent is the intersection of all prime ideals, but then by maximality of $frak(N)$ we must have $frak(N) = frak(p)$. Thus, there can only be one prime ideal in $A$. #done

=== Exercise 11

#set enum(numbering: "(i)")
+ For any $x in A$, we have $x + 1 = (x + 1)^2 = x^2 + 2x + 1 = 3x + 1$, meaning $2x = 0$.
+ For a given prime ideal $frak(p) subset.eq A$, take any $overline(x) in A\/frak(p)$. Since $x^2 = x$ in $A$, i.e. $x(x - 1) = 0$, we have $overline(x)(overline(x) - 1) = 0$ in $A\/frak(p)$, meaning either $overline(x) = 0$ or $overline(x) = 1$ as $A\/frak(p)$ is a domain. Thus, $A\/frak(p)$ is a field with two elements, implying $frak(p)$ is maximal. 
+ Take an arbitrary finitely generated ideal $frak(a) = (x_1, x_2, ..., x_n) subset.eq A$. Let $y = ...$. 

TODO: finish this! 

=== Exercise 12

Let $frak(m)$ be the maximal ideal of a local ring $A$. Note that any $x in.not frak(m)$ must be a unit, otherwise by Corollary 1.5 it would lie in a maximal ideal distinct from $frak(m)$. 

We show that the only idempotent element of $frak(m)$ is $0$. Assume some $e in frak(m)$ satisfies $e^2 = e$. Then $1 - e in.not frak(m)$, otherwise we would have $1 - e + e = 1 in frak(m)$. Thus $1 - e$ is a unit. But $(1 - e)^2 = 1 - 2e + e^2 = 1 - e$, so then multiplying both sides by $(1 - e)^(-1)$, we get $1 - e = 1$, i.e. $e = 0.$

The only idempotent $e in.not frak(m)$ is $1$, since $e in.not frak(m)$ implies $e$ is a unit, meaning $e^2 = e$ implies $e = 1$. Since either $e in frak(m)$ or $e in.not frak(m)$, our only options for an idempotent $e in A$ are $0$ and $1$. #done

= Modules
