# Numerical Methods Documentation

## Overview

This document provides detailed explanations of the numerical methods implemented in this computational mathematics project. The methods are used to solve systems of ordinary differential equations (ODEs) that model vehicle dynamics.

## Mathematical Background

### Differential Equation System

The project solves the following system of coupled ODEs:

**Translational Motion:**
```
ms'' = (f₁ + f₂) - bₛ|s'|s'
```

**Rotational Motion:**
```
Iᵧω' = (d/2)(f₂ - f₁) - bᵤ|ω|ω
```

This can be written as a first-order system:
```
s' = v
v' = [(f₁ + f₂) - bₛ|v|v] / m
ω' = [(d/2)(f₂ - f₁) - bᵤ|ω|ω] / Iᵧ
```

## Implemented Numerical Methods

### 1. Euler's Method (Forward Euler)

**Principle**: First-order explicit method using forward difference approximation.

**Mathematical Formula:**
```
y_{n+1} = y_n + h · f(t_n, y_n)
```

**Implementation Details:**

For our system:
```matlab
% Translational motion
s2(k) = ((f1+f2) - bs*abs(s1(k))*s1(k)) / m;  % s''
s1(k+1) = s1(k) + h*s2(k);                     % s'  
s(k+1) = s(k) + h*s1(k);                       % s

% Rotational motion  
w1(k) = (d/2*(f2-f1) - bu*abs(w(k))*w(k)) / Iz; % ω'
w(k+1) = w(k) + h*w1(k);                         % ω
```

**Characteristics:**
- **Order**: First-order (local truncation error ∼ O(h²))
- **Stability**: Conditionally stable (requires small h)
- **Computational cost**: Low (one function evaluation per step)
- **Global error**: O(h)

**Advantages:**
- Simple to implement
- Low computational cost
- Memory efficient

**Disadvantages:**
- Lower accuracy
- May accumulate significant errors over long integration periods
- Can be unstable for stiff equations

### 2. Improved Euler's Method (Heun's Method)

**Principle**: Second-order explicit method using predictor-corrector approach.

**Mathematical Formula:**
```
k₁ = f(t_n, y_n)
k₂ = f(t_n + h, y_n + h·k₁)
y_{n+1} = y_n + (h/2)(k₁ + k₂)
```

**Implementation Details:**

For velocity (s'):
```matlab
% Calculate current acceleration
s2(k) = (Kps*(Sdes-s(k)) - Kds*s1(k) - bs*abs(s1(k))*s1(k)) / m;

% Predictor step
s1_pred = s1(k) + h*s2(k);
s_pred = s(k) + h*s1(k);

% Calculate acceleration at predicted point
s2_pred = (Kps*(Sdes-s_pred) - Kds*s1_pred - bs*abs(s1_pred)*s1_pred) / m;

% Corrector step (final update)
s1(k+1) = s1(k) + h/2*(s2(k) + s2_pred);
```

For position (s):
```matlab
s(k+1) = s(k) + h/2*(s1(k) + s1(k+1));
```

**Characteristics:**
- **Order**: Second-order (local truncation error ∼ O(h³))
- **Stability**: Better stability properties than Euler
- **Computational cost**: Two function evaluations per step
- **Global error**: O(h²)

**Advantages:**
- Higher accuracy than basic Euler
- Better stability properties
- Good balance between accuracy and computational cost

**Disadvantages:**
- More complex implementation
- Higher computational cost than Euler
- Still explicit method (stability limitations remain)

## Step Size Selection

**Current Implementation**: Fixed step size `h = 0.001`

**Rationale:**
- Small enough to capture system dynamics accurately
- Large enough to complete 30-second simulation efficiently
- Ensures stability for both methods

**Step Size Considerations:**
```
Time span: [0, 30] seconds
Step size: h = 0.001
Number of steps: 30,000
```

**Stability Analysis:**
For the linearized system, stability requires:
```
|1 + h·λ| < 1  (Euler)
|1 + h·λ + (h·λ)²/2| < 1  (Improved Euler)
```
where λ are the eigenvalues of the system matrix.

## Error Analysis

### Local Truncation Error

**Euler Method:**
```
LTE = O(h²) = (h²/2)y''(ξ)
```

**Improved Euler Method:**
```
LTE = O(h³) = (h³/12)y'''(ξ)
```

### Global Error

**Euler Method:**
```
GTE = O(h)
```

**Improved Euler Method:**
```
GTE = O(h²)
```

### Practical Error Estimation

The error can be estimated by comparing solutions with different step sizes:
```
Error ≈ |y(h) - y(h/2)|
```

## Control System Implementation

### PD Controller

The control force is implemented as:
```
f₁ + f₂ = Kₚₛ(sdes - s) - Kds(s')
```

**Implementation in Improved Euler:**
```matlab
% Current error and derivative
error = Sdes - s(k);
error_dot = -s1(k);

% Control force
f_control = Kps*error - Kds*error_dot;

% System dynamics with control
s2(k) = (f_control - bs*abs(s1(k))*s1(k)) / m;
```

### Controller Parameters

Based on student ID (AM = 4835):
```
Kₚₛ = 5                    % Proportional gain
Kds = 15 + AM/1000 = 19.835   % Derivative gain
sdes = AM/200 = 24.175 m       % Reference position
```

## Stability and Performance Analysis

### System Poles

The characteristic equation of the linearized closed-loop system:
```
ms² + (Kds + bs)s + Kps = 0
```

**Pole locations:**
```
s₁,₂ = [-(Kds + bs) ± √((Kds + bs)² - 4mKps)] / (2m)
```

### Stability Conditions

For stability, both poles must have negative real parts:
1. `Kds + bs > 0` (always satisfied for positive damping)
2. `Kps > 0` (always satisfied for positive stiffness)

### Performance Metrics

**Rise Time:** Time to reach 90% of final value  
**Settling Time:** Time to stay within 2% of final value  
**Overshoot:** Maximum deviation above final value  
**Steady-State Error:** Final tracking error

## Computational Implementation Notes

### MATLAB/Octave Specific Features

**Array Preallocation:**
```matlab
s = zeros(1, 30000);   % Preallocate for efficiency
s1 = zeros(1, 30000);
s2 = zeros(1, 30000);
```

**Vectorized Operations:**
```matlab
t = 0:0.001:30;        % Time vector
plot(t, s);            % Plot entire solution
```

**Absolute Value Handling:**
```matlab
bs*abs(s1(k))*s1(k)    % Ensures proper sign for damping
```

### Optimization Considerations

1. **Memory Usage**: Fixed-size arrays avoid dynamic allocation
2. **Loop Efficiency**: Simple for-loops with minimal function calls
3. **Numerical Precision**: Double precision sufficient for this problem
4. **Plotting**: Generate plots after computation, not during

## Comparison with Analytical Solutions

### Problem 2d: Analytical Validation

For the linear case (small velocities), analytical solution exists:
```
s(t) = sdes + c₁e^(r₁t) + c₂e^(r₂t)
```

Where:
```
r₁,₂ = [-(Kds + bs) ± √Δ] / (2m)
Δ = (Kds + bs)² - 4mKps
```

**Implementation:**
```matlab
% Calculate characteristic roots
delta = ((Kds+bs)/m)^2 - 4*(Kps/m);
r1 = (-(Kds+bs)/m + sqrt(delta))/2;
r2 = (-(Kds+bs)/m - sqrt(delta))/2;

% Apply initial conditions to find constants
c1 = Sdes*r1/(r2-r1);
c2 = -Sdes*(r1/(r2-r1) + 1);

% Analytical solution
s_analytical = Sdes + c1*exp(t*r1) + c2*exp(t*r2);
```

This provides validation for the numerical methods and demonstrates convergence properties.

## Recommendations for Further Study

### Advanced Methods
1. **Runge-Kutta 4th Order**: Higher accuracy with moderate computational cost
2. **Adaptive Step Size**: Automatic error control
3. **Implicit Methods**: Better stability for stiff systems

### Analysis Tools
1. **Richardson Extrapolation**: Higher-order error estimation
2. **Convergence Studies**: Systematic step size reduction
3. **Stability Analysis**: Eigenvalue analysis of linearized system

### Extensions
1. **Nonlinear Control**: Advanced control strategies
2. **Parameter Estimation**: System identification
3. **Optimization**: Optimal control problems