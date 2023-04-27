-- fuel req = floor(mass / 3) - 2
-- Calc fuel for each module and then add all values

import System.IO

req_fuel :: Int -> Int
req_fuel mass 
  | curr_fuel <= 0 = 0
  | otherwise = curr_fuel + (req_fuel curr_fuel) 
  where curr_fuel = mass `div` 3 - 2

get_total_fuel :: [String] -> Int
get_total_fuel = foldr (\val -> (+ (req_fuel $ read val :: Int))) 0
--get_total_fuel massvals = sum . map (\x -> req_fuel $ read val :: Int)  

main :: IO ()
main = do
  handle <- openFile "day1input.txt" ReadMode
  contents <- hGetContents handle
  putStrLn $ show $ get_total_fuel $ lines contents
  hClose handle

