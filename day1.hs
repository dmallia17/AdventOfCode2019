-- fuel req = floor(mass / 3) - 2
-- Calc fuel for each module and then add all values

import System.IO

req_fuel :: Int -> Int
req_fuel mass = mass `div` 3 - 2

get_total_fuel :: [String] -> Int
get_total_fuel = foldr (\val -> (+ (req_fuel $ read val :: Int))) 0
--get_total_fuel massvals = sum . map (\x -> req_fuel $ read val :: Int)  

main :: IO ()
main = do
  handle <- openFile "day1input.txt" ReadMode
  contents <- hGetContents handle
  putStrLn $ show $ get_total_fuel $ lines contents
  hClose handle

