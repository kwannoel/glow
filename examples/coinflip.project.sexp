(@module (begin end)
         (@label begin)
         (def coinFlip
              (@make-interaction
               ((@list A B))
               (wagerAmount)
               (begin0 end0)
               (#f
                (@label begin0)
                (@label cp)
                (consensus:set-participant A)
                (consensus:set-participant A)
                (consensus:set-participant A)
                (def commitment (expect-published 'commitment))
                (consensus:set-participant A)
                (expect-deposited wagerAmount)
                (@label cp0)
                (consensus:set-participant B)
                (consensus:set-participant B)
                (def randB (expect-published 'randB))
                (consensus:set-participant B)
                (expect-deposited wagerAmount)
                (@label cp1)
                (consensus:set-participant A)
                (def randA (expect-published 'randA))
                (def tmp (digest randA))
                (def tmp0 (== commitment tmp))
                (require! tmp0)
                (def tmp1 (@app bitwise-xor randA randB))
                (def tmp2 (@app bitwise-and tmp1 1))
                (def tmp3 (== tmp2 0))
                (@label begin-switch)
                (switch tmp3
                        (#t (def tmp4 (@app * 2 wagerAmount)) (consensus:withdraw A tmp4) (return (@tuple)))
                        (#f (def tmp5 (@app * 2 wagerAmount)) (consensus:withdraw B tmp5) (return (@tuple))))
                (@label end-switch)
                (@label end0))
               (A (@label begin0)
                  (@label cp)
                  (participant:set-participant A)
                  (def randA (@app randomUInt256))
                  (participant:set-participant A)
                  (def commitment (digest randA))
                  (participant:set-participant A)
                  (add-to-publish 'commitment commitment)
                  (participant:set-participant A)
                  (add-to-deposit wagerAmount)
                  (@label cp0)
                  (participant:set-participant B)
                  (participant:set-participant B)
                  (def randB (expect-published 'randB))
                  (participant:set-participant B)
                  (expect-deposited wagerAmount)
                  (@label cp1)
                  (participant:set-participant A)
                  (add-to-publish 'randA randA)
                  (def tmp (digest randA))
                  (def tmp0 (== commitment tmp))
                  (require! tmp0)
                  (def tmp1 (@app bitwise-xor randA randB))
                  (def tmp2 (@app bitwise-and tmp1 1))
                  (def tmp3 (== tmp2 0))
                  (@label begin-switch)
                  (switch tmp3
                          (#t (def tmp4 (@app * 2 wagerAmount)) (participant:withdraw A tmp4) (return (@tuple)))
                          (#f (def tmp5 (@app * 2 wagerAmount)) (participant:withdraw B tmp5) (return (@tuple))))
                  (@label end-switch)
                  (@label end0))
               (B (@label begin0)
                  (@label cp)
                  (participant:set-participant A)
                  (participant:set-participant A)
                  (participant:set-participant A)
                  (def commitment (expect-published 'commitment))
                  (participant:set-participant A)
                  (expect-deposited wagerAmount)
                  (@label cp0)
                  (participant:set-participant B)
                  (def randB (@app randomUInt256))
                  (participant:set-participant B)
                  (add-to-publish 'randB randB)
                  (participant:set-participant B)
                  (add-to-deposit wagerAmount)
                  (@label cp1)
                  (participant:set-participant A)
                  (def randA (expect-published 'randA))
                  (def tmp (digest randA))
                  (def tmp0 (== commitment tmp))
                  (require! tmp0)
                  (def tmp1 (@app bitwise-xor randA randB))
                  (def tmp2 (@app bitwise-and tmp1 1))
                  (def tmp3 (== tmp2 0))
                  (@label begin-switch)
                  (switch tmp3
                          (#t (def tmp4 (@app * 2 wagerAmount)) (participant:withdraw A tmp4) (return (@tuple)))
                          (#f (def tmp5 (@app * 2 wagerAmount)) (participant:withdraw B tmp5) (return (@tuple))))
                  (@label end-switch)
                  (@label end0))))
         (return (@tuple))
         (@label end))
