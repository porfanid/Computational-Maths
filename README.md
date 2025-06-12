# Computational Mathematics - Numerical Methods for Differential Equations

**Course**: Computational Mathematics (Υπολογιστικά Μαθηματικά)  
**Academic Year**: 2021-2022  
**Team Members**: 
- Pavlos Orfanidis (4134)
- Giorgos Hatziligos (4835) 
- Spyros Kontakis (4702)

## Overview

This project implements and compares numerical methods for solving differential equations, focusing on vehicle dynamics simulation. The work includes implementation of Euler's method and Improved Euler's method for solving systems of ordinary differential equations (ODEs) that model translational and rotational motion.

## Project Structure

```
├── documentation/
│   └── solution.tex          # LaTeX documentation (in Greek)
├── src/
│   ├── problem_1_a_euler.m           # Basic Euler method implementation
│   ├── problem_1_a_improvedEuler.m   # Improved Euler method implementation  
│   ├── problem_1_3.m                 # Control system implementation
│   ├── problem_2_b.m                 # Pole analysis
│   └── problem_2_d.m                 # Analytical solution comparison
├── README.md
├── LICENSE
└── METHODS.md            # Detailed explanation of numerical methods
```

## Mathematical Model

The project simulates a vehicle dynamics system with the following differential equations:

### Translational Motion
```
ms'' = (f₁ + f₂) - bₛ|s'|s'
```

### Rotational Motion  
```
Iᵧω' = (d/2)(f₂ - f₁) - bᵤ|ω|ω
```

### Control System (Problem 1c)
```
f₁ + f₂ = Kₚₛ(sdes - s) - Kds(s')
```

Where:
- `m = 9 kg` (mass)
- `d = 1 m` (distance between wheels)
- `Iᵧ = 0.38 kg·m²` (moment of inertia)
- `s(0) = s₀`, `s'(0) = 0`, `ω(0) = 0` (initial conditions)

## Numerical Methods Implemented

### 1. Euler's Method
- **File**: `problem_1_a_euler.m`
- **Formula**: `y_{n+1} = y_n + h·f(t_n, y_n)`
- **Step size**: `h = 0.001`
- **Time range**: `t ∈ [0, 30]` seconds

### 2. Improved Euler's Method (Heun's Method)
- **File**: `problem_1_a_improvedEuler.m`
- **Formula**: `y_{n+1} = y_n + (h/2)[f(t_n, y_n) + f(t_{n+1}, y_n + h·f(t_n, y_n))]`
- **Higher accuracy**: Second-order method vs first-order Euler

### 3. Control System Analysis
- **File**: `problem_1_3.m`
- **Implements**: PD controller with feedback
- **Parameters**: 
  - `Kₚₛ = 5` (proportional gain)
  - `Kds = 15 + AM/1000` (derivative gain)
  - `sdes = AM/200` (desired position)

## Problems Solved

### Problem 1: Numerical Integration
- **1a**: Basic Euler method for vehicle dynamics
- **1b**: Improved Euler method implementation
- **1c**: Closed-loop control system simulation

### Problem 2: Analytical vs Numerical
- **2a**: Transfer function analysis
- **2b**: Pole location analysis (`problem_2_b.m`)
- **2c**: Stability analysis
- **2d**: Analytical solution comparison (`problem_2_d.m`)

## How to Run

### Prerequisites
- MATLAB R2018b or newer, OR
- GNU Octave 5.0 or newer

### Execution Instructions

1. **Start MATLAB/Octave** and navigate to the project directory

2. **Run individual problems**:
   ```matlab
   % Problem 1a - Basic Euler method
   problem_1_a_euler()
   
   % Problem 1a - Improved Euler method  
   problem_1_a_improvedEuler()
   
   % Problem 1c - Control system
   problem_1_3()
   
   % Problem 2b - Pole analysis
   problem_2_b()
   
   % Problem 2d - Analytical solution
   problem_2_d()
   ```

3. **View results**: Each function generates multiple figures showing:
   - Position `s(t)` vs time
   - Velocity `s'(t)` vs time  
   - Acceleration `s''(t)` vs time
   - Angular velocity `ω(t)` vs time
   - Pole locations (for stability analysis)

## Key Parameters

### Student ID Based Values
The project uses student ID (AM = 4835) to generate specific parameter values:

```matlab
AM = 4835
f₁ = AM/7000 = 0.691 N
f₂ = AM/7000 = 0.691 N  (Problem 1a scenario 1)
f₂ = AM/8000 = 0.604 N  (Problem 1a scenario 2)
s₀ = AM/1000 = 4.835 m
bₛ = 3 + AM/5000 = 3.967 N·s²/m²
bᵤ = 5 - AM/5000 = 4.033 N·s²/rad²
```

### Control Parameters
```matlab
Kₚₛ = 5                    % Proportional gain
Kds = 15 + AM/1000 = 19.835   % Derivative gain  
sdes = AM/200 = 24.175 m       % Desired position
```

## Results and Analysis

### Comparison of Methods
The project demonstrates that:
- **Improved Euler method** provides better accuracy than basic Euler
- **Step size** `h = 0.001` provides good balance between accuracy and computation time
- **Control system** successfully drives the system to desired position

### Stability Analysis
- Pole locations determine system stability
- Control gains affect response characteristics
- Analytical solutions validate numerical results

## Output Examples

The code generates several types of plots:

1. **Time-domain responses**: Position, velocity, acceleration vs time
2. **Phase portraits**: State variables relationships  
3. **Pole-zero plots**: System stability visualization
4. **Comparison plots**: Euler vs Improved Euler vs Analytical

## File Descriptions

| File | Purpose | Key Features |
|------|---------|--------------|
| `problem_1_a_euler.m` | Basic Euler implementation | Two force scenarios, translation & rotation |
| `problem_1_a_improvedEuler.m` | Higher-order numerical method | Better accuracy, same dynamics |
| `problem_1_3.m` | Control system simulation | PD controller, setpoint tracking |
| `problem_2_b.m` | Pole analysis | Root locus, stability margins |
| `problem_2_d.m` | Analytical validation | Exact vs numerical solutions |

## Documentation

- **Full report**: `documentation/solution.tex` (LaTeX source in Greek)
- **Mathematical derivations**: Complete analytical development
- **Figures**: Generated plots included in documentation

## Academic Context

This project demonstrates understanding of:
- Numerical methods for ODEs
- Vehicle dynamics modeling
- Control systems design
- Stability analysis
- MATLAB/Octave programming
- Comparison of analytical vs numerical solutions

## Known Limitations

- **Fixed step size**: Could implement adaptive step size
- **Linear approximations**: Some nonlinear effects simplified
- **Parameter sensitivity**: Limited robustness analysis
- **Computational efficiency**: Could be optimized for larger systems

## Future Extensions

Potential improvements for learning purposes:
- Implement Runge-Kutta 4th order method
- Add adaptive step size control
- Include more complex control strategies (PID, LQR)
- 3D visualization of vehicle motion
- Parameter optimization algorithms

## License

This project is for educational purposes. See LICENSE file for details.

---

**Note**: This is an archived academic project from 2021-2022. Code is preserved for educational and portfolio purposes. All mathematical analysis and implementations were completed as part of coursework requirements.