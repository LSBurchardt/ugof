% calculate the universal goodness-of-fit values for a given rhythm and
% sequence of start points

% 1) calculate theoretical start values 
    %1.1) 1000/rhythm to get time steps
    %1.2) samplenr. * time step/1000 -> time series of theoretical beat
    %1.3) how to know when to stop? 
    %1.4) take max from original times, check with while condition: while
    %theoretical time < max original time...
% 2) match original and theoretical start values to have least deviation
% 3) calculate deviation
% 4) calculate maximum possible deviation
% 5) calculate uGoF

%we need:
    % -for now we calculate it unbatched for one sequence and rhythm at the
    % time only
    % -original start time points (take from fft script)
    % -rhythm, maybe for now write that manually, needs to be changed 
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ugof
%% LOAD DATA
clear all

data = xlsread("C:\Users\Lara\Documents\07_Arbeit\MfN\Promotion\Perspective Paper\matlab sl4\zoom_sl4_3.xlsx"); 
data = data (:,1); 

% example data
%data = [0.1, 1.1, 2.1, 3.1,4.1,5.1,6.1,7.1,8.1,9.1];

rhythm = 14.6597; %type in manually

%% CALCULATIONS

% Theroretical Timeseries

maxoriginal = max(data);
timesteps = 1000/rhythm;
count = 0;
theotime_value = 0;
%theotime
while theotime_value < maxoriginal
    
    count = count + 1;
    theotime_value = count * timesteps /1000;
    theotime_seq(count) = theotime_value;

end

% Match Original to Theoretical Timeseries and calculate deviation

x = length(data);

for n = 1:x
    
minValue(n) = min(abs(data(n) - theotime_seq.'));

end 

% calculate uGof

maxdev = timesteps/2/1000;

ugof_value = minValue./maxdev;


m_ugof = mean(ugof_value);


% 
  