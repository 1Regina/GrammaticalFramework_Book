module Answer where
import PGF (Tree)
import Foods

transfer :: Tree -> Tree
transfer = gf . answer . fg

-- answer :: GQuestion -> GAnswer
-- answer p = case p of
--     GOdd x   -> test odd x
--     GEven x  -> test even x
--     GPrime x -> test prime x

-- value :: GObject -> Int
-- value e = case e of
--     GNumber (GInt i) -> i

-- test :: (Int -> Bool) -> GObject -> GAnswer
-- test f x = if f (value x) then GYes else GNo


-- prime :: Int -> Bool
-- prime x = elem x primes where
--     primes = sieve [2 .. x]
--     sieve (p:xs) = p : sieve [n | n <- xs, mod n p > 0]
--     sieve [] = []