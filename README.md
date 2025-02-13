# Oil Heater Simulation

An oil heater cycle is modeled by MATLAB/Simulink as graduation project in the Boğaziçi University's **ME 492** class.

The oil cycle is a part of the Organic Rankine Cycle located at the [BURET Lab](http://buret.boun.edu.tr/facilities/organic-rankine-cycle/) of Boğaziçi University. The oil is used to heat up the working fluid R134A. The oil undergoes four different components, including a pump, heater, evaporator, and tank. The system, including the four components, is modeled in MATLAB/Simulink by using governing differential equations and experimental data.

* **src** folder contains MATLAB script and Simulink model (Examples: [heater](figures/heater-model.png), [evaporator](figures/evaporator-model.png)).

* **report** folder contains LaTeX code, which creates the [report](report/output/report.pdf) as a pdf file.

---

The diagram that represents the oil cycle and the default control strategy applied at the heater to keep the oil at the desired temperature is given below:
<p align="center">
  <img src="https://github.com/edizferit/Oil_Heater_Simulation/blob/main/figures/def.png?raw=true" width="100%">
</p>

Curve fitting techniques are applied to the experimental data to obtain several variables. Below figue is an example showing the fitted functions which are used to find the heat transfer at the evaporator with respect to the temperature.
<p align="center">
  <img src="https://github.com/edizferit/Oil_Heater_Simulation/blob/main/figures/evaporator_curve_fit.png?raw=true" width="100%">
</p>

The experimental data is split to two parts as training and validation, which can be seen below:
<p align="center">
  <img src="https://github.com/edizferit/Oil_Heater_Simulation/blob/main/figures/experimental-data.png?raw=true" width="50%">
</p>


