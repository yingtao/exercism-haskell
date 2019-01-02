module SecretHandshake (handshake) where
import Data.Bits(testBit)

handshake :: Int -> [String]
handshake n = case needReverse of
    True -> reverse result
    False -> result
    where 
        result = 
            ["wink"|isBitSet 0] ++ 
            ["double blink"|isBitSet 1] ++
            ["close your eyes"|isBitSet 2] ++
            ["jump"|isBitSet 3]

        isBitSet = testBit n
        needReverse = isBitSet 4