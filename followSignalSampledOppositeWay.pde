//followSignalSampledOppositeWay.pde

void followSignalSampledOppositeWay(int ratioTimeFrame){
  
if (formerDecayTime>decayTime){
  frameCountBis=frameCountBis+1;
  } 
  formerDecayTime = decayTime;
  decayTime = millis()%100;// incremente frameCountBis+1 each 100 millisecondes
 
  int delayRatio=ratioTimeFrame;

     //samplingMovement(2);
      samplingMovementPro();
  //    keyReleasedfollowSignal(); useless  phseShifting is controlled in keyRelesead
      float deltaFollow = TWO_PI; // not used
     //here in a previous function we could change the ball followed if the space of phase between phases[0] and phase 9 is more than 360° for example

 //     phases[0][frameCountBis % nbMaxDelais]= net.phase[networkSize-1]-0;

 
  println ( "  movementInterpolated ", movementInterpolated,
             " oldmovementInterpolated ", oldMovementInterpolated );
    
   
     phases[0][frameCountBis % nbMaxDelais]=movementInterpolated;
     println ( " net.phase[networkSize-1] ",  net.phase[networkSize-1] , " movementInterpolated " , movementInterpolated );
  //    drawBallOppositeWay(0, phases[0][frameCountBis % nbMaxDelais]); //networkSize-5 affiche le point 0. NE PAS AFFICHER SINON IL APPARAIT EN DOUBLE

   
    for (int i = 1; i < networkSize; i+=1) { // 1 follow phase 0
   
    
    //   follow( i-1, i, 20 * i, 0);  // Modifier les deux derniers paramètres : délais et phase
    followOppositeWay( i-1, i+0, delayTimeFollowPhase11*1*frameRatio/ratioTimeFrame, (phaseShiftingFollowPhase11));  // ici, le temps que les points attendent pour se suivre est de 5 frames, et il faut un espace entre eux de QUARTER_PI/6

 //     drawBall(i, phaseMapped[i] );
    drawBallOppositeWay( i, phases[i+0][frameCountBis % nbMaxDelais] );
    


    phaseMapped[i]=phases[i-0][frameCountBis % nbMaxDelais]; // use varaible phaseMapped (to play movement with time delay or phase delay) to well send it in Teensy
  //  phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
   // drawBallOppositeWay(  i, phases[i+0][frameCountBis % nbMaxDelais] );  
 }
 
 
  if (formerFormerKey == '#' || formerKeyMetro == 'J') {
    

      for (int i = 0; i < networkSize-0; i+=1) { 
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
 //   phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
   
    if (phaseMapped[i]<0){
      
    phaseMapped[i] = phaseMappedFollow[i]-phaseMapped[i];
 //   phaseMapped[i] = phaseMapped[i]%TWO_PI;
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
    net.phase[i]= net.phase[i]%TWO_PI;
  }
       
   else
   phaseMapped[i] = phaseMappedFollow[i]+phaseMapped[i];
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);
    net.phase[i]= net.phase[i]%TWO_PI;
  }
  
 
  
 }
  
   
    if (formerFormerKey != '#' ) {
    if (formerKeyMetro == 'J' ) {
     phasePattern();
     
    for (int i = 0; i < networkSize-0; i+=1) { 
   //   print ("  BEF phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
    phaseMappedFollow[i]= net.phase[i];
    phaseMapped[i] =  phaseMapped[i]+phaseMappedFollow[i];  // add offset given by pendularPattern
    phaseMapped[i] =  phaseMapped[i]%TWO_PI; 
   // print ("  phaseMapped[i]  ");    println ( phaseMapped[i]  ); 
   
    if (phaseMapped[i]<0){
   
     DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
   //  net.oldPhase[i]=phaseMapped[i];
    net.oldPhase[i]= net.phase[i];
    net.phase[i]= map (DataToDueCircularVirtualPosition[i], numberOfStep, 0, 0, -TWO_PI);
    net.phase[i]= phaseMapped[i];
       }
       
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep); 
    net.oldPhase[i]=net.phase[i];
    net.phase[i]= phaseMapped[i];
       net.phase[i]= map (DataToDueCircularVirtualPosition[i], 0, numberOfStep, 0, TWO_PI);


    }
   }
  }
 
 
 
   if (keyCode == BACKSPACE ) {
    
      for (int i = 0; i < networkSize-0; i+=1) { 
        println (" ALIGN MTF " );
        
  ////*****  phaseMappedFollow[i] = phaseMapped[i];
  //  phaseMappedFollow[i]=0;
  //  net.phase[i]=0;
    phaseMapped[i] = phases[i-0][frameCountBis % nbMaxDelais]+0; // to aligin ball with the followed one
   
    if (phaseMapped[i]<0){
   
    DataToDueCircularVirtualPosition[i]= int (map (phaseMapped[i], 0, -TWO_PI, numberOfStep, 0)); 
      net.oldPhase[i]=phaseMapped[i];
     net.phase[i]= phaseMapped[i];
       }
        
   else
    
    DataToDueCircularVirtualPosition[i]= (int) map (phaseMapped[i], 0, TWO_PI, 0, numberOfStep);
   net.oldPhase[i]=phaseMapped[i];
    net.phase[i]= phaseMapped[i];
  }
 }
 
 
  //sendToTeensyTurnOnDriver();
  mapDataToMotor();
}
