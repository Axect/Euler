data Year = Year Integer deriving (Eq, Show)
data Month = Jan | Feb | Mar | Apr | May | Jun | Jul | Aug | Sep | Oct | Nov | Dec deriving (Eq, Show)

type Leap = Bool

calcDay :: Month -> Leap -> Integer
calcDay n leap | n `elem` [Apr, Jun, Sep, Nov] = 30
               | n == Feb && leap              = 29
               | n == Feb && not leap          = 28
               | otherwise                     = 31
