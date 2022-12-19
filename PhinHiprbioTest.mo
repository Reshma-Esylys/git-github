model PhinHiprbioTest
  //*____*parameters*_____*
  //*----Acidogenesis------*
  parameter Real Csinf(unit = "1000*mol/m3") = 15 "Influent Glucose Equivalent Concentration of Substrate";
  parameter Real Muamax(unit = "1.157407*10− 5/s") = 0.4 "Maximum Specific Grawth Rate";
  parameter Real Kda(unit = "1.157407*10− 5/s") = 0.025 "Death Rate of Acidogenic Biomass";
  parameter Real D(unit = "1.157407*10− 5/s") = 0.01 "Dilution Rate";
  parameter Real Y[2] = {0.2, 0.245};
  //"Yield Coeifficient For Acid Formers","Soluble Organic Yield Coeifficient";
  parameter Real YCO2 = 12;
  //CO2 yield coeifficient for acid formers
  parameter Real MX(unit = "g/mol") = 113 "Assumed mole weight of organisms";
  //Constants
  constant Real K[2] = {0.025, 1};
  //"Saturation Constant","Inhibition Constant";
  constant Real Ke = 1.728 * 10 ^ (-5) "Dissociation Constant for Acetic Acid at 35 degree C";
  //*-----Acetogenesis----*//
  parameter Real Ya[2] = {2.65, 0.08};
  //parameter Real Ya[2] = {1.8, 0.09};
  //Yield coeifficient of acetic acid,Yield coeifficient for methane formers
  parameter Real CAinf(unit = "1000*g/m3") = 0.5 "Influent Acetic acid concentration";
  parameter Real Ma(unit = "g/mol") = 0.675 "Mole fraction of acetic acid";
  parameter Real CZin(unit = "1000*mol/m3") = 0.006 "Influent Concentration of cation";
  parameter Real Ycat(unit = "g/g") = 0.5 "yield coeifficient of cations";
  //*--------Metanogenesis---------*//
  parameter Real Kdm(unit = "1.157407*10− 5/s") = 0.04 "Death rate of methanogenic Biomass";
  parameter Real Mummax(unit = "1.157407*10− 5/s") = 0.60 "Maximum Specific grawth rate of Methanogenic biomass";
  parameter Real Kx[3] = {0.015, 0.3, 0.12};
  //(unit = "1000*g/m3")//"Saturation Constant for methanogenic bacteria","Inhibition Constant of the methanogenic bacteria grawth,Inhibition constant of ammonia";
  parameter Real CNH3(unit = "1000*mol/m3") = 5 "Concentration of unionized Ammonia";
  parameter Real MNH3(unit = "g/mol") = 17.031 "mole weight of Ammonia";
  parameter Real Vmmax(unit = "1.157407*10− 5*g/gs") = 20 "Maximal production rate of methanogenic bacteria";
  parameter Real Km[2] = {0.12, 0.1};
  //(unit="1000*g/m3" )}"Saturation constant of methane production","The inhibition constant of acetic acid on methane production";
  parameter Real CNH4in(unit = "1000*mol/m3") = 0.1 "Influent Concentration of Ammonium";
  parameter Real YNH4(unit = "g/g") = 0.1212 "Yield coeifficient for ammonium from the raw waste";
  parameter Real Kla(unit = "0.00001157407/s") = 0.6 "The gas transfer coeifficient";
  parameter Real CNH3in(unit = "1000*mol/m3") = 0.1 "Influent Ammonia Concentrationa";
  parameter Real YCH4(unit = "g/g") = 6.31 "Yield coeifficient for methane forming bacteria";
  parameter Real CNH4z(unit = "1000*g/m3") = 0.5 "Ammonium ion concentration";
  //parameter Real CZz(unit = "1000*g/m3") = 0.01 "cation concentration";
  parameter Real CCO2in(unit = "1000*g/m3") = 0.011 "Influent concentration of co2";
  parameter Real CHCO3in(unit = "1000*mol/m3") = 0.5 "Influent bicarbonate ion Concentration";
  parameter Real CHCO3(unit = "1000*mol/m3") = 0.5 "Influent bicarbonate Concentration";
  parameter Real Tp(unit = "133.32*pa") = 44 "Total pressure of CO2,CH4 and NH3 in the gas storage unit";
  parameter Real Sv(unit = "0.001m3") = 25.4 "Standard volume at 35 degree C";
  parameter Real Vrec(unit = "0.001*m3") = 20 "Reactor volume";
  parameter Real Vgsv(unit = "0.001*m3") = 20 "Volume of gas storage unit";
  parameter Real KCO2 = 4.72 * 10 ^ (-7) "CO2 ionization constant at 35 deg C";
  parameter Real Yco2m(unit = "g/g") = 12.31 "yield coeifficient of influent co2";
  parameter Real KHCO2(unit = "133.32mol/(pa *0.001m3)") = 3.47 * 10 ^ (-5) "Hentry's law gas constant for CO2";
  parameter Real KHNH3(unit = "133.32mol/(pa *0.001m3)") = 5.33 * 10 ^ (-6) "Hentry's law gas constant for ammonium at 35 deg C";
  parameter Real MCH4(unit = "g/mol") = 16.04 " Molar weight of CH4";
  parameter Real Mo(unit = "g/mol") = 32 " Molar weight of oxygen";
  //parameter Real MNH3(unit = "g/mol") = 17.031 " Molar weight of NH3";
  parameter Real MNH4(unit = "g/mol") = 18.04 " Molar weight of NH4";
  //Variables
  //*----Acidogenesis-----*//
  Real CCO2(unit = "1000*g/m3") "CO2 Concentration";
  Real CXa(unit = "1000*g/m3") "Acidogenic Biomass";
  Real Cs(unit = "1000*g/m3") "Glucose Equivalent Concentration of The Substrate";
  Real Mua(unit = "1.157407*10− 5/s") "The Specific Grawth Rate of Acidogenic Biomass";
  Real CAh(unit = "1000*g/m3") "Unionized Acetic Acid Concentration of the Substrate";
  Real RAF(unit = "1.157407*10^-8*m^3/s") "Rate of CO2 formation by acid generation";
  //*-----Acetogenesis-----*//
  Real CA(unit = "1000*g/m3") "Total Acetic Acid Concentration";
  Real CZ(unit = "1000*g/m3") "Effluent concentration of cations (other than NH4+ and H+";
  Real RZ(unit = "1.157407*10^-8*m^3/s") "Rate of CO2 consumption in the HCO3- forming reaction due to cation other than NH$+ and H+";
  Real RAC(unit = "1.157407*10^-8*m^3/s") "The rate of CO2 production from HCO3- by acid formation";
  //*-----Methanogenesis-------*
  Real CXm(unit = "1000*g/m3") "Methanogenic biomass";
  Real CCH4(unit = "1000*g/m3") "Methane Production Concentration";
  Real CNH4(unit = "1000*mol/m3") "Effluent Concentration of Ammonia";
  Real PNH3(unit = "133.322*pa") "Partial Pressure of Ammonium";
  Real PCO2(unit = "133.322*pa") "Partial pressure of CO2 in the gaseous phase";
  Real Mum(unit = "1.157407*10− 5/s") "Specific grawth rate of methanogenic biomass";
  Real Q(unit = "1.157407*10^-8*m^3/s") "Total gas flow";
  Real QCH4(unit = "1.157407*10^-8*m^3/s") "Gas flow of Ammonia";
  Real QNH3(unit = "1.157407*10^-8*m^3/s") "Gas flow of Methane";
  Real QCO2(unit = "1.157407*10^-8*m^3/s") "Gas flow of CO2";
  Real RM(unit = "0.01157407*mol/m3 s") "Rate of CO2 formation by methane production";
  Real RNH4(unit = "0.01157407*mol/m3s") "Rate of CO2 consumption in the ${HCO}_3^-$ forming reaction due to {NH}4+ release of the primary substrate";
  Real RNH3(unit = "0.01157407*mol/m3s") "Rate of ammonia formation";
  Real RT(unit = "0.01157407*mol/m3 s") "Rate of ${CO}_2$ transfer to the gas phase";
  Real CHCO3z(unit = "1000*mol/m3") "bicarbonate ion Concentration";
  Real CH(unit = "1000*mol/m3") "H+Ion Concentration";
  Real pH "Potential of hydrogen";
initial equation
  Cs = 20;
  CXa = 1;
  CA = 1;
  CXm = 1;
  CCH4 = 1;
  CCO2 = 0.011;
  CZ = 1;
  CNH4 = 0.5;
  PNH3 = 20;
  PCO2 = 20;
equation
  der(CCO2) = D * (CCO2in - CCO2 + CHCO3in - CHCO3) + RM + RAC + RAF - RZ - RNH4 + RT;
  //Acidogenesis
  der(Cs) = (D * Y[1] * Y[2] * (Csinf - Cs) - Mua * CXa * Y[2] + Mua * CXa * Y[1]) / (Y[1] * Y[2]);
  der(CXa) = Mua * CXa - Kda * CXa;
  Mua = Muamax * Cs * K[2] / (Cs * K[2] + K[1] * K[2] + Cs * CAh);
  CAh = CA * CH / Ke;
  RAF = Mua * CXa * YCO2 / MX;
  //Acetogenesis
  der(CA) = D * (CAinf - CA) * Ya[1] * Ya[2] + Mua * CXa * Ya[2] - Mum * CXm * Ya[1] / (Ya[1] * Ya[2]);
  RAC = der(CA) * (1 / Ma);
  RZ = der(CZ);
  der(CZ) = D * (CZin - CZ) + Mua * CXa * Ycat;
  //Methanogenesis
  der(CXm) = Mum * CXm - Kdm * CXm;
  Mum = Mummax * CAh * Kx[2] * Kx[3] / (CAh * Kx[2] * Kx[3] + Kx[1] * Kx[2] * Kx[3] + CAh * CAh * Kx[3] + CNH3 * MNH3 * CAh * Kx[2]);
  RM = Mum * CXm * Yco2m / MX;
  RNH4 = der(CNH4) * (1 / MNH4);
  der(CNH4) = D * (CNH4in - CNH4) + Mua * CXa * YNH4 + RNH3 * MNH4;
  der(CCH4) = Vmmax * CXm * CAh * Km[2] / ((CAh + Km[1]) * (CAh + Km[2]));
  RNH3 = Kla * (KHNH3 * PNH3 - CNH3);
  der(PNH3) = ((-Tp * Sv * Vrec * RNH3) - PNH3 * Q) / Vgsv;
  Q = QNH3 + QCH4 + QCO2;
  QNH3 = -Sv * Vrec * RNH3;
  QCH4 = Sv * Vrec * Mum * CXm * YCH4 / MCH4;
  QCO2 = -Sv * Vrec * RT;
  RT = Kla * (KHCO2 * PCO2 - CCO2);
  der(PCO2) = ((-Tp * Sv * Vrec * RT) - PCO2 * Q) / Vgsv;
  CHCO3z = (CZ * MNH4 * Mo + CNH4z * Mo - CAh * MNH4) / (MNH4 * Mo);
  CH = KCO2 * CCO2 / CHCO3z;
  pH = -log(CH);
  annotation(Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 114, 195}, fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, 110}, {150, 150}}, textString = "%name")}), Diagram(coordinateSystem(extent = {{-150, -90}, {150, 90}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, lineColor = {0, 114, 195}, fillColor = {255, 255, 255}, extent = {{-100, -100}, {100, 100}}, radius = 25), Text(visible = true, textColor = {64, 64, 64}, extent = {{-150, 110}, {150, 150}}, textString = "%name")}));
end PhinHiprbioTest;
