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
