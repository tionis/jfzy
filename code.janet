(def funcs @{})

(defmacro def-cfun-with-needle-n-haystack [name doc & body]
  (def fname (symbol 'cfun_ (string/replace-all "-" "_" name)))
  (put funcs name [fname doc])
  ~(quote
     [(defn [static] ,fname [(argc int32_t) (*argv Janet)] Janet
        (janet_fixarity argc 2)
        (def bv JanetByteView nil)
        (set bv (janet_getbytes argv 0))
        (def *needle (const char) (janet_string bv.bytes bv.len))
        (set bv (janet_getbytes argv 1))
        (def *haystack (const char) (janet_string bv.bytes bv.len))
        ,;body)]))

(defn def-cfuns []
  ~((def "cfuns[]" JanetReg
      (array
        ,;(seq [[name [fname doc]] :pairs funcs]
            ~(array ,(string name) ,fname ,doc))
        (array NULL NULL NULL)))))

(def punctuation
  (seq [[c s] :in [["/" "SCORE_MATCH_SLASH"]
                   ["-" "SCORE_MATCH_WORD"]
                   ["_" "SCORE_MATCH_WORD"]
                   [" " "SCORE_MATCH_WORD"]
                   ["." "SCORE_MATCH_DOT"]]]
    ~(literal ,(string "['" c "'] = " s))))

(defn assign-lower [v]
  (seq [c :range [97 123]]
    ~(literal ,(string "['" (string/from-bytes c) "'] = " v))))

(defn assign-upper [v]
  (seq [c :range [65 91]]
    ~(literal ,(string "['" (string/from-bytes c) "'] = " v))))

(defn assign-digit [v]
  (seq [c :range [48 58]]
    ~(literal ,(string "['" (string/from-bytes c) "'] = " v))))

(def bonus-states
  ~((def "bonuss_states[3][256]" (const score_t)
      (array (array 0)
             (array ,;punctuation)
             (array ,;punctuation
                    ,;(assign-lower "SCORE_MATCH_CAPITAL"))))))

(def bonus-index
  ~((def "bonuss_index[256]" (const size_t)
      (array ,;(assign-digit 1)
             ,;(assign-upper 2)
             ,;(assign-lower 1)))))
