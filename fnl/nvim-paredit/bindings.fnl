(module nvim-paredit.bindings
  {autoload {core nvim-paredit.core
             insertion nvim-paredit.insertion
             p nvim-paredit.position}})

(vim.keymap.set :n ">)" core.slurp-forward)
(vim.keymap.set :n "<)" core.barf-forward)
(vim.keymap.set :n "<(" core.slurp-backward)
(vim.keymap.set :n ">(" core.barf-backward)
(vim.keymap.set :n ">e" core.move-element-forward)
(vim.keymap.set :n ">f" core.move-form-forward)
(vim.keymap.set :n "<e" core.move-element-backward)
(vim.keymap.set :n "<f" core.move-form-backward)
(vim.keymap.set :n "•e" core.raise-element)
(vim.keymap.set :n "•f" core.raise-form)
(vim.keymap.set :n "_#f" core.disexpress-form)
(vim.keymap.set :n "_#e" core.disexpress-element)
(vim.keymap.set :n "•#f" core.dedisexpress-form)
(vim.keymap.set :n "•#e" core.dedisexpress-element)
(vim.keymap.set :n "_f" core.elide-form)
(vim.keymap.set :n "_e" core.elide-element)
(vim.keymap.set :n :\f core.wrap-in-form)
(vim.keymap.set :n :\. core.wrap-in-fn-call)
(vim.keymap.set :n :\/ core.split)

(vim.keymap.set :i "(" (fn [] (insertion.insert-at-cursor "()" 1)))
(vim.keymap.set :i "[" (fn [] (insertion.insert-at-cursor "[]" 1)))
(vim.keymap.set :i "{" (fn [] (insertion.insert-at-cursor "{}" 1)))

(vim.keymap.set :i ")" (fn [] (if (= (insertion.next-char) ")")
                                (p.set-cursor-pos (p.pos+ (p.get-cursor-pos)
                                                          [0 1]))
                                (insertion.insert-at-cursor ")" 1))))
(vim.keymap.set :i "]" (fn [] (if (= (insertion.next-char) "]")
                                (p.set-cursor-pos (p.pos+ (p.get-cursor-pos)
                                                          [0 1]))
                                (insertion.insert-at-cursor "]" 1))))
(vim.keymap.set :i "}" (fn [] (if (= (insertion.next-char) "}")
                                (p.set-cursor-pos (p.pos+ (p.get-cursor-pos)
                                                          [0 1]))
                                (insertion.insert-at-cursor "}" 1))))

(vim.keymap.set :i "\"" (fn [] (let [nc (insertion.next-char)]
                                 (if (= nc "\"")
                                   (p.set-cursor-pos (p.pos+ (p.get-cursor-pos)
                                                             [0 1]))
                                   (insertion.insert-at-cursor "\"\"" 1)))))

