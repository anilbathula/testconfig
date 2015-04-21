trigger IncrementalCommission on Commission_Setting__c (after insert, before update) {
    
    Commission_Setting__c thiscomm;
    Integer currMonth=system.Today().Month();
    
    for(Commission_Setting__c comm:trigger.new){
        thiscomm=comm;
    }
    
        if(thiscomm.Achievement__c=='Payment on Slab Achievement'&& 
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='%ge'&&
                thiscomm.Commission_based_on__c=='Disbursement'){            
                
                thiscomm.Jan_DB__c = (currMonth==1)?thiscomm.IncSlabAch_ge__c:0;        
                thiscomm.Feb_DB__c = (currMonth==2)?thiscomm.IncSlabAch_ge__c:0;
                thiscomm.Mar_DB__c = (currMonth==3)?thiscomm.IncSlabAch_ge__c:0;
                thiscomm.Apr_DB__c = (currMonth==4)?thiscomm.IncSlabAch_ge__c:0;
                thiscomm.May_DB__c = (currMonth==5)?thiscomm.IncSlabAch_ge__c:0; 
                thiscomm.Jun_DB__c = (currMonth==6)?thiscomm.IncSlabAch_ge__c:0; 
                    
                thiscomm.Jul_DB__c = (currMonth==7)?thiscomm.IncSlabAch_ge__c:0;       
                thiscomm.Aug_DB__c = (currMonth==8)?thiscomm.IncSlabAch_ge__c:0;        
                thiscomm.Sep_DB__c = (currMonth==9)?thiscomm.IncSlabAch_ge__c:0;          
                thiscomm.Oct_DB__c = (currMonth==10)?thiscomm.IncSlabAch_ge__c:0;           
                thiscomm.Nov_DB__c = (currMonth==11)?thiscomm.IncSlabAch_ge__c:0;     
                thiscomm.Dec_DB__c = (currMonth==12)?thiscomm.IncSlabAch_ge__c:0;    
                
        }else if(thiscomm.Achievement__c=='Payment on Slab Achievement'&&
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='Amount'&&
                thiscomm.Commission_based_on__c=='Disbursement'){
                    
                thiscomm.Jan_DB__c = (currMonth==1)?thiscomm.IncSlabAch_Amount__c:0;        
                thiscomm.Feb_DB__c = (currMonth==2)?thiscomm.IncSlabAch_Amount__c:0;
                thiscomm.Mar_DB__c = (currMonth==3)?thiscomm.IncSlabAch_Amount__c:0;
                thiscomm.Apr_DB__c = (currMonth==4)?thiscomm.IncSlabAch_Amount__c:0;
                thiscomm.May_DB__c = (currMonth==5)?thiscomm.IncSlabAch_Amount__c:0; 
                thiscomm.Jun_DB__c = (currMonth==6)?thiscomm.IncSlabAch_Amount__c:0; 
                
                thiscomm.Jul_DB__c = (currMonth==7)?thiscomm.IncSlabAch_Amount__c:0;       
                thiscomm.Aug_DB__c = (currMonth==8)?thiscomm.IncSlabAch_Amount__c:0;        
                thiscomm.Sep_DB__c = (currMonth==9)?thiscomm.IncSlabAch_Amount__c:0;          
                thiscomm.Oct_DB__c = (currMonth==10)?thiscomm.IncSlabAch_Amount__c:0;           
                thiscomm.Nov_DB__c = (currMonth==11)?thiscomm.IncSlabAch_Amount__c:0;     
                thiscomm.Dec_DB__c = (currMonth==12)?thiscomm.IncSlabAch_Amount__c:0;       
        
       }else if(thiscomm.Achievement__c=='Payment on Slab Achievement'&& 
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='%ge'&&
                thiscomm.Commission_based_on__c=='Revenue Generated'){
                
                thiscomm.Jan_RB__c = (currMonth==1)?thiscomm.IncSlabAch_ge__c:0;        
                thiscomm.Feb_RB__c = (currMonth==2)?thiscomm.IncSlabAch_ge__c:0;
                thiscomm.Mar_RB__c = (currMonth==3)?thiscomm.IncSlabAch_ge__c:0;
                thiscomm.Apr_RB__c = (currMonth==4)?thiscomm.IncSlabAch_ge__c:0;
                thiscomm.May_RB__c = (currMonth==5)?thiscomm.IncSlabAch_ge__c:0; 
                thiscomm.Jun_RB__c = (currMonth==6)?thiscomm.IncSlabAch_ge__c:0; 
                
                thiscomm.Jul_RB__c = (currMonth==7)?thiscomm.IncSlabAch_ge__c:0;       
                thiscomm.Aug_RB__c = (currMonth==8)?thiscomm.IncSlabAch_ge__c:0;        
                thiscomm.Sep_RB__c = (currMonth==9)?thiscomm.IncSlabAch_ge__c:0;          
                thiscomm.Oct_RB__c = (currMonth==10)?thiscomm.IncSlabAch_ge__c:0;           
                thiscomm.Nov_RB__c = (currMonth==11)?thiscomm.IncSlabAch_ge__c:0;     
                thiscomm.Dec_RB__c = (currMonth==12)?thiscomm.IncSlabAch_ge__c:0;   
                        
        }else if(thiscomm.Achievement__c=='Payment on Slab Achievement'&&
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='Amount'&&
                thiscomm.Commission_based_on__c=='Revenue Generated'){
                
                thiscomm.Jan_RB__c = (currMonth==1)?thiscomm.IncSlabAch_Amount__c:0;        
                thiscomm.Feb_RB__c = (currMonth==2)?thiscomm.IncSlabAch_Amount__c:0;
                thiscomm.Mar_RB__c = (currMonth==3)?thiscomm.IncSlabAch_Amount__c:0;
                thiscomm.Apr_RB__c = (currMonth==4)?thiscomm.IncSlabAch_Amount__c:0;
                thiscomm.May_RB__c = (currMonth==5)?thiscomm.IncSlabAch_Amount__c:0; 
                thiscomm.Jun_RB__c = (currMonth==6)?thiscomm.IncSlabAch_Amount__c:0; 
                
                thiscomm.Jul_RB__c = (currMonth==7)?thiscomm.IncSlabAch_Amount__c:0;       
                thiscomm.Aug_RB__c = (currMonth==8)?thiscomm.IncSlabAch_Amount__c:0;        
                thiscomm.Sep_RB__c = (currMonth==9)?thiscomm.IncSlabAch_Amount__c:0;          
                thiscomm.Oct_RB__c = (currMonth==10)?thiscomm.IncSlabAch_Amount__c:0;           
                thiscomm.Nov_RB__c = (currMonth==11)?thiscomm.IncSlabAch_Amount__c:0;     
                thiscomm.Dec_RB__c = (currMonth==12)?thiscomm.IncSlabAch_Amount__c:0;             
                       
        }if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='%ge'&&
                thiscomm.Commission_based_on__c=='Disbursement'){
                
                thiscomm.Jan_DB__c = (currMonth==1)?thiscomm.IncSlabRan_ge__c:0;        
                thiscomm.Feb_DB__c = (currMonth==2)?thiscomm.IncSlabRan_ge__c:0;
                thiscomm.Mar_DB__c = (currMonth==3)?thiscomm.IncSlabRan_ge__c:0;
                thiscomm.Apr_DB__c = (currMonth==4)?thiscomm.IncSlabRan_ge__c:0;
                thiscomm.May_DB__c = (currMonth==5)?thiscomm.IncSlabRan_ge__c:0; 
                thiscomm.Jun_DB__c = (currMonth==6)?thiscomm.IncSlabRan_ge__c:0; 
                
                thiscomm.Jul_DB__c = (currMonth==7)?thiscomm.IncSlabRan_ge__c:0;       
                thiscomm.Aug_DB__c = (currMonth==8)?thiscomm.IncSlabRan_ge__c:0;        
                thiscomm.Sep_DB__c = (currMonth==9)?thiscomm.IncSlabRan_ge__c:0;          
                thiscomm.Oct_DB__c = (currMonth==10)?thiscomm.IncSlabRan_ge__c:0;           
                thiscomm.Nov_DB__c = (currMonth==11)?thiscomm.IncSlabRan_ge__c:0;     
                thiscomm.Dec_DB__c = (currMonth==12)?thiscomm.IncSlabRan_ge__c:0;  
                     
                
        }else if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='Amount'&&
                thiscomm.Commission_based_on__c=='Disbursement'){
                
                thiscomm.Jan_DB__c = (currMonth==1)?thiscomm.IncSlabRan_Amount__c:0;        
                thiscomm.Feb_DB__c = (currMonth==2)?thiscomm.IncSlabRan_Amount__c:0;
                thiscomm.Mar_DB__c = (currMonth==3)?thiscomm.IncSlabRan_Amount__c:0;
                thiscomm.Apr_DB__c = (currMonth==4)?thiscomm.IncSlabRan_Amount__c:0;
                thiscomm.May_DB__c = (currMonth==5)?thiscomm.IncSlabRan_Amount__c:0; 
                thiscomm.Jun_DB__c = (currMonth==6)?thiscomm.IncSlabRan_Amount__c:0; 
                
                thiscomm.Jul_DB__c = (currMonth==7)?thiscomm.IncSlabRan_Amount__c:0;       
                thiscomm.Aug_DB__c = (currMonth==8)?thiscomm.IncSlabRan_Amount__c:0;        
                thiscomm.Sep_DB__c = (currMonth==9)?thiscomm.IncSlabRan_Amount__c:0;          
                thiscomm.Oct_DB__c = (currMonth==10)?thiscomm.IncSlabRan_Amount__c:0;           
                thiscomm.Nov_DB__c = (currMonth==11)?thiscomm.IncSlabRan_Amount__c:0;     
                thiscomm.Dec_DB__c = (currMonth==12)?thiscomm.IncSlabRan_Amount__c:0;
                       
                
        }else if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='%ge'&&
                thiscomm.Commission_based_on__c=='Revenue Generated'){
                
                thiscomm.Jan_RB__c = (currMonth==1)?thiscomm.IncSlabRan_ge__c:0;        
                thiscomm.Feb_RB__c = (currMonth==2)?thiscomm.IncSlabRan_ge__c:0;
                thiscomm.Mar_RB__c = (currMonth==3)?thiscomm.IncSlabRan_ge__c:0;
                thiscomm.Apr_RB__c = (currMonth==4)?thiscomm.IncSlabRan_ge__c:0;
                thiscomm.May_RB__c = (currMonth==5)?thiscomm.IncSlabRan_ge__c:0; 
                thiscomm.Jun_RB__c = (currMonth==6)?thiscomm.IncSlabRan_ge__c:0; 
                
                thiscomm.Jul_RB__c = (currMonth==7)?thiscomm.IncSlabRan_ge__c:0;       
                thiscomm.Aug_RB__c = (currMonth==8)?thiscomm.IncSlabRan_ge__c:0;        
                thiscomm.Sep_RB__c = (currMonth==9)?thiscomm.IncSlabRan_ge__c:0;          
                thiscomm.Oct_RB__c = (currMonth==10)?thiscomm.IncSlabRan_ge__c:0;           
                thiscomm.Nov_RB__c = (currMonth==11)?thiscomm.IncSlabRan_ge__c:0;     
                thiscomm.Dec_RB__c = (currMonth==12)?thiscomm.IncSlabRan_ge__c:0;   
                
        }else if(thiscomm.Achievement__c=='Payment With in the Slab Range'&& 
                thiscomm.Commission_paid_on__c=='Incremental'&& 
                thiscomm.Commission_paid_on_2__c=='Amount'&&
                thiscomm.Commission_based_on__c=='Revenue Generated'){
                
                thiscomm.Jan_RB__c = (currMonth==1)?thiscomm.IncSlabRan_Amount__c:0;        
                thiscomm.Feb_RB__c = (currMonth==2)?thiscomm.IncSlabRan_Amount__c:0;
                thiscomm.Mar_RB__c = (currMonth==3)?thiscomm.IncSlabRan_Amount__c:0;
                thiscomm.Apr_RB__c = (currMonth==4)?thiscomm.IncSlabRan_Amount__c:0;
                thiscomm.May_RB__c = (currMonth==5)?thiscomm.IncSlabRan_Amount__c:0; 
                thiscomm.Jun_RB__c = (currMonth==6)?thiscomm.IncSlabRan_Amount__c:0; 
                
                thiscomm.Jul_RB__c = (currMonth==7)?thiscomm.IncSlabRan_Amount__c:0;       
                thiscomm.Aug_RB__c = (currMonth==8)?thiscomm.IncSlabRan_Amount__c:0;        
                thiscomm.Sep_RB__c = (currMonth==9)?thiscomm.IncSlabRan_Amount__c:0;          
                thiscomm.Oct_RB__c = (currMonth==10)?thiscomm.IncSlabRan_Amount__c:0;           
                thiscomm.Nov_RB__c = (currMonth==11)?thiscomm.IncSlabRan_Amount__c:0;     
                thiscomm.Dec_RB__c = (currMonth==12)?thiscomm.IncSlabRan_Amount__c:0;   
                
        }               
}