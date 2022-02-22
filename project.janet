(declare-project
  :name "jfzy"
  :author "Josef Pospíšil <josef.pospisil@laststar.eu>"
  :description "Janet wrapper around fzy algorithm"
  :license "MIT"
  :url "https://git.sr.ht/~pepe/jfzy"
  :repo "git+https://git.sr.ht/~pepe/jfzy"
  :dependencies ["spork"])

(use jpm/cgen)
(add-loader)
(import /fzy-reduced)

(task "fzy_reduced.c" []
      (fzy-reduced/render "fzy_reduced.c"))

(declare-native
  :name "fzy"
  :source @["fzy_reduced.c"])
