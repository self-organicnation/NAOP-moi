void followDistribueAddLfoPattern(){ 
 
  // lfoPattern();  // add key o= opposite signl 2
        signal[2] = (0*PI + (frameCount / 300.0) * cos (1000 / 500.0)*-1)%1;

   text ( " signnal2 " +nf(signal[2], 0, 2) , 400, 800 ); // from Processing is -1, 1

//signal[2]= map ( signal[2], 0, 1, 0, TWO_PI);  //from Processing signal2  is -1, 1

signal[2]= map ( signal[2], 0 , 1, 0, 1);  //from Processing signal2  is -1, 1

//**signal[2]= 0.05;
//**signal[2]= map ( signal[2], 0 , -1, 0, 1);  //from Processing signal2  is -1, 1

   text ( " followDistribueAddLfoPattern signal2 " + nf(signal[2], 0, 2),  400, 900 ); // from Processing is -1, 1

   for (int i = 0; i <  networkSize-0; i+=1) {

    phaseMappedFollow[i]=map (signal[2], 0, 1, 0, TWO_PI);

    /*
    if (phaseMapped[i]<0){
   
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
       }
       
   else {
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
    }
   */ 
  }

   for (int i = 0; i < networkSize; i+=1) { 
 
   // phaseMappedFollow[i]=map (signal[2], 0, 1, 0, TWO_PI);
    phaseMapped[i] = phaseMappedFollow[i]+phasePatternFollow[i];
   // phaseMapped[i] = phaseMapped[i] + phaseMappedFollow[i]+phasePatternFollow[i];  //phaseMapped[i]+ add offset given by pendularPattern
    phaseMapped[i] = phaseMapped[i]%TWO_PI; 
    
      
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
 
 //   net.oldPhase[i]= net.phase[i];
 //   net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
      phaseMapped[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
      newPosF[i]= phaseMapped[i];
    //  net.phase[i]= phaseMapped[i];

       }
       
   else {
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
 //   net.oldPhase[i]=net.phase[i];

//    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
      phaseMapped[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
      newPosF[i]= phaseMapped[i];
   //     net.phase[i]= phaseMapped[i];
    }
  }
 
   
 
 // phasePatternToFollow only when a key is pressed

     if (key != '#'  ) {
       text ( " doItOnce ", 400, 700);
       phasePattern();
            
    for (int i = 0; i < networkSize; i+=1) { 

  //  phasePatternFollow[i] = net.phase[i]+phaseMapped[i];
    phasePatternFollow[i] = net.phase[i]; //
 //   phaseMapped[i] =  phaseMapped[i] + phasePatternFollow[i]; // phaseMapped[i] +  //phaseMapped[i]+ add offset given by pendularPattern
    phasePatternFollow[i] =  phasePatternFollow[i]%TWO_PI; 
/*
     if ( phaseMapped[i]<0){
     DataToDueCircularVirtualPosition[i]= int (map ( phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
       }
       
   else {
    
    DataToDueCircularVirtualPosition[i]= (int) map ( phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
    }
  */
   
   /*
    if (phasePatternFollow[i]<0){
     DataToDueCircularVirtualPosition[i]= int (map (phasePatternFollow[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]= net.phase[i];
  //  net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
       }
       
   else {
    
    DataToDueCircularVirtualPosition[i]= (int) map (phasePatternFollow[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
  //  net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
    }
   */

   }

  }
 


  key='#';
  send24DatasToTeensy6motors(10, 3, -3, -1);

} 