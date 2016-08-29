#include <iostream>

#include "ros/ros.h"
#include "pid_node/output.h"
#include "imu_node/real_pose.h"
//time and randon include
#include <cstdlib>
#include <ctime>

using namespace std;

float imu_pose = 0;

//this function are used to simulate the servo
void handle_output(const pid_node::output::ConstPtr& output){
//	ROS_INFO("got [%f]",output->servo_angel);
	//every time receive output from pid, add output to real_pose
	//then in while loop everytime add noise to real_pose and publish it
	imu_pose += output->servo_angel;
}

int main(int argc, char **argv){
	//seed my randon number
	srand(time(NULL));
	//open a imu node
	ros::init(argc, argv, "imu_node");//node name
	ros::NodeHandle n;
	//subscribe to pid output
	ros::Subscriber output_sub = n.subscribe("pid_output", 1000, handle_output);
	//init publisher
	ros::Publisher real_pose_pub = n.advertise<imu_node::real_pose>("real_pose_chat",1000);
	ros::Rate loop_rate(100);
	
	//keep sending real_pose to real_pose.msg, which will be subscribed by pid_Controller node
	while(ros::ok()){
		imu_node::real_pose realPoseMSG;
		//add random noise, from -0.1 ~ 0.1
        	//int r = (rand()%40-20);
		float noise = (float)(rand()%2000-1000)/10000;
		imu_pose += noise;
		realPoseMSG.real_pose = imu_pose;
		//ROS_INFO("noise = %f",noise);
		ROS_INFO("real_pose = %f", realPoseMSG.real_pose);
		real_pose_pub.publish(realPoseMSG);
		ros::spinOnce();
		loop_rate.sleep();
	}
	//ros::spin();
}
