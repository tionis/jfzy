(use spork/test)
(use /build/fzy)

(start-suite 0)

(assert (deep= (positions "s" "has")
               @[2])
        "positions")

(assert (has-match "s" "as")
        "has-match")

(assert-not (has-match "Z" "as")
            "has not match")

(assert (= -0.005 (score "s" "as"))
        "score")

(end-suite)
