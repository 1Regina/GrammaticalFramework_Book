module Foods where

import PGF hiding (Tree)
----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> Expr
  fg :: Expr -> a

newtype GString = GString String deriving Show

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

newtype GInt = GInt Int deriving Show

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

newtype GFloat = GFloat Double deriving Show

instance Gf GFloat where
  gf (GFloat x) = mkFloat x
  fg t =
    case unFloat t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

data GComment = GPred GItem GQuality 
  deriving Show

data GItem =
   GThat GKind 
 | GThese GKind 
 | GThis GKind 
 | GThose GKind 
  deriving Show

data GKind =
   GCheese 
 | GFish 
 | GMod GQuality GKind 
 | GPizza 
 | GWine 
  deriving Show

data GQuality =
   GBoring 
 | GDelicious 
 | GExpensive 
 | GFresh 
 | GItalian 
 | GVery GQuality 
 | GWarm 
  deriving Show


instance Gf GComment where
  gf (GPred x1 x2) = mkApp (mkCId "Pred") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "Pred" -> GPred (fg x1) (fg x2)


      _ -> error ("no Comment " ++ show t)

instance Gf GItem where
  gf (GThat x1) = mkApp (mkCId "That") [gf x1]
  gf (GThese x1) = mkApp (mkCId "These") [gf x1]
  gf (GThis x1) = mkApp (mkCId "This") [gf x1]
  gf (GThose x1) = mkApp (mkCId "Those") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "That" -> GThat (fg x1)
      Just (i,[x1]) | i == mkCId "These" -> GThese (fg x1)
      Just (i,[x1]) | i == mkCId "This" -> GThis (fg x1)
      Just (i,[x1]) | i == mkCId "Those" -> GThose (fg x1)


      _ -> error ("no Item " ++ show t)

instance Gf GKind where
  gf GCheese = mkApp (mkCId "Cheese") []
  gf GFish = mkApp (mkCId "Fish") []
  gf (GMod x1 x2) = mkApp (mkCId "Mod") [gf x1, gf x2]
  gf GPizza = mkApp (mkCId "Pizza") []
  gf GWine = mkApp (mkCId "Wine") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Cheese" -> GCheese 
      Just (i,[]) | i == mkCId "Fish" -> GFish 
      Just (i,[x1,x2]) | i == mkCId "Mod" -> GMod (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "Pizza" -> GPizza 
      Just (i,[]) | i == mkCId "Wine" -> GWine 


      _ -> error ("no Kind " ++ show t)

instance Gf GQuality where
  gf GBoring = mkApp (mkCId "Boring") []
  gf GDelicious = mkApp (mkCId "Delicious") []
  gf GExpensive = mkApp (mkCId "Expensive") []
  gf GFresh = mkApp (mkCId "Fresh") []
  gf GItalian = mkApp (mkCId "Italian") []
  gf (GVery x1) = mkApp (mkCId "Very") [gf x1]
  gf GWarm = mkApp (mkCId "Warm") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "Boring" -> GBoring 
      Just (i,[]) | i == mkCId "Delicious" -> GDelicious 
      Just (i,[]) | i == mkCId "Expensive" -> GExpensive 
      Just (i,[]) | i == mkCId "Fresh" -> GFresh 
      Just (i,[]) | i == mkCId "Italian" -> GItalian 
      Just (i,[x1]) | i == mkCId "Very" -> GVery (fg x1)
      Just (i,[]) | i == mkCId "Warm" -> GWarm 


      _ -> error ("no Quality " ++ show t)


