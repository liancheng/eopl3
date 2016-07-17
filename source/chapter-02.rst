###########################
Chapter 2. Data Abstraction
###########################

Exercise 2.1
============

Bigits implementation
---------------------

.. literalinclude:: 02-01.rkt
    :language: scheme
    :linenos:

Factorial experiments
---------------------

.. literalinclude:: 02-01-fact.rkt
    :language: scheme
    :linenos:

Conclusions:

#.  The larger the argument is, the longer the execution time is.

    This is because of inherent time complexity of factorial.

#.  The larger the base is, the shorter the execution time is.

    Because larger base takes fewer bigits to represent a given number.

Exercise 2.2
============

#.  Unary representation:

    Pros:
        - Fully conforms to the specification, limited by physical memory capacity only.
        - Simple implementation

    Cons:
        - Poor performance
        - Hardly readable when used to represent large numbers

#.  Scheme number representation

    Pros:
        - Simple implementation
        - The representation is easy to read
        - Good performance (completely decided by the underlying concrete Scheme implementation)

    Cons:
        - For Scheme implementations that doesn't have built-in bignum support, calculation result may overflow, thus doesn't fully conform to the specification.

#.  Bignum representation

    Pros:
        - Fully conforms to the specification.
        - Relatively good performance. Essentially, larger base leads to better performance.
        - The representation is relatively easier to read

    Cons:
        - Depends on a global state (base)

Exercise 2.3
============

Question 1
----------

Proof
    :math:`\forall n \in N`, let :math:`S` be the set of all representations of :math:`\lceil n \rceil`. Then, :math:`\forall x \in S`, we can always construct :math:`S' \subseteq S` using the following generation rules:

    .. math::

        x \in S

        \frac {
            y \in S
        } {
            \text{(diff} \; x \; \text{(diff} \; \text{(one)} \; \text{(one))} \text{)}
        }

    Apparently, we have :math:`\lvert S' \rvert = \infty`. Thus :math:`\lvert S \rvert = \infty`.

    Q.E.D.

Question 2
----------

.. literalinclude:: 02-03-2.rkt
    :language: scheme
    :linenos:

Question 3
----------

.. literalinclude:: 02-03-3.rkt
    :language: scheme
    :linenos:

Exercise 2.4
============

Constructors:

.. math::

    (\text{empty-stack}) &=
        \lceil \emptyset \rceil \\
    (\text{push} \; \lceil e \rceil \; \lceil stk \rceil) &=
        \lceil stk' \rceil, \text{where }
        (\text{top} \; \lceil stk' \rceil) = \lceil e \rceil \\

Observers:

.. math::

    (\text{empty-stack?} \; \lceil stk \rceil) &=
        \begin{cases}
            \text{#t} & \text{if } stk = \lceil \emptyset \rceil \\
            \text{#f} & \text{otherwise}
        \end{cases} \\
    (\text{top} \; \lceil stk \rceil) &=
        \lceil e \rceil, \text{where }
        \lceil stk \rceil =
            (\text{push} \; \lceil e \rceil \; (\text{pop} \; \lceil stk \rceil)) \\
    (\text{pop} \; \lceil stk \rceil) &=
        \lceil stk' \rceil, \text{where }
        (\text{push} \; (\text{top} \; \lceil stk \rceil) \; \lceil stk' \rceil) =
            \lceil stk \rceil

Exercise 2.5
============

.. literalinclude:: 02-05.rkt
    :language: scheme
    :linenos:

Exercise 2.6
============

Implementation 1
----------------

Represent environments as functions.

.. literalinclude:: 02-06-1.rkt
    :language: scheme
    :linenos:

Implementation 2
----------------

A representation that doesn't allow variable "shadowing":

.. literalinclude:: 02-06-2.rkt
    :language: scheme
    :linenos:

Implementation 3
----------------

Represent environments as "ribs": a pair consists of a list of variables and a list of values.

.. literalinclude:: 02-06-3.rkt
    :language: scheme
    :linenos:

Exercise 2.7
============

.. literalinclude:: 02-07.rkt
    :language: scheme
    :linenos:
    :start-after: ;; begin
    :end-before: ;; end

Exercise 2.8
============

.. literalinclude:: 02-08.rkt
    :language: scheme
    :linenos:

Exercise 2.9
============

.. literalinclude:: 02-09.rkt
    :language: scheme
    :linenos:

Exercise 2.10
=============

.. literalinclude:: 02-10.rkt
    :language: scheme
    :linenos:

Exercise 2.11
=============

.. literalinclude:: 02-11.rkt
    :language: scheme
    :linenos:

Exercise 2.12
=============

.. literalinclude:: 02-12.rkt
    :language: scheme
    :linenos:

Exercise 2.13
=============

.. literalinclude:: 02-13.rkt
    :language: scheme
    :linenos:

Exercise 2.14
=============

.. literalinclude:: 02-14.rkt
    :language: scheme
    :linenos:
    :emphasize-lines: 10,18-21,23-24,26-27,29-30

Exercise 2.15
=============

.. literalinclude:: 02-15.rkt
    :language: scheme
    :linenos:

Exercise 2.16
=============

.. literalinclude:: 02-16.rkt
    :language: scheme
    :linenos:
    :emphasize-lines: 10,22,41
