(declare-project
  :name "jfzy"
  :author "Josef Pospíšil <josef.pospisil@laststar.eu>"
  :description "Janet wrapper around fzy algorithm"
  :license "MIT"
  :url "https://git.sr.ht/~pepe/jfzy"
  :repo "git+https://git.sr.ht/~pepe/jfzy"
  :dependencies ["spork" {:repo "https://github.com/pepe/jpm"
                          :sha "722862743586b4252722ce27ff592cd05fc0a897"}])

(import jpm/cgen)
(cgen/add-loader)
(import /fzy-reduced)

(task "fzy_reduced.c" []
      (fzy-reduced/render "fzy_reduced.c"))

(declare-native
  :name "fzy"
  :source @["fzy_reduced.c"])
