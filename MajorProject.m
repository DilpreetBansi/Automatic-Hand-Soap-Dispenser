clear all;

arduinoObj = arduino("COM3",'uno', 'Libraries', 'Ultrasonic');
ultrasonicObj = ultrasonic(arduinoObj,'D10','D7');

amount = 0;
button = 0;

while button~=1
    clear distance
    distance = readDistance(ultrasonicObj);
 
 if (distance< amount+0.15)
        writeDigitalPin(arduinoObj,'D2',1);
        writeDigitalPin(arduinoObj, 'D13',1);
        writePWMDutyCycle(arduinoObj,'D5',0.33);
        disp('Dispensing !!')
        writeDigitalPin(arduinoObj, 'D13',0); writePWMDutyCycle(arduinoObj,'D5',0);
        writeDigitalPin(arduinoObj, 'D12',0);

 elseif (distance> amount+0.15 )
     writeDigitalPin(arduinoObj,'D2',0)
     writeDigitalPin(arduinoObj, 'D12',1)
     writePWMDutyCycle(arduinoObj,'D5',0)

 else
     writeDigitalPin(arduinoObj,'D2',0)
     writeDigitalPin(arduinoObj, 'D12',0)
     writePWMDutyCycle(arduinoObj,'D5',0)
 end
  button = readDigitalPin(arduinoObj,'D6');
end






