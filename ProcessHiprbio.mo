model ProcessHiprbio
  //*____*parameters*_____*
  //*----Acidogenesis------*
  parameter Real Csinf(unit = "1000*mol/m3") = 15 "Influent Glucose Equivalent Concentration of Substrate";
  parameter Real Muamax(unit = "1.157407*10− 5/s") = 0.4 "Maximum Specific Grawth Rate";
  parameter Real Kda(unit = "1.157407*10− 5/s") = 0.025 "Death Rate of Acidogenic Biomass";
  parameter Real D(unit = "1.157407*10− 5/s") = 0.01 "Dilution Rate";
  parameter Real Y[2] = {0.2, 0.245};
  //"Yield Coeifficient For Acid Formers","Soluble Organic Yield Coeifficient";
  parameter Real H = 10 ^ (-7) "ial of Hydrogen";
  //Constants
  constant Real K[2] = {0.025, 1};
  //"Saturation Constant","Inhibition Constant";
  constant Real Ke = 1.728 * 10 ^ (-5) "Dissociation Constant for Acetic Acid at 35 degree C";
  //*-----Acetogenesis----*
  //parameter Real Ya[2] = {2.45*10^(-3), 0.06*10^(-3)};
  parameter Real Ya[2] = {2.65, 0.08};
  //parameter Real Ya[2] = {1.8, 0.09};
  //Yield coeifficient of acetic acid,Yield coeifficient for methane formers
  parameter Real CAinf(unit = "1000*g/m3") = 0.5 "Influent Acetic acid concentration";
  //*--------Metanogenesis---------*
  parameter Real Kdm(unit = "1.157407*10− 5/s") = 0.04 "Death rate of methanogenic Biomass";
  parameter Real Mummax(unit = "1.157407*10− 5/s") = 0.60 "Maximum Specific grawth rate of Methanogenic biomass";
  parameter Real Kx[3] = {0.015, 0.3, 0.12};
  //(unit = "1000*g/m3")//"Saturation Constant for methanogenic bacteria","Inhibition Constant of the methanogenic bacteria grawth,Inhibition constant of ammonia";
  parameter Real CNH3(unit = "1000*mol/m3") = 10 "Concentration of unionized Ammonia";
  parameter Real MNH3(unit = "g/mol") = 17.031 "mole weight of Ammonia";
  parameter Real Vmmax(unit = "1.157407*10− 5*g/gs") = 20 "Saturation constant of methane Production";
  parameter Real Km[2] = {0.12, 0.1};
  //(unit="1000*g/m3" )}"Saturation constant of methane production","The inhibition constant of acetic acid on methane production";
  //Variables
  //*----Acidogenesis-----*
  Real Cxa(unit = "1000*g/m3") "Acidogenic Biomass";
  Real Cs(unit = "1000*g/m3") "Glucose Equivalent Concentration of The Substrate";
  Real Mua(unit = "1.157407*10− 5/s") "The Specific Grawth Rate of Acidogenic Biomass";
  Real CAh(unit = "1000*g/m3") "Unionized Acetic Acid Concentration of the Substrate";
  //*-----Acetogenesis-----*
  Real CA(unit = "1000*g/m3") "Total Acetic Acid Concentration";
  //*-----Methanogenesis-------*
  Real Cxm(unit = "1000*g/m3") "Methanogenic biomass";
  Real Mum(unit = "1.157407*10− 5/s") "Specific grawth rate of methanogenic biomass";
  Real CCH4(unit = "1000*g/m3") "Methane Production Concentration";
initial equation
  //*----Acidogenesis-----*
  Cxa = 1;
  Cs = 10;
  //*----Acetogenesis-----*
  CA = 1;
  //*-----Methanogenesis-------*
  Cxm = 1;
  CCH4 = 1.5;
equation
  //*----Acidogenesis-----*
  der(Cxa) = Mua * Cxa - Kda * Cxa;
  der(Cs) = (D * Y[1] * Y[2] * (Csinf - Cs) - Mua * Cxa * Y[2] + Mua * Cxa * Y[1]) / (Y[1] * Y[2]);
  Mua = Muamax * Cs * K[2] / (Cs * K[2] + K[1] * K[2] + Cs * CAh);
  CAh = CA * H / Ke;
  //*-----Acetogenesis-----*
  der(CA) = D * (CAinf - CA) * Ya[1] * Ya[2] + Mua * Cxa * Ya[2] - Mum * Cxm * Ya[1] / (Ya[1] * Ya[2]);
  //*-----Methanogenesis-------*
  der(Cxm) = Mum * Cxm - Kdm * Cxm;
  der(CCH4) = Vmmax * Cxm * CAh * Km[2] / ((CAh + Km[1]) * (CAh + Km[2]));
  Mum = Mummax * CAh * Kx[2] * Kx[3] / (CAh * Kx[2] * Kx[3] + Kx[1] * Kx[2] * Kx[3] + CAh ^ 2 * Kx[3] + CNH3 * MNH3 * CAh * Kx[2]);
  annotation(Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 114, 195}, fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, 110}, {150, 150}}, textString = "%name")}));
end ProcessHiprbio;
