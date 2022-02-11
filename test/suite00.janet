(use spork/test)
(use /build/fzy)

(start-suite 0)

(assert (> 0 score-min) "score-min")
(assert (< 0 score-max) "score-max")

(assert (has-match "s" "as")
        "has-match")

(assert-not (has-match "Z" "as")
            "has not match")

(assert (= -0.015 (score "ss" "ases"))
        "score")

(assert (deep= (positions "s" "has")
               @[2])
        "positions")

(assert (deep= (positions "as" "has")
               @[1 2])
        "positions")

(end-suite)
