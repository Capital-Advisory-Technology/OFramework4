// Functions used as exits when building a model.
// Function variables with suggested ranges, note that {}
// means flexible & [] means fixed (including)

#property copyright "Framework 4"
#property strict

#include <CAT/common/enums.mqh>
#include <CAT/common/utils.mqh>
#include <CAT/main/positionmanager.mqh>

//| Relative Vigor Index (RVI) Crossover Exit
//| RVI_period - {14 - 28}
OrderAction ExitRVI(int RVI_period) {
   OrderAction signal = OA_IGNORE;

   double RVIBuy = iCustom(NULL,0,"RelativeVigorIndex",RVI_period,0,1);
   double RVISell = iCustom(NULL,0,"RelativeVigorIndex",RVI_period,1,1);
   double RVIBuyPrev = iCustom(NULL,0,"RelativeVigorIndex",RVI_period,0,2);
   double RVISellPrev = iCustom(NULL,0,"RelativeVigorIndex",RVI_period,1,2);

   if (openPositionType == 0) {
      if (ShortCrossOver(RVIBuy, RVISell, RVIBuyPrev, RVISellPrev)) signal = OA_CLOSE;  
   } else if (openPositionType == 1) {
      if (LongCrossOver(RVIBuy, RVISell, RVIBuyPrev, RVISellPrev)) signal = OA_CLOSE;
   }

   return signal;
}

