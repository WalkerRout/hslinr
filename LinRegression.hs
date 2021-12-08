factored :: [Double] -> Double
factored xs = (fromIntegral (-2)) / (fromIntegral $ length xs)


mGradient :: [Double] -> [Double] -> Double -> Double -> Double
mGradient xs ys m b = (factored xs) * (diff xs ys 0)
  where
    diff [] _ acc = acc
    diff _ [] acc = acc
    diff (x:xs) (y:ys) acc = 
      let s = x*(y - (m*x + b))
      in diff xs ys (acc+s)


bGradient :: [Double] -> [Double] -> Double -> Double -> Double
bGradient xs ys m b = (factored xs) * (diff xs ys 0)
  where
    diff [] _ acc = acc
    diff _ [] acc = acc
    diff (x:xs) (y:ys) acc = 
      let s = (y - (m*x + b))
      in diff xs ys (acc+s)


step :: [Double] -> [Double] -> Double -> Double -> Double -> [Double]
step xs ys m b lr =
  let b' = b - (lr * bGradient xs ys m b)
      m' = m - (lr * mGradient xs ys m b)
  in [m', b']


gradientDescent :: [Double] -> [Double] -> Double -> Double -> Double -> Double -> [Double]
gradientDescent _ _ m b _ 0 = [b, m]
gradientDescent xs ys m b lr it = 
  let [m', b'] = step xs ys m b lr
  in gradientDescent xs ys m' b' lr (it-1)



xs = [1, 2, 3, 4, 5, 6, 7, 8, 9]
ys = [233, 222, 123, 83, 345, 200, 192, 256, 289]
m = 0
b = 0

main :: IO ()
main = do
  let bm = gradientDescent xs ys m b 0.01 1500
  print $ (bm !! 1) * 10 + (bm !! 0)
