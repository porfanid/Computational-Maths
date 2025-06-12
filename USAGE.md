# Usage Guide

## Quick Start

### Prerequisites
- MATLAB R2018b or newer, OR
- GNU Octave 5.0 or newer

### Running the Code

1. **Clone or download** the repository
2. **Open MATLAB/Octave** and navigate to the project directory
3. **Run the main functions** from the command prompt:

```matlab
% Problem 1a: Basic Euler method
problem_1_a_euler()

% Problem 1a: Improved Euler method  
problem_1_a_improvedEuler()

% Problem 1c: Control system with both methods
problem_1_3()

% Problem 2b: Pole analysis
problem_2_b()

% Problem 2d: Analytical solution comparison
problem_2_d()
```

## Detailed Function Guide

### problem_1_a_euler()

**Purpose**: Implements basic Euler method for vehicle dynamics

**What it does**:
- Solves translational motion: `ms'' = (f₁ + f₂) - bₛ|s'|s'`
- Solves rotational motion: `Iᵧω' = (d/2)(f₂ - f₁) - bᵤ|ω|ω`
- Tests two different force scenarios

**Generated Plots**:
- Figure 1: s''(t) and s'(t) for scenario 1
- Figure 2: s(t) for scenario 1  
- Figure 3: ω'(t) and ω(t) for scenario 1
- Figure 4: s''(t) and s'(t) for scenario 2
- Figure 5: s(t) for scenario 2
- Figure 6: ω'(t) and ω(t) for scenario 2

**Key Parameters**:
```matlab
f1 = AM/7000 = 0.691 N     % Force 1
f2 = AM/7000 = 0.691 N     % Force 2 (scenario 1)
f2 = AM/8000 = 0.604 N     % Force 2 (scenario 2)
h = 0.001                  % Step size
t_final = 30 seconds       % Simulation time
```

### problem_1_a_improvedEuler()

**Purpose**: Implements Improved Euler (Heun's) method for same dynamics

**What it does**:
- Same physics as basic Euler but with higher accuracy
- Uses predictor-corrector approach
- Two force scenarios like basic Euler

**Generated Plots**:
- Figure 1: s'(t) and s(t) comparison for scenario 1
- Figure 2: ω'(t) and ω(t) for scenario 1  
- Figure 3: s'(t) and s(t) comparison for scenario 2
- Figure 4: ω'(t) and ω(t) for scenario 2

**Accuracy**: Higher accuracy than basic Euler (O(h²) vs O(h))

### problem_1_3()

**Purpose**: Implements closed-loop control system using both Euler methods

**What it does**:
- PD controller: `f₁ + f₂ = Kₚₛ(sdes - s) - Kds(s')`
- Compares basic vs improved Euler for controlled system
- Tracks desired position `sdes = AM/200`

**Control Parameters**:
```matlab
Kps = 5                    % Proportional gain
Kds = 15 + AM/1000        % Derivative gain  
sdes = AM/200             % Desired position
s(1) = 0                  % Initial position
```

**Generated Plots**:
- Figure 1: Basic Euler - s''(t) 
- Figure 2: Basic Euler - s'(t)
- Figure 3: Improved Euler - s''(t) and s'(t)
- Figure 4: Improved Euler - s(t)

### problem_2_b()

**Purpose**: Analyzes system poles for stability assessment

**What it does**:
- Computes characteristic equation roots
- Varies controller gains to see pole movement
- Generates root locus type plots

**Mathematical Background**:
```
Characteristic equation: (m/Kps)s² + (Kds+bs)/Kps·s + 1 = 0
Poles: s₁,₂ = [-(Kds+bs) ± √Δ] / (2m)
```

**Generated Plots**:
- Multiple subplots showing pole locations
- Real vs imaginary parts
- Effect of parameter variations

### problem_2_d()

**Purpose**: Compares numerical solution with analytical solution

**What it does**:
- Derives exact analytical solution for linear case
- Computes solution using characteristic equation approach
- Validates numerical methods

**Analytical Solution**:
```matlab
s(t) = sdes + c₁e^(r₁t) + c₂e^(r₂t)
s'(t) = c₁r₁e^(r₁t) + c₂r₂e^(r₂t)
```

**Generated Plots**:
- Figure 1: s'(t) analytical solution
- Figure 2: s(t) analytical solution

## Understanding the Output

### Interpreting Plots

**Position Plots s(t)**:
- Should show smooth curves approaching steady-state
- Control system plots should show convergence to `sdes`
- Check for overshoot and settling time

**Velocity Plots s'(t)**:
- Should start from zero (initial condition)
- Control system should show damped response
- Final value should approach zero (steady state)

**Acceleration Plots s''(t)**:
- Shows control effort and system dynamics
- Large initial values normal for step response
- Should decay to zero in steady state

**Angular Velocity ω(t)**:
- Only non-zero when f₁ ≠ f₂ (differential forces)
- Should be zero for scenarios with f₁ = f₂

### Comparing Methods

**Euler vs Improved Euler**:
- Improved Euler should be smoother
- Less numerical noise, especially for larger step sizes
- Better preservation of system energy

**Numerical vs Analytical**:
- Should match closely for linear regime
- Differences indicate nonlinear effects or numerical errors
- Validates correctness of implementation

## Troubleshooting

### Common Issues

**"Function not found" error**:
```
Error: 'problem_1_a_euler' undefined
```
**Solution**: Make sure you're in the correct directory containing the .m files

**Out of memory errors**:
```
Error: out of memory
```
**Solution**: Check array sizes - should be 30,000 elements max

**Figures not appearing**:
```matlab
% Try these commands:
figure(1); % Explicitly create figure
set(0,'DefaultFigureVisible','on'); % Ensure visibility
```

**Slow execution**:
- Normal for 30,000 time steps
- Expected runtime: 5-30 seconds depending on system
- Consider reducing time span for testing: `t = 0:0.01:5`

### MATLAB vs Octave Differences

**MATLAB specific features**:
- Better figure handling
- More sophisticated plotting options
- Faster execution generally

**Octave compatibility**:
- All core functions work identically
- Some plotting differences (colors, styles)
- May need `graphics_toolkit('gnuplot')` for complex plots

## Customization Guide

### Modifying Parameters

**Change student ID effects**:
```matlab
AM = 1234;  % Your student ID
% This affects: f1, f2, s0, bs, bu, Kds, sdes
```

**Adjust simulation parameters**:
```matlab
h = 0.01;          % Larger step size (faster, less accurate)
t_final = 10;      % Shorter simulation
t = 0:h:t_final;   % Update time vector accordingly
```

**Change system parameters**:
```matlab
m = 12;            % Different mass
Iz = 0.5;          % Different moment of inertia
d = 1.5;           % Different wheel separation
```

### Adding New Scenarios

**Example: Add third force scenario**:
```matlab
% In problem_1_a_euler.m, add after second scenario:
f1 = AM/6000;  % New force values
f2 = AM/9000;
% ... rest of computation code ...
% ... add new figures ...
```

**Example: Different control gains**:
```matlab
% In problem_1_3.m:
Kps = 10;          % Higher proportional gain
Kds = 25;          % Higher derivative gain
```

## Data Export and Analysis

### Saving Results

**Export data to file**:
```matlab
% After running problem_1_a_euler():
save('results.mat', 's', 's1', 's2', 't');

% Or export to CSV:
csvwrite('position.csv', [t' s']);
csvwrite('velocity.csv', [t' s1']);
```

**Save figures**:
```matlab
% High-quality figure export:
figure(1);
print('-dpng', '-r300', 'position_plot.png');
saveas(gcf, 'position_plot.fig');  % MATLAB format
```

### Data Analysis

**Basic statistics**:
```matlab
% After running simulation:
max_position = max(s);
settling_time = find(abs(s - sdes) < 0.02*sdes, 1) * h;
overshoot = (max(s) - sdes) / sdes * 100;

fprintf('Maximum position: %.3f m\n', max_position);
fprintf('Settling time: %.3f s\n', settling_time);
fprintf('Overshoot: %.1f%%\n', overshoot);
```

**Error analysis**:
```matlab
% Compare methods (after running both):
error_euler = s_euler - s_analytical;
error_improved = s_improved - s_analytical;

rms_error_euler = sqrt(mean(error_euler.^2));
rms_error_improved = sqrt(mean(error_improved.^2));

fprintf('RMS Error - Euler: %.6f\n', rms_error_euler);
fprintf('RMS Error - Improved: %.6f\n', rms_error_improved);
```

## Performance Optimization

### For Large Simulations

**Reduce memory usage**:
```matlab
% Store only every 10th point:
store_interval = 10;
s_reduced = s(1:store_interval:end);
t_reduced = t(1:store_interval:end);
```

**Vectorized operations** (where possible):
```matlab
% Instead of loops for post-processing:
energy = 0.5 * m * s1.^2;  % Kinetic energy vector
```

**Parallel processing** (MATLAB Parallel Computing Toolbox):
```matlab
% For parameter sweeps:
parfor i = 1:num_cases
    % Run simulation with different parameters
end
```

## Educational Extensions

### Learning Exercises

1. **Implement Runge-Kutta 4th order**:
   - Compare accuracy with Euler methods
   - Analyze computational cost vs accuracy trade-off

2. **Adaptive step size**:
   - Implement error estimation
   - Automatic step size adjustment

3. **Stability analysis**:
   - Find maximum stable step size
   - Plot stability regions

4. **Parameter sensitivity**:
   - Vary system parameters systematically
   - Analyze effect on system response

### Advanced Topics

1. **Nonlinear control**:
   - Implement PID controller
   - Add feedforward compensation

2. **State estimation**:
   - Add measurement noise
   - Implement Kalman filter

3. **Optimization**:
   - Optimal control gains
   - Minimum time/energy trajectories

## File Structure Recommendations

For organized results:
```
project/
├── src/                    # Source code (.m files)
├── results/               # Simulation results
│   ├── data/             # .mat files, .csv exports
│   └── figures/          # Generated plots
├── documentation/        # LaTeX report, figures
└── analysis/            # Post-processing scripts
```

## Getting Help

### Built-in MATLAB/Octave Help

```matlab
help problem_1_a_euler     % Function-specific help
doc ode45                  % MATLAB ODE solvers
lookfor differential       % Search for related functions
```

### Online Resources

- **MATLAB Documentation**: mathworks.com/help/matlab/
- **Octave Manual**: octave.org/doc/
- **Numerical Methods**: Burden & Faires textbook
- **Control Systems**: Ogata or Franklin textbooks

### Common MATLAB/Octave Functions Used

| Function | Purpose | Example |
|----------|---------|---------|
| `zeros()` | Initialize arrays | `s = zeros(1, 30000)` |
| `plot()` | Create line plots | `plot(t, s)` |
| `subplot()` | Multiple plots | `subplot(2,1,1)` |
| `figure()` | New figure window | `figure(1)` |
| `title()` | Add plot title | `title('Position vs Time')` |
| `xlabel()` | X-axis label | `xlabel('Time (s)')` |
| `ylabel()` | Y-axis label | `ylabel('Position (m)')` |
| `abs()` | Absolute value | `abs(s1(k))` |
| `exp()` | Exponential | `exp(r1*t)` |
| `sqrt()` | Square root | `sqrt(delta)` |

This guide should help you understand, run, modify, and extend the computational mathematics project effectively!