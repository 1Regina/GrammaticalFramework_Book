module Main where

import PGF
import System (getArgs)

main :: IO ()
main = do
    file:_ <- getArgs
    gr     <- readPGF file
    -- interact (translate gr)  -- interact only takes care of 1 expr translation at a time. Swap it to loop and added loop function at the bottom
    loop (translate gr)

translate :: PGF -> String -> String
translate gr s = case parseAllLang gr (startCat gr) s of
    (lg, t:_) :_ -> unlines
        [linearize gr l t | l <- languages gr, l /= lg]
    _ -> "No Parse"

loop :: (String -> String) -> IO ()
loop trans = do
    s <- getLine
    if s == "quit" then putStrLn "bye" else do
        putStrLn $ trans s
        loop trans

-- Query - Answer (yes/no) translate function in same language
translate :: (Tree -> Tree) -> PGF -> String -> String
translate trf gr =
    case parseAllLang gr (startCat gr) s of
        (lg, t:_) :_ -> linearize gr lg (trf t)
        _ -> "No Parse"
