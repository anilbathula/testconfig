trigger FlatPayCommission on Commission_Setting__c (after insert, before update) {
    
    Commission_Setting__c thiscomm;
    Integer currMonth=system.Today().Month();
    for(Commission_Setting__c comm:trigger.new){
        thiscomm=comm;
    }
    
        if(thiscomm.Achievement__c=='Payment on Slab Achievement'&& 
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='%ge'&&
            thiscomm.Commission_based_on__c=='Disbursement'){                                                                                             
        
            thiscomm.Jan_DB__c=(currMonth==1)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;               
            thiscomm.Feb_DB__c=(currMonth==2)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;                
            thiscomm.Mar_DB__c=(currMonth==3)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Apr_DB__c=(currMonth==4)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.May_DB__c=(currMonth==5)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;  
            thiscomm.Jun_DB__c=(currMonth==6)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
           
            thiscomm.Jul_DB__c=(currMonth==7)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Aug_DB__c=(currMonth==8)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Sep_DB__c=(currMonth==9)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Oct_DB__c=(currMonth==10)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Nov_DB__c=(currMonth==11)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Dec_DB__c=(currMonth==12)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;    
                
        }else if(thiscomm.Achievement__c=='Payment on Slab Achievement'&&
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='Amount'&&
            thiscomm.Commission_based_on__c=='Disbursement'){
            
            thiscomm.Jan_DB__c=(currMonth==1)?thiscomm.FPSlabAch__c:0;
            thiscomm.Feb_DB__c=(currMonth==2)?thiscomm.FPSlabAch__c:0;
            thiscomm.Mar_DB__c=(currMonth==3)?thiscomm.FPSlabAch__c:0;
            thiscomm.Apr_DB__c=(currMonth==4)?thiscomm.FPSlabAch__c:0;
            thiscomm.May_DB__c=(currMonth==5)?thiscomm.FPSlabAch__c:0;
            thiscomm.Jun_DB__c=(currMonth==6)?thiscomm.FPSlabAch__c:0;
            
            thiscomm.Jul_DB__c=(currMonth==7)?thiscomm.FPSlabAch__c:0;
            thiscomm.Aug_DB__c=(currMonth==8)?thiscomm.FPSlabAch__c:0;
            thiscomm.Sep_DB__c=(currMonth==9)?thiscomm.FPSlabAch__c:0;
            thiscomm.Oct_DB__c=(currMonth==10)?thiscomm.FPSlabAch__c:0;
            thiscomm.Nov_DB__c=(currMonth==11)?thiscomm.FPSlabAch__c:0;
            thiscomm.Dec_DB__c=(currMonth==12)?thiscomm.FPSlabAch__c:0;
            
      }else if(thiscomm.Achievement__c=='Payment on Slab Achievement'&&
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='Amount'&&
            thiscomm.Commission_based_on__c=='Revenue Generated'){
            
            thiscomm.Jan_RB__c=(currMonth==1)?thiscomm.FPSlabAch__c:0;
            thiscomm.Feb_RB__c=(currMonth==2)?thiscomm.FPSlabAch__c:0;
            thiscomm.Mar_RB__c=(currMonth==3)?thiscomm.FPSlabAch__c:0;
            thiscomm.Apr_RB__c=(currMonth==4)?thiscomm.FPSlabAch__c:0;
            thiscomm.May_RB__c=(currMonth==5)?thiscomm.FPSlabAch__c:0;
            thiscomm.Jun_RB__c=(currMonth==6)?thiscomm.FPSlabAch__c:0;
            
            thiscomm.Jul_RB__c=(currMonth==7)?thiscomm.FPSlabAch__c:0;
            thiscomm.Aug_RB__c=(currMonth==8)?thiscomm.FPSlabAch__c:0;
            thiscomm.Sep_RB__c=(currMonth==9)?thiscomm.FPSlabAch__c:0;
            thiscomm.Oct_RB__c=(currMonth==10)?thiscomm.FPSlabAch__c:0;
            thiscomm.Nov_RB__c=(currMonth==11)?thiscomm.FPSlabAch__c:0;
            thiscomm.Dec_RB__c=(currMonth==12)?thiscomm.FPSlabAch__c:0;
                 
      }else if(thiscomm.Achievement__c=='Payment on Slab Achievement'&&
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='%ge'&&
            thiscomm.Commission_based_on__c=='Revenue Generated'){
            thiscomm.Jan_RB__c=(currMonth==1)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;               
            thiscomm.Feb_RB__c=(currMonth==2)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;                
            thiscomm.Mar_RB__c=(currMonth==3)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Apr_RB__c=(currMonth==4)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.May_RB__c=(currMonth==5)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;  
            thiscomm.Jun_RB__c=(currMonth==6)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            
            thiscomm.Jul_RB__c=(currMonth==7)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Aug_RB__c=(currMonth==8)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Sep_RB__c=(currMonth==9)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Oct_RB__c=(currMonth==10)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Nov_RB__c=(currMonth==11)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;
            thiscomm.Dec_RB__c=(currMonth==12)?(thiscomm.FPSlabAch__c/100)*thiscomm.Amount_for_FPSlabAch__c:0;  
               
      }if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='%ge'&&
            thiscomm.Commission_based_on__c=='Disbursement'){
            
            thiscomm.Jan_DB__c=(currMonth==1)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Feb_DB__c=(currMonth==2)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Mar_DB__c=(currMonth==3)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Apr_DB__c=(currMonth==4)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.May_DB__c=(currMonth==5)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;   
            thiscomm.Jun_DB__c=(currMonth==6)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
          
            thiscomm.Jul_DB__c=(currMonth==7)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Aug_DB__c=(currMonth==8)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Sep_DB__c=(currMonth==9)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Oct_DB__c=(currMonth==10)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Nov_DB__c=(currMonth==11)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Dec_DB__c=(currMonth==12)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
                
      }else if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='Amount'&&
            thiscomm.Commission_based_on__c=='Disbursement'&&
            thiscomm.Amount_Paid_on_Inc_Ran__c!=null){
        
            thiscomm.Jan_DB__c=(currMonth==1)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Feb_DB__c=(currMonth==2)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Mar_DB__c=(currMonth==3)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Apr_DB__c=(currMonth==4)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.May_DB__c=(currMonth==5)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Jun_DB__c=(currMonth==6)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            
            thiscomm.Jul_DB__c=(currMonth==7)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Aug_DB__c=(currMonth==8)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Sep_DB__c=(currMonth==9)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Oct_DB__c=(currMonth==10)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Nov_DB__c=(currMonth==11)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Dec_DB__c=(currMonth==12)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
                
      }else if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='%ge'&&
            thiscomm.Commission_based_on__c=='Revenue Generated'){
        
            thiscomm.Jan_RB__c=(currMonth==1)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Feb_RB__c=(currMonth==2)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Mar_RB__c=(currMonth==3)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Apr_RB__c=(currMonth==4)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.May_RB__c=(currMonth==5)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;   
            thiscomm.Jun_RB__c=(currMonth==6)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
          
            thiscomm.Jul_RB__c=(currMonth==7)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Aug_RB__c=(currMonth==8)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Sep_RB__c=(currMonth==9)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Oct_RB__c=(currMonth==10)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Nov_RB__c=(currMonth==11)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
            thiscomm.Dec_RB__c=(currMonth==12)?(thiscomm.FPSlabRan__c/100)*thiscomm.Amount_for_FPSlabRan__c:0;
                            
      }else if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
            thiscomm.Commission_paid_on__c=='Flat Pay'&& 
            thiscomm.Commission_paid_on_2__c=='Amount'&&
            thiscomm.Commission_based_on__c=='Revenue Generated'&&
            thiscomm.Amount_Paid_on_Inc_Ran__c!=null){
        
            thiscomm.Jan_RB__c=(currMonth==1)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Feb_RB__c=(currMonth==2)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Mar_RB__c=(currMonth==3)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Apr_RB__c=(currMonth==4)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.May_RB__c=(currMonth==5)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Jun_RB__c=(currMonth==6)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            
            thiscomm.Jul_RB__c=(currMonth==7)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Aug_RB__c=(currMonth==8)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Sep_RB__c=(currMonth==9)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Oct_RB__c=(currMonth==10)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Nov_RB__c=(currMonth==11)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;
            thiscomm.Dec_RB__c=(currMonth==12)?thiscomm.FPSlabRan__c*(thiscomm.Amount_for_FPSlabRan__c/thiscomm.Amount_Paid_on_Inc_Ran__c):0;   
           }
    
}

/*Note :- 100000 is replaced by thiscomm.Amount_Paid_on_Inc_Ran__c for exact calculation  */