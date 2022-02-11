(declare-project
  :name "jfzy"
  :author "Josef Pospíšil <josef.pospisil@laststar.eu>"
  :description "Janet wrapper around fzy algorithm"
  :license "MIT"
  :url "https://git.sr.ht/~pepe/jfzy"
  :repo "git+https://git.sr.ht/~pepe/jfzy"
  :dependencies ["spork" {:repo "https://github.com/pepe/jpm"
                          :sha "3661b8af8d14f7dd639c1da2b3119c993b9f31a7"}])

(import jpm/cgen)
(cgen/add-loader)
(import /fzy-reduced)

(task "fzy_reduced.c" []
      (fzy-reduced/render "fzy_reduced.c"))

(declare-native
  :name "fzy"
  :source @["fzy_reduced.c"])
