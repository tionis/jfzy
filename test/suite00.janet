(use spork/test)
(use /build/fzy)

(start-suite 0)

(assert (> 0 score-min) "score-min")
(assert (< 0 score-max) "score-max")

(assert (has-match "s" "as")
        "has-match")

(assert-not (has-match "Z" "as")
            "has not match")

(assert (= -0.005 (score "s" "as"))
        "score")

(assert (deep= (positions "s" "has")
               @[2])
        "positions")

(end-suite)
