#include "pid.h"

float kp = 0.1;
float ki = 0.01;
float kd = 0.00;

float pre_error = 0;
float integral = 0;

float threshold = 0;

time_t start_time = clock();
double last_time = difftime(clock(),start_time);

float pid_Controller(float desired_p, float read_p){
  float output = 0;
  double current_time = difftime(clock(),start_time);
  double dt = (current_time - last_time)/100000; //update dt
  
  float error = desired_p - read_p;
  if(abs(error)>threshold){//如果差距大于阈值，则加入积分
	integral += error * dt;
  }
  float derivative = (error - pre_error)/(float)dt;
  
  output = kp * error + ki * integral + kd * derivative;//计算输出的偏移量
  last_time = current_time;
  return output;
}
