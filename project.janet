(declare-project
  :name "jfzy"
  :author "Josef Pospíšil <josef.pospisil@laststar.eu>"
  :description "Janet wrapper around fzy algorithm"
  :license "MIT"
  :url "https://git.sr.ht/~pepe/jfzy"
  :repo "git+https://git.sr.ht/~pepe/jfzy"
  :dependencies ["spork"])

(declare-native
  :name "fzy"
  :source @["fzy.c"])
