#include <iostream>
#include "pid.h"

#include "ros/ros.h"
#include "pid_node/output.h"
#include "pid_node/desired_pose.h"
#include "imu_node/real_pose.h"

using namespace std;

float desired_pose = 0;
float imu_pose = 0;

bool setAngel(		pid_node::desired_pose::Request &req,
			pid_node::desired_pose::Response &res){
	desired_pose = req.desired_angel;
	return true;
}

//give parameter to pid_Controller Function
void setIMUpose(const imu_node::real_pose::ConstPtr& real_pose){
  //pid_Controller(desired_pose,real_pose->real_pose);
  imu_pose = real_pose->real_pose;
}


int main(int argc, char **argv){
	//init ros node
	ros::init(argc,argv,"pid_node");//node name
	ros::NodeHandle n;
	//init output publish
	ros::Publisher output_pub = n.advertise<pid_node::output>("pid_output",1000);//chatter name
	ros::Rate loop_rate(50);
	//create a service to receive desired position
	ros::ServiceServer service = n.advertiseService("desired_angel", setAngel);
	//using serial or something to receive real position
	//here we get real position from imu node, So init a listener to get imu info from imu_node
	ros::Subscriber imu_sub = n.subscribe("real_pose_chat",1000, setIMUpose);
	//use output to sent to servo control node
	//here we calculate pid output every 2ms and send it to imu_node
	while(ros::ok()){
		pid_node::output output_msg;
		output_msg.servo_angel=pid_Controller(desired_pose,imu_pose);
		output_pub.publish(output_msg);
		ROS_INFO("desires_pose=%f\timu_pose=%f\toutput=%f.",desired_pose,imu_pose,output_msg.servo_angel);
		ros::spinOnce();
		loop_rate.sleep();
	}
	return 0;
}
